package cloud.xiguapi.haw.common;

import lombok.Data;
import org.apache.http.HttpStatus;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * 封装Web响应对象
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-2 下午 02:31
 * desc:
 */
@Data
public class R extends HashMap<String, Object> implements Serializable {

    public R() {
        put("code", HttpStatus.SC_OK);
        put("msg", "success");
    }

    public static R ok() {
        return new R();
    }

    public static R ok(String msg) {
        var r = new R();
        r.put("msg", msg);
        return r;
    }

    public static R ok(Map<String, Object> map) {
        var r = new R();
        r.putAll(map);
        return r;
    }

    public static R error() {
        return error(HttpStatus.SC_INTERNAL_SERVER_ERROR, "未知异常，请联系管理员！");
    }

    public static R error(String msg) {
        return error(HttpStatus.SC_INTERNAL_SERVER_ERROR, msg);
    }

    public static R error(int code, String msg) {
        var r = new R();
        r.put("code", code);
        r.put("msg", msg);
        return r;
    }

    @Override
    public R put(String key, Object value) {
        super.put(key, value);
        return this;
    }
}
