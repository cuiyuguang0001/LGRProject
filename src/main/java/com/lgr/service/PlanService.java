package com.lgr.service;

import com.lgr.commitUtil.CommitUtil;
import com.lgr.commitUtil.MapUtil;
import com.lgr.constant.Constant;
import com.lgr.mapper.PlanMapper;
import com.lgr.pojo.Plan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PlanService {

    @Autowired
    PlanMapper planMapper;

    public Map<String ,Object> planList(Plan plan){
        List<Plan> plans = planMapper.planList(plan);
        for(Plan p : plans)
            p.setDataline(CommitUtil.timestampToStr(Long.valueOf(p.getDataline())));
        return MapUtil.requestMap(plans,
                planMapper.planListCount(plan),
                Constant.SUCCESS_REQUEST,
                Constant.SUCCESS);
    }

}
