package cloud.xiguapi.haw.xss;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * XSS过滤器
 *
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-2 下午 04:02
 * desc:
 */
@WebFilter(urlPatterns = "/*")
public class XssFilter implements Filter {

    @Override
    public void init(final FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(final ServletRequest servletRequest, final ServletResponse servletResponse, final FilterChain chain) throws IOException, ServletException {
        var request = (HttpServletRequest) servletRequest;
        var wrapper = new XssHttpServletRequestWrapper(request);
        chain.doFilter(wrapper, servletResponse);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
