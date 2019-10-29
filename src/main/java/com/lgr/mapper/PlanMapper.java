package com.lgr.mapper;

import com.lgr.pojo.Plan;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface PlanMapper {

    @Select("select id, type, dataline, people, boat, oil, status from ship_plan " +
            "limit #{page}, #{limit}")
    List<Plan> planList(Plan plan);
    @Select("select count(0) from ship_plan")
    int planListCount(Plan plan);

}
