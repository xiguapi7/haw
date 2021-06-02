package cloud.xiguapi.haw.xss;

import cn.hutool.core.text.CharSequenceUtil;
import cn.hutool.http.HtmlUtil;
import cn.hutool.json.JSONUtil;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 抵御XSS攻击的HttpServletRequest装饰类
 *
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-2 下午 03:37
 * desc:
 */
public class XssHttpServletRequestWrapper extends HttpServletRequestWrapper {

    public XssHttpServletRequestWrapper(final HttpServletRequest request) {
        super(request);
    }

    @Override
    public String getHeader(final String name) {
        var value = super.getHeader(name);
        if (!CharSequenceUtil.hasEmpty(value)) {
            value = HtmlUtil.filter(value);
        }
        return value;
    }

    @Override
    public ServletInputStream getInputStream() throws IOException {
        try (var in = super.getInputStream()) {
            try (var reader = new InputStreamReader(in, StandardCharsets.UTF_8)) {
                try (var buffer = new BufferedReader(reader)) {
                    var body = new StringBuilder();
                    var line = buffer.readLine();
                    while (line != null) {
                        body.append(line);
                        line = buffer.readLine();
                    }

                    Map<String, Object> map = JSONUtil.parseObj(body.toString());
                    var result = new LinkedHashMap<String, Object>();
                    for (var key : map.keySet()) {
                        Object val = map.get(key);
                        if (val instanceof String) {
                            if (!CharSequenceUtil.hasEmpty(val.toString())) {
                                result.put(key, HtmlUtil.filter(val.toString()));
                            }
                        } else {
                            result.put(key, val);
                        }
                    }

                    var json = JSONUtil.toJsonStr(result);
                    var bain = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));

                    return new ServletInputStream() {
                        @Override
                        public boolean isFinished() {
                            return false;
                        }

                        @Override
                        public boolean isReady() {
                            return false;
                        }

                        @Override
                        public void setReadListener(final ReadListener listener) {

                        }

                        @Override
                        public int read() {
                            return bain.read();
                        }
                    };
                }
            }
        }
    }

    @Override
    public String getParameter(final String name) {
        var value = super.getParameter(name);
        if (!CharSequenceUtil.hasEmpty(value)) {
            // 转义过滤
            value = HtmlUtil.filter(value);
        }
        return value;
    }

    @Override
    public Map<String, String[]> getParameterMap() {
        Map<String, String[]> parameterMap = super.getParameterMap();
        LinkedHashMap<String, String[]> map = new LinkedHashMap<>();
        if (parameterMap != null) {
            for (var key : parameterMap.keySet()) {
                var values = parameterMap.get(key);
                for (var i = 0; i < values.length; i++) {
                    var value = values[i];
                    if (!CharSequenceUtil.hasEmpty(value)) {
                        // 转义过滤
                        value = HtmlUtil.filter(value);
                    }
                    values[i] = value;
                }
                map.put(key, values);
            }
        }
        return map;
    }

    @Override
    public String[] getParameterValues(final String name) {
        var values = super.getParameterValues(name);
        if (values != null) {
            for (var i = 0; i < values.length; i++) {
                var value = values[i];
                if (!CharSequenceUtil.hasEmpty(value)) {
                    // 转义过滤
                    value = HtmlUtil.filter(value);
                }
                values[i] = value;
            }
        }
        return values;
    }
}
