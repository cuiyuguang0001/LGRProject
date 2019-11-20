package com.lgr.mapper;

import com.lgr.pojo.Plan;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface PlanMapper {

    @Select("select id, type, dataline, people, boat, oil, status, tuolun from ship_plan where status = #{status}")
    List<Plan> planList(Map<String ,Object> map);
    @Select("select id, type, dataline, people, boat, oil, status, tuolun from ship_plan where id = #{id}")
    Plan planModel(String id);

    @Insert("insert into ship_plan(type, dataline, people, boat, oil, status, tuolun) " +
            "values(#{type}, #{dataline}, #{people}, #{boat}, #{oil}, 0)")
    boolean planAdd(Plan plan);

    @Update("update ship_plan set status = #{status}, tuolun = #{tuolun} where id = #{id}")
    boolean planEditStatus(String status, String id);

    @Delete("delete from plan where id = #{id} and status <> 0")
    boolean planDel(Plan plan);

}
