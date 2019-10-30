package com.lgr.mapper;

import com.lgr.pojo.DingDan;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface DingDanMapper {

    @Select("select id, type, name, num, util, dataline from ship_dingdan where type = #{type} limit #{page}, #{limit}")
    List<DingDan> dingDanList(DingDan dingDan);
    @Select("select count(0) from ship_dingdan where type = #{type}")
    int dingDanCount(DingDan dingDan);

    @Insert("insert into ship_dingdan(type, name, num, util, dataline) " +
            "values(#{type}, #{name}, #{num}, #{util}, #{dataline})")
    boolean dingdanAdd(DingDan dingDan);

    @Delete("delete from ship_dingdan where id = #{id}")
    boolean dingdanDel(DingDan dingDan);
}
