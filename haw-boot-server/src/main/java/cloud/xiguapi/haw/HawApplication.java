package cloud.xiguapi.haw;

import cloud.xiguapi.haw.db.mapper.SysConfigMapper;
import cloud.xiguapi.haw.model.SystemConstants;
import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

import javax.annotation.PostConstruct;

@SpringBootApplication
@ServletComponentScan
@Slf4j
public class HawApplication {

    private final SysConfigMapper sysConfigMapper;

    private final SystemConstants constants;

    @Autowired
    public HawApplication(SysConfigMapper sysConfigMapper, SystemConstants constants) {
        this.sysConfigMapper = sysConfigMapper;
        this.constants = constants;
    }

    public static void main(String[] args) {
        SpringApplication.run(HawApplication.class, args);
    }

    /**
     * 初始化缓存系统常量配置
     * 初始化方法, 加上@PostConsturct注解
     */
    @PostConstruct
    public void init() {
        // 读取常量配置列表
        var sysConfigList = sysConfigMapper.selectAllParam();
        // 循环列表对每个配置项进行处理
        sysConfigList.forEach(sysConfig -> {
            String key = sysConfig.getParamKey();
            // key在数据库中是使用_分割, 调用工具类转换为驼峰命名方式
            key = StrUtil.toCamelCase(key);
            String value = sysConfig.getParamValue();
            try {
                // 利用反射的Field类, 将key和value注入给SystemConstants这个组件
                var field = constants.getClass().getDeclaredField(key);
                field.setAccessible(true);
                field.set(constants, value);
            } catch (NoSuchFieldException | IllegalAccessException e) {
                log.error("初始化方法执行异常, 异常信息: {}", e.getMessage());
            }
        });

        // 显示常量配置类
        log.info("=========常量配置类信息=========");
        log.info("{}", constants);
    }
}
