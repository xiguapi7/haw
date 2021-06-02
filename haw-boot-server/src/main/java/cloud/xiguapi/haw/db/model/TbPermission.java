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
public class TbPermission {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 权限
     */
    private String permissionName;

    /**
     * 模块ID
     */
    private Integer moduleId;

    /**
     * 行为ID
     */
    private Integer actionId;
}