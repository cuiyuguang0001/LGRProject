package com.lgr.mapper;

import com.lgr.pojo.Boat;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoatMapper {

    @Select("select id, name, money, people, dataline, updatedata, num, status " +
            "from ship_boat")
    List<Boat> boatList(Map<String ,Object> map);

    @Insert("insert into ship_boat(name, money, people, dataline, updatedata, num, status) " +
            "values(#{name}, #{money}, #{people}, #{dataline}, 0, 0, 0)")
    boolean boatAdd(Boat boat);

    @Delete("delete from ship_boat where id = #{id}")
    boolean boatDel(Boat boat);

    @Update("update ship_boat set name = #{name}, money = #{money}, people = #{people} where id = #{id}")
    boolean boatEdit(Boat boat);

    @Update("update ship_boat set updatedata = #{data} where id = #{id}")
    boolean boatEditUpdatedata(String data, String id);

    @Update("update ship_boat set num = num + #{num}, status = #{status} where name = #{name}")
    boolean boatEditUpdateStatus(String status, String num,String name);

}
