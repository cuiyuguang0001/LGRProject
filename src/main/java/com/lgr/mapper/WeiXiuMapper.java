package com.lgr.mapper;

import com.lgr.pojo.WeiXiu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface WeiXiuMapper {

    @Select("select id, boat, people, status, dataline, money from ship_weixiu")
    List<WeiXiu> weixiuList(Map<String, Object> map);

}
