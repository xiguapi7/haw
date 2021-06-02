package cloud.xiguapi.haw.shiro;

import org.apache.shiro.authc.AuthenticationToken;

/**
 * 令牌封装类
 *
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-2 下午 10:31
 * desc:
 */
public class OAuth2Token implements AuthenticationToken {

    private final String token;

    public OAuth2Token(final String token) {
        this.token = token;
    }

    @Override
    public Object getPrincipal() {
        return token;
    }

    @Override
    public Object getCredentials() {
        return token;
    }
}
