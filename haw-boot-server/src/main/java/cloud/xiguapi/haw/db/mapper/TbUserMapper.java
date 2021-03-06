package cloud.xiguapi.haw.db.mapper;

import cloud.xiguapi.haw.db.model.TbUser;

import java.util.HashMap;
import java.util.Set;

/**
 * 用户Mapper接口
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-2 下午 01:55
 * desc:
 */
public interface TbUserMapper {

    /**
     * 查询是否有超级管理员, 并以boolean类型返回, 数据库中的root字段是tinyint, 需要用IF函数转换
     *
     * @return 查询的布尔结果
     */
    boolean haveRootUser();

    /**
     * 插入员工信息
     *
     * @param parameters 员工信息参数Map
     * @return 返回执行结果受影响条数
     */
    int insert(HashMap<String, Object> parameters);

    /**
     * 查询openId是否存在
     * 根据openId查询用户ID, 返回Integer类型是防止查询出现null值导致系统出错
     *
     * @param openId 微信上的openId对应一个微信用户ID, 但微信用户ID不能实际获取, 只能通过openId代劳
     *               在小程序中每个用户的openId都是唯一不变的
     * @return 用户ID
     */
    Integer searchIdByOpenId(String openId);

    /**
     * 查询用户权限集合
     *
     * @param userId 用户ID
     * @return 权限集合
     */
    Set<String> searchUserPermissions(int userId);

    /**
     * 根据主键查询用户信息
     *
     * @param userId 用户ID
     * @return 用户信息实体
     */
    TbUser searchById(int userId);
}