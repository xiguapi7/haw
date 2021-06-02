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
 * 疫情城市列表
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TbCity {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 城市名称
     */
    private String city;

    /**
     * 拼音简称
     */
    private String code;
}