package cloud.xiguapi.haw.shiro;

import org.springframework.stereotype.Component;

/**
 * 存储令牌的媒介类
 *
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-2 下午 11:14
 * desc:
 */
@Component("threadLocalToken")
public class ThreadLocalToken {

    private final ThreadLocal<String> local = new ThreadLocal<>();

    public String getToken() {
        return local.get();
    }

    public void setToken(String token) {
        local.set(token);
    }

    public void clear() {
        local.remove();
    }
}
