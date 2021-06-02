package cloud.xiguapi.haw.db.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-2 下午 01:55
 * desc:
 */

/**
 * 模块资源表
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TbModule {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 模块编号
     */
    private String moduleCode;

    /**
     * 模块名称
     */
    private String moduleName;
}