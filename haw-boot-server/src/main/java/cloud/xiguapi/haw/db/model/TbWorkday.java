package cloud.xiguapi.haw.db.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-2 下午 01:55
 * desc:
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TbWorkday {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 日期
     */
    private Date date;
}