package com.lgr.mapper;

import com.lgr.pojo.WeiXiu;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface WeiXiuMapper {

    @Select("select id, boat, people, status, dataline, money, type from ship_weixiu where type = #{type}")
    List<WeiXiu> weixiuList(Map<String, Object> map);

    @Insert("insert into ship_weixiu(boat, people, status, dataline, money) " +
            "values(#{boat}, #{people}, 0, #{dataline}, #{money})")
    boolean weixiuAdd(WeiXiu weiXiu);

    @Delete("delete from ship_weixiu where id = #{id}")
    boolean weixiuDel(WeiXiu weiXiu);

    @Update("update ship_weixiu set status = #{status} where id = #{id}")
    boolean weixiuEditStatus(String status, String id);

}
