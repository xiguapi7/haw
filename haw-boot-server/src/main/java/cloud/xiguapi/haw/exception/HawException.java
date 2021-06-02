package cloud.xiguapi.haw.exception;

import lombok.Data;

/**
 * 自定义异常类
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-2 下午 02:19
 * desc:
 */
@Data
public class HawException extends RuntimeException {

    /**
     * 异常信息
     */
    private final String msg;
    /**
     * 异常代码 500
     */
    private int code = 500;

    public HawException(String msg) {
        super(msg);
        this.msg = msg;
    }

    public HawException(String msg, Throwable e) {
        super(msg, e);
        this.msg = msg;
    }

    public HawException(int code, String msg) {
        super(msg);
        this.code = code;
        this.msg = msg;
    }

    public HawException(int code, String msg, Throwable e) {
        super(msg, e);
        this.code = code;
        this.msg = msg;
    }
}
