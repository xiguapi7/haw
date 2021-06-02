package cloud.xiguapi.haw.aop;

import cloud.xiguapi.haw.common.R;
import cloud.xiguapi.haw.shiro.ThreadLocalToken;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Token切面
 *
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-3 上午 12:27
 * desc:
 */
@Aspect
@Component
public class TokenAspect {

    @Autowired
    private ThreadLocalToken threadLocalToken;

    @Pointcut("execution(public * cloud.xiguapi.haw.controller.*.*(..))")
    public void aspect() {

    }

    /**
     * 环绕通知
     *
     * @param point 切点
     * @return {@link R}
     * @throws Throwable 切面抛出异常
     */
    @Around("aspect()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        // 0. 执行方法, 获取返回的R对象
        var r = (R) point.proceed();

        // 1. 获取token
        var token = threadLocalToken.getToken();

        // 2. 判断, 如果ThreadLocal中存在Token, 说明是更新的Token.
        if (token != null) {
            // 往响应中存放token
            r.put("token", token);
            threadLocalToken.clear();
        }
        // 3. 返回增强后的r对象
        return r;
    }
}
