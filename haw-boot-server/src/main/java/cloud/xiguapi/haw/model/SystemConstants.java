package cloud.xiguapi.haw.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;

/**
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021/6/25 12:16
 * desc:
 */
@Getter
@Setter
@EqualsAndHashCode
@RequiredArgsConstructor
@Component
public class SystemConstants {

    /**
     * 上班考勤开始时间
     */
    private String attendanceStartTime;

    /**
     * 上班时间
     */
    private String attendanceTime;

    /**
     * 上班考勤截止时间
     */
    private String attendanceEndTime;

    /**
     * 下班考勤开始时间
     */
    private String closingStartTime;

    /**
     * 下班时间
     */
    private String closingTime;

    /**
     * 下班考勤截止时间
     */
    private String closingEndTime;

    @Override
    public String toString() {
        return String.format("上班考勤开始时间(attendanceStartTime) = %s, " +
                        "上班时间(attendanceTime) = %s, " +
                        "上班考勤截止时间(attendanceEndTime) = %s, " +
                        "下班考勤开始时间(closingStartTime) = %s, " +
                        "下班时间(closingTime) = %s, " +
                        "下班考勤截止时间(closingEndTime) = %s\n",
                this.attendanceStartTime,
                this.attendanceTime,
                this.attendanceEndTime,
                this.closingStartTime,
                this.closingTime,
                this.closingEndTime);
    }
}
