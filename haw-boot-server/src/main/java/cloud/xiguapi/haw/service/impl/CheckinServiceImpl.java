package cloud.xiguapi.haw.service.impl;

import cloud.xiguapi.haw.db.mapper.TbCheckinMapper;
import cloud.xiguapi.haw.db.mapper.TbHolidaysMapper;
import cloud.xiguapi.haw.db.mapper.TbWorkdayMapper;
import cloud.xiguapi.haw.model.SystemConstants;
import cloud.xiguapi.haw.service.CheckinService;
import cn.hutool.core.date.DateUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import java.util.HashMap;

/**
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021/6/25 13:46
 * desc:
 */
@Service
@Scope("prototype")
@Slf4j
public class CheckinServiceImpl implements CheckinService {

    private final SystemConstants constants;

    private final TbHolidaysMapper holidaysMapper;

    private final TbWorkdayMapper workdayMapper;

    private final TbCheckinMapper checkinMapper;

    @Autowired
    public CheckinServiceImpl(SystemConstants constants, TbHolidaysMapper holidaysMapper, TbWorkdayMapper workdayMapper, TbCheckinMapper checkinMapper) {
        this.constants = constants;
        this.holidaysMapper = holidaysMapper;
        this.workdayMapper = workdayMapper;
        this.checkinMapper = checkinMapper;
    }

    @Override
    public String validCanCheckIn(int userId, String date) {
        boolean isHoliday = holidaysMapper.searchTodayIsHolidays() != null;
        boolean isWorkday = workdayMapper.searchTodayIsWorkday() != null;

        var type = "工作日";

        if (DateUtil.date().isWeekend()) {
            type = "节假日";
        }

        if (isHoliday) {
            type = "节假日";
        } else if (isWorkday) {
            type = "工作日";
        }

        if (type.equals("节假日")) {
            return "节假日不需要考勤";
        } else {
            var now = DateUtil.date();
            var start = DateUtil.today() + " " + constants.getAttendanceStartTime();
            var end = DateUtil.today() + " " + constants.getAttendanceEndTime();

            var attendanceStart = DateUtil.parse(start);
            var attendanceEnd = DateUtil.parse(end);

            if (now.isBefore(attendanceStart)) {
                return "没有到上班考勤开始时间";
            } else if (now.isAfter(attendanceEnd)) {
                return "超过了上班考勤截止时间";
            } else {
                var map = new HashMap<String, Object>();
                map.put("userId", userId);
                map.put("date", date);
                map.put("start", start);
                map.put("end", end);

                var isCheckin = checkinMapper.haveCheckin(map) != null;
                return isCheckin ? "今日已经考勤, 无需重复考勤" : "可以考勤";
            }
        }
    }
}
