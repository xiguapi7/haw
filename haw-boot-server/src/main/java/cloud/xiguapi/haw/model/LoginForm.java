package cloud.xiguapi.haw.model;

import io.swagger.annotations.ApiModel;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * 登录表单
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021/6/24 23:04
 * desc:
 */
@ApiModel
@Data
public class LoginForm {

    @NotBlank(message = "临时授权字符串不能为空")
    private String code;
}
