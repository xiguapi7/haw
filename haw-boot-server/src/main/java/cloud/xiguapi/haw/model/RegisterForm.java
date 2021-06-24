package cloud.xiguapi.haw.model;

import io.swagger.annotations.ApiModel;
import lombok.Builder;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

/**
 * 注册表单实体
 *
 * <p>
 *
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-3 下午 09:01
 * desc:
 */
@Data
@Builder
@ApiModel(description = "注册表单实体")
public class RegisterForm implements Serializable {

    /**
     * 激活码, 码为6位数字, 需要正则表达式验证
     */
    @NotBlank(message = "激活码不能为空")
    @Pattern(regexp = "^[0-9]{6}$", message = "激活码必须是6位数字")
    private String registerCode;

    /**
     * 微信临时授权码
     */
    @NotBlank(message = "微信临时授权不能为空")
    private String code;

    /**
     * 昵称
     */
    @NotBlank(message = "昵称不能为空")
    private String nickname;

    /**
     * 头像地址
     */
    @NotBlank(message = "头像不能为空")
    private String photo;
}
