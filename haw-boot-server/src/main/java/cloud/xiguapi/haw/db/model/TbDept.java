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
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TbDept {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 部门名称
     */
    private String deptName;
}