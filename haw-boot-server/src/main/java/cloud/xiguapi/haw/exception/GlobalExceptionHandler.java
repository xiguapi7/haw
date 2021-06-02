package cloud.xiguapi.haw.exception;

import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Objects;

/**
 * 全局异常拦截捕获
 *
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-3 上午 12:40
 * desc:
 */
@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(Exception.class)
    public String validExceptionHandler(Exception e) {
        log.error("执行异常 ", e);
        if (e instanceof MethodArgumentNotValidException) {
            // 精简参数校验异常的异常消息
            MethodArgumentNotValidException exception = (MethodArgumentNotValidException) e;
            return Objects.requireNonNull(exception.getBindingResult().getFieldError()).getDefaultMessage();
        } else if (e instanceof HawException) {
            // 精简自定义异常的异常消息
            HawException exception = (HawException) e;
            return exception.getMsg();
        } else if (e instanceof UnauthorizedException) {
            return "你不具备相关权限";
        } else {
            return "后端执行异常";
        }
    }
}
