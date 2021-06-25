package cloud.xiguapi.haw.shiro;

import cloud.xiguapi.haw.db.model.TbUser;
import cloud.xiguapi.haw.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Set;

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

    private final Jwt jwt;

    private final UserService userService;

    @Autowired
    public OAuth2Realm(final Jwt jwt, UserService userService) {
        this.jwt = jwt;
        this.userService = userService;
    }

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof OAuth2Token;
    }

    /**
     * 认证（验证登录时调用）
     *
     * @param token 令牌封装对象
     * @return 认证信息对象
     * @throws AuthenticationException 认证失败异常
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        var accessToken = (String) token.getPrincipal();
        int userId = jwt.getUserId(accessToken);
        // 查询用户信息
        var user = userService.searchById(userId);
        if (user == null) {
            throw new LockedAccountException("账号已被锁定, 请联系管理员");
        }

        // 往info对象中添加用户信息、Token字符串
        return new SimpleAuthenticationInfo(user, accessToken, getName());
    }

    /**
     * 授权（验证权限时调用）
     * 授权方法在认证方法通过后自动执行
     *
     * @param collection 认证对象
     * @return 验证信息
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection collection) {
        var user = (TbUser) collection.getPrimaryPrincipal();
        int userId = user.getId();
        // 查询用户权限列表
        Set<String> permissions = userService.searchUserPermissions(userId);

        var info = new SimpleAuthorizationInfo();
        // 把权限列表添加到info对象中
        info.setStringPermissions(permissions);

        return info;
    }
}
