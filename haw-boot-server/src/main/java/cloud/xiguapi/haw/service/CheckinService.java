package cloud.xiguapi.haw.service;

/**
 * 签到服务
 *
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021/6/25 13:46
 * desc:
 */
public interface CheckinService {

    String validCanCheckIn(int userId, String date);
}
