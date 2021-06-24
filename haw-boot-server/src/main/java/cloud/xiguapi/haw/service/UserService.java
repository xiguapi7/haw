package cloud.xiguapi.haw.service;

import java.util.Set;

/**
 * 用户服务接口
 *
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-3 下午 05:27
 * desc:
 */
public interface UserService {

    /**
     * 注册用户
     *
     * @param registerCode 激活码, 判断是超级管理员还是普通员工
     * @param code         临时授权码
     * @param nickname     微信昵称
     * @param photo        微信头像地址
     * @return 返回员工主键值
     */
    int registerUser(String registerCode, String code, String nickname, String photo);

    /**
     * 根据用户ID查询用户权限集合
     *
     * @param userId 用户ID
     * @return 用户权限集合
     */
    Set<String> searchUserPermissions(int userId);

    /**
     * 用户登录
     *
     * @param code 临时授权字符串
     * @return 用户主键
     */
    Integer login(String code);
}
