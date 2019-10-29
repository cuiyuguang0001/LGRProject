package com.lgr.mapper;

import com.lgr.pojo.Boat;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface BoatMapper {

    @Select("select id, name, money, perople, dataline, updatedata, num, status " +
            "from ship_boat limit #{page}, #{limit}")
    List<Boat> boatList(Boat boat);

    @Select("select count(0) from ship_boat")
    int boatListCount(Boat boat);

}
