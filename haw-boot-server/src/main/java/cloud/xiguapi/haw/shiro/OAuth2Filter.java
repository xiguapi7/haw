package cloud.xiguapi.haw.shiro;

import cn.hutool.core.text.CharSequenceUtil;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpStatus;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.web.filter.authc.AuthenticatingFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * OAuth2 过滤类
 * 非javax传统Filter
 *
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-2 下午 11:29
 * desc:
 */
@Component
@Scope("prototype")
@Slf4j
public class OAuth2Filter extends AuthenticatingFilter {

    @Autowired
    private ThreadLocalToken threadLocalToken;

    @Value("${haw.jwt.cache-expire}")
    private int cacheExpire;

    @Autowired
    private JwtUtil jwt;

    @Autowired
    private RedisTemplate<String, String> redisTemplate;


    @Override
    protected AuthenticationToken createToken(final ServletRequest request, final ServletResponse response) throws Exception {
        var httpServletRequest = (HttpServletRequest) request;
        var token = getRequestToken(httpServletRequest);
        if (CharSequenceUtil.isBlank(token)) {
            return null;
        }
        return new OAuth2Token(token);
    }

    @Override
    protected boolean onLoginFailure(final AuthenticationToken token, final AuthenticationException e, final ServletRequest request, final ServletResponse response) {
        var resp = (HttpServletResponse) response;
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        resp.setHeader("Access-Control-Allow-Credentials", "true");
        resp.setHeader("Access-Control-Allow-Origin", "Origin");
        resp.setStatus(HttpStatus.SC_UNAUTHORIZED);
        try {
            resp.getWriter().println(e.getMessage());
        } catch (IOException ioException) {
            ioException.printStackTrace();
        }
        // 认证失败
        return false;
    }

    @Override
    protected boolean isAccessAllowed(final ServletRequest request, final ServletResponse response, final Object mappedValue) {
        return ((HttpServletRequest) request).getMethod().equalsIgnoreCase(RequestMethod.OPTIONS.name());
    }

    private String getRequestToken(HttpServletRequest request) {
        var token = request.getHeader("token");
        if (CharSequenceUtil.isBlank(token)) {
            token = request.getParameter("token");
        }
        return token;
    }

    @Override
    protected boolean onAccessDenied(final ServletRequest request, final ServletResponse response) throws Exception {
        var req = (HttpServletRequest) request;
        var resp = (HttpServletResponse) response;

        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        resp.setHeader("Access-Control-Allow-Credentials", "true");
        resp.setHeader("Access-Control-Allow-Origin", "Origin");

        threadLocalToken.clear();

        var token = getRequestToken(req);
        if (CharSequenceUtil.isBlank(token)) {
            // 如果token为空, 返回错误
            resp.setStatus(HttpStatus.SC_UNAUTHORIZED);
            resp.getWriter().println("无效的令牌");
            return false;
        }
        try {
            jwt.verifyToken(token);
        } catch (TokenExpiredException e) {
            // 判断redis中缓冲的令牌是否过期
            if (redisTemplate.hasKey(token)) {
                // 刷新缓存令牌, 先删除令牌再生成新的令牌并保存
                redisTemplate.delete(token);
                var userId = jwt.getUserId(token);
                token = jwt.createToken(userId);
                redisTemplate.opsForValue().set(token, userId + "", cacheExpire, TimeUnit.DAYS);
                threadLocalToken.setToken(token);
            } else {
                resp.setStatus(HttpStatus.SC_UNAUTHORIZED);
                resp.getWriter().println("令牌已过期");
                return false;
            }
        } catch (JWTDecodeException e) {
            resp.setStatus(HttpStatus.SC_UNAUTHORIZED);
            resp.getWriter().println("无效的令牌");
            return false;
        }

        return executeLogin(request, response);
    }

    @Override
    public void doFilterInternal(final ServletRequest request, final ServletResponse response, final FilterChain chain) throws ServletException, IOException {
        super.doFilterInternal(request, response, chain);
    }
}
