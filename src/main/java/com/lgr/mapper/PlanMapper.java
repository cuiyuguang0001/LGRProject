package com.lgr.mapper;

import com.lgr.pojo.Plan;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface PlanMapper {

    @Select("select id, type, dataline, people, boat, oil, status from ship_plan " +
            "limit #{page}, #{limit}")
    List<Plan> planList(Plan plan);
    @Select("select count(0) from ship_plan")
    int planListCount(Plan plan);
    @Select("select id, type, dataline, people, boat, oil, status from ship_plan where id = #{id}")
    Plan planModel(String id);

    @Insert("insert into ship_plan(type, dataline, people, boat, oil, status) " +
            "values(#{type}, #{dataline}, #{people}, #{boat}, #{oil}, 0)")
    boolean planAdd(Plan plan);

    @Update("update ship_plan set status = #{status} where id = #{id}")
    boolean planEditStatus(String status, String id);

    @Delete("delete from plan where id = #{id} and status <> 0")
    boolean planDel(Plan plan);

}
