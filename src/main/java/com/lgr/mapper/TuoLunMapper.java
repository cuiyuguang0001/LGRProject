package com.lgr.mapper;

import com.lgr.pojo.TuoLun;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface TuoLunMapper {

    @Select("select id, boat, people, dataline, money from ship_tuolun")
    List<TuoLun> tuolunList(Map<String ,Object> map);

    @Insert("insert into ship_tuolun(boat, people, dataline, money) " +
            "values(#{boat}, #{people}, #{dataline}, #{money})")
    boolean tuolunAdd(TuoLun tuoLun);

    @Delete("delete from ship_tuolun where id = #{id}")
    boolean tuolunDel(TuoLun tuoLun);

    @Update("update ship_tuolun set status = #{status} where id = #{id}")
    boolean tuolunEditStatus(String status, String id);

}
