package cloud.xiguapi.haw.db.mapper;

import cloud.xiguapi.haw.db.model.TbUser;

/**
 * @author 大大大西西瓜皮🍉
 * date: 2021-6-2 下午 01:55
 * desc:
 */
public interface TbUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TbUser record);

    int insertSelective(TbUser record);

    TbUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TbUser record);

    int updateByPrimaryKey(TbUser record);
}