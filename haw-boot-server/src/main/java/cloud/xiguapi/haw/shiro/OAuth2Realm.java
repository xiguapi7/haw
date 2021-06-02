package cloud.xiguapi.haw.shiro;

import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * 令牌认证与授权类
 *
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-2 下午 10:35
 * desc:
 */
@Component
@Slf4j
public class OAuth2Realm extends AuthorizingRealm {

    @Resource(name = "jwtUtil")
    private JwtUtil jwtUtil;

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof OAuth2Token;
    }

    /**
     * 认证（登录时调用）
     *
     * @param token 令牌封装对象
     * @return 认证信息对象
     * @throws AuthenticationException 认证失败异常
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        // TODO 从令牌中获取userId, 然后检测该账号是否被冻结
        var info = new SimpleAuthenticationInfo();
        // TODO 往info对象中添加用户信息、Token字符串
        return info;
    }

    /**
     * 授权（验证权限时调用）
     *
     * @param principals
     * @return 验证信息
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        var info = new SimpleAuthorizationInfo();

        // TODO 查询用户的权限列表
        // TODO 把权限列表添加到info对象中

        return info;
    }
}
