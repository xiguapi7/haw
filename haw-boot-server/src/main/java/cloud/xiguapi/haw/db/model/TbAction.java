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
 * 行为表
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TbAction {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 行为编号
     */
    private String actionCode;

    /**
     * 行为名称
     */
    private String actionName;
}