package cloud.xiguapi.haw.shiro;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateUtil;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import lombok.extern.slf4j.XSlf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * JWT工具类
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-2 下午 09:56
 * desc:
 */
@Component
@XSlf4j
public class JwtUtil {

    @Value("${haw.jwt.secret}")
    private String secret;

    @Value("${haw.jwt.expire}")
    private int expire;

    public String createToken(int userId) {
        var date = DateUtil.offset(new Date(), DateField.DAY_OF_YEAR, 5);
        var algorithm = Algorithm.HMAC256(secret);
        var builder = JWT.create();
        return builder.withClaim("userId", userId).withExpiresAt(date).sign(algorithm);
    }

    public int getUserId(String token) {
        var jwt = JWT.decode(token);
        return jwt.getClaim("userId").asInt();
    }

    public void verifyToken(String token) {
        var algorithm = Algorithm.HMAC256(secret);
        var verifier = JWT.require(algorithm).build();
        verifier.verify(token);
    }
}
