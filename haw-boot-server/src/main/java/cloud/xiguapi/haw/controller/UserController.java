package cloud.xiguapi.haw.controller;

import cloud.xiguapi.haw.common.R;
import cloud.xiguapi.haw.model.LoginForm;
import cloud.xiguapi.haw.model.RegisterForm;
import cloud.xiguapi.haw.service.UserService;
import cloud.xiguapi.haw.shiro.Jwt;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.concurrent.TimeUnit;

/**
 * 用户控制器
 *
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-3 下午 09:07
 * desc:
 */
@RestController
@RequestMapping("/user")
@Api("用户模块Web接口")
@Slf4j
public class UserController {

    private final UserService userService;

    private final Jwt jwt;

    private final RedisTemplate<String, String> redisTemplate;

    /**
     * 缓存过期时间
     */
    @Value("${haw.jwt.cache-expire}")
    private int cacheExpire;

    @Autowired
    public UserController(UserService userService, Jwt jwt, RedisTemplate<String, String> redisTemplate) {
        this.userService = userService;
        this.jwt = jwt;
        this.redisTemplate = redisTemplate;
    }

    @PostMapping("/login")
    @ApiOperation("登录系统")
    public R login(@Valid @RequestBody LoginForm form) {
        var id = userService.login(form.getCode());
        var token = jwt.createToken(id);
        var permissions = userService.searchUserPermissions(id);
        saveCacheToken(token, id);
        return R.ok("登录成功")
                .put("token", token)
                .put("permission", permissions);
    }

    /**
     * 注册用户
     *
     * @param form 用户注册表单实体
     * @return 注册结果的R对象
     */
    @PostMapping("/register")
    @ApiOperation("注册用户")
    public R register(@Valid @RequestBody RegisterForm form) {
        // 0. 注册用户, 返回用户ID
        var userId = userService.registerUser(form.getRegisterCode(), form.getCode(), form.getNickname(), form.getPhoto());

        // 1. 根据用户ID生成token
        var token = jwt.createToken(userId);

        // 2.根据用户ID查询用户权限集合
        var permissionSet = userService.searchUserPermissions(userId);

        // 3. 缓存用户token到redis
        saveCacheToken(token, userId);

        // 4. 封装R并返回
        var r = R.ok("用户注册成功");
        r.put("token", token);
        r.put("permission", permissionSet);
        return r;
    }

    /**
     * token缓存到redis
     * 格式: token: userId
     *
     * @param token  key: token值
     * @param userId value: 用户ID
     */
    private void saveCacheToken(final String token, final int userId) {
        // token缓存到redis, 并设置缓存过期时间
        redisTemplate.opsForValue().set(token, userId + "", cacheExpire, TimeUnit.DAYS);
    }
}
