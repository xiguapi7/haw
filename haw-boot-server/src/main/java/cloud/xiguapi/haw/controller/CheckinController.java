package cloud.xiguapi.haw.controller;

import cloud.xiguapi.haw.common.R;
import cloud.xiguapi.haw.service.CheckinService;
import cloud.xiguapi.haw.shiro.Jwt;
import cn.hutool.core.date.DateUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021/6/25 16:10
 * desc:
 */
@RestController
@RequestMapping("/checkin")
@Api("签到模块Web接口")
@Slf4j
public class CheckinController {

    private final CheckinService checkinService;

    private final Jwt jwt;

    @Autowired
    public CheckinController(CheckinService checkinService, Jwt jwt) {
        this.checkinService = checkinService;
        this.jwt = jwt;
    }

    @GetMapping("/validCanCheckIn")
    @ApiOperation("查看用户今天是否能够签到")
    public R validCanCheckIn(@RequestHeader("token") String token) {
        var userId = jwt.getUserId(token);
        var result = checkinService.validCanCheckIn(userId, DateUtil.today());
        return R.ok(result);
    }
}
