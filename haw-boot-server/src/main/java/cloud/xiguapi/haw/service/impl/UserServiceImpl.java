package cloud.xiguapi.haw.service.impl;

import cloud.xiguapi.haw.db.mapper.TbUserMapper;
import cloud.xiguapi.haw.exception.HawException;
import cloud.xiguapi.haw.service.UserService;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.Set;

/**
 * 用户服务实现类
 * 需要声明为多例
 *
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-3 下午 05:45
 * desc:
 */
@Service
@Scope("prototype")
@Slf4j
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService {

    /**
     * 微信临时授权码换取openId的接口地址常量
     */
    private static final String WX_URL = "https://api.weixin.qq.com/sns/jscode2session";
    /**
     * 超级管理员在MySQL数据库中的JSON字段的数组值
     */
    private static final String ROOT_ROLE = "[0]";
    /**
     * 超级管理员的激活码常量
     */
    private static final String ROOT_REGISTER_CODE = "000000";
    private final TbUserMapper userMapper;
    @Value("${wx.app-id}")
    private String appId;
    @Value("${wx.app-secret}")
    private String appSecret;

    @Autowired
    public UserServiceImpl(TbUserMapper userMapper) {
        this.userMapper = userMapper;
    }

    /**
     * 注册用户
     *
     * @param registerCode 激活码, 判断是超级管理员还是普通员工
     * @param code         临时授权码
     * @param nickname     微信昵称
     * @param photo        微信头像地址
     * @return 返回员工主键值
     */
    @Transactional(rollbackFor = HawException.class)
    @Override
    public int registerUser(String registerCode, String code, String nickname, String photo) {
        // 0. 判断激活码是超级管理员还是员工
        if (ROOT_REGISTER_CODE.equals(registerCode)) {
            // 0.0 查询root用户是否已经绑定
            boolean haveRootUser = userMapper.haveRootUser();

            if (!haveRootUser) {
                // 0.1 root用户未绑定, 把当前用户信息绑定到ROOT账号
                String openId = getOpenId(code);
                HashMap<String, Object> parameters = new HashMap<>();
                parameters.put("openId", openId);
                parameters.put("photo", photo);
                parameters.put("nickname", nickname);
                parameters.put("role", ROOT_ROLE);
                parameters.put("status", 1);
                parameters.put("createTime", new Date());
                parameters.put("root", true);
                return userMapper.insert(parameters);
            } else {
                // 0.2 root用户已经绑定, 抛出自定义异常
                throw new HawException("无法绑定超级管理员");
            }
        }

        // TODO 其他判断

        return -1;
    }

    /**
     * 根据用户ID查询用户权限集合
     *
     * @param userId 用户ID
     * @return 用户权限集合
     */
    @Override
    public Set<String> searchUserPermissions(int userId) {
        return userMapper.searchUserPermissions(userId);
    }


    /**
     * 根据临时授权码到微信上换取openId
     *
     * @param code 临时授权码
     * @return 换取后的openId
     */
    private String getOpenId(String code) {
        // 0. 封装请求参数
        HashMap<String, Object> parameters = new HashMap<>();
        parameters.put("appId", appId);
        parameters.put("appSecret", appSecret);
        parameters.put("js_code", code);
        parameters.put("grant_type", "authorization_code");

        // 1. 发送请求
        // var responseJson = HttpUtil.post(WX_URL, parameters);
        var url = String.format("%s?appid=%s&secret=%s&js_code=%s&grant_type=authorization_code",
                WX_URL, appId, appSecret, code);
        var responseJson = HttpUtil.get(url);

        // 2. 将响应的JSON字符串转换为对象
        var json = JSONUtil.parseObj(responseJson);

        // 3. 从JSON对象中提取openId
        var openId = json.getStr("openid");
        if (openId == null || openId.length() == 0) {
            // 如果openId为空或者长度为0, 抛出RuntimeException
            throw new HawException("临时登录凭证错误");
        }

        // 4. 返回获取到的openId
        return openId;
    }

    @Override
    public Integer login(String code) {
        return null;
    }
}
