package cloud.xiguapi.haw.config;

import io.swagger.annotations.ApiOperation;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiKey;
import springfox.documentation.service.AuthorizationScope;
import springfox.documentation.service.SecurityReference;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;
import java.util.List;

/**
 * Swagger配置类
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-2 下午 02:47
 * desc:
 */
@Configuration
@EnableSwagger2
public class SwaggerConfiguration {

    public static final String TOKEN = "token";

    @Bean
    public Docket createDocket() {
        var docket = new Docket(DocumentationType.SWAGGER_2);

        var apiInfoBuilder = new ApiInfoBuilder();
        // 设置标题
        apiInfoBuilder.title("Haw在线办公系统");
        var info = apiInfoBuilder.build();

        // 传入ApiInfo
        docket.apiInfo(info);

        var selectorBuilder = docket.select();
        selectorBuilder.paths(PathSelectors.any());
        // 过滤, 带有@ApiOperation才添加到Selector
        selectorBuilder.apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class));
        docket = selectorBuilder.build();

        //// 使得Swagger支持JWT
        var apiKey = new ApiKey(TOKEN, TOKEN, "header");
        List<ApiKey> apiKeyList = new ArrayList<>();
        apiKeyList.add(apiKey);
        docket.securitySchemes(apiKeyList);
        // 认证对象
        var scope = new AuthorizationScope("global", "accessEverything");
        var scopes = new AuthorizationScope[]{scope};
        var reference = new SecurityReference(TOKEN, scopes);
        List<SecurityReference> refList = new ArrayList<>();
        refList.add(reference);
        SecurityContext context = SecurityContext.builder().securityReferences(refList).build();
        List<SecurityContext> contextList = new ArrayList<>();
        contextList.add(context);

        // 将认证上下文交给Docket
        docket.securityContexts(contextList);

        return docket;
    }
}
