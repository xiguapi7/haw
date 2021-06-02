package cloud.xiguapi.haw.controller;

import cloud.xiguapi.haw.common.Form;
import cloud.xiguapi.haw.common.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * 测试Controller
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-2 下午 03:03
 * desc:
 */
@RestController
@RequestMapping("/test")
@Api("测试Web接口")
public class TestController {

    @GetMapping("/hello")
    @ApiOperation("最简单的测试方法")
    public R sayHello() {
        return R.ok().put("message", "hello");
    }

    @PostMapping("/sayHello")
    @ApiOperation("带参数的测试方法")
    public R sayHello(@Valid @RequestBody Form form) {
        return R.ok().put("sayHello", "你好，" + form.getName());
    }
}
