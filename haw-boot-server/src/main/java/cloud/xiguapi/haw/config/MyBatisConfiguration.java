package cloud.xiguapi.haw.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

/**
 * MyBatis配置类
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-2 下午 01:58
 * desc:
 */
@Configuration
@MapperScan(basePackages = "cloud.xiguapi.haw.db.mapper")
public class MyBatisConfiguration {

}
