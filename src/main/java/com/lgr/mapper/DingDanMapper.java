package com.lgr.mapper;

import com.lgr.pojo.DingDan;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface DingDanMapper {

    @Select("select id, type, name, num, util, dataline from ship_dingdan limit #{page}, #{limit}")
    List<DingDan> dingDanList(DingDan dingDan);
    @Select("select count(0) from ship_dingdan")
    int dingDanCount(DingDan dingDan);

}
