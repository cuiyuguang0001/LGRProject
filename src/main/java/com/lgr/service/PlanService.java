package com.lgr.service;

import com.lgr.commitUtil.CommitUtil;
import com.lgr.commitUtil.MapUtil;
import com.lgr.commitUtil.PageUtil;
import com.lgr.constant.Constant;
import com.lgr.mapper.BoatMapper;
import com.lgr.mapper.PlanMapper;
import com.lgr.mapper.UserMapper;
import com.lgr.pojo.Plan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class PlanService {

    @Autowired
    PlanMapper planMapper;
    @Autowired
    BoatMapper boatMapper;
    @Autowired
    UserMapper userMapper;

    public Map<String ,Object> planList(Plan plan){
        Map<String ,Object> map = new HashMap<>();
        PageUtil p = new PageUtil(plan.getPage(), plan.getLimit());
        map.put("page", p);
        map.put("status", plan.getStatus());
        List<Plan> plans = planMapper.planList(map);
        for(Plan p1 : plans)
            p1.setDataline(CommitUtil.timestampToStr(Long.valueOf(p1.getDataline())));
        return MapUtil.requestMap(plans,
                p.getCount(),
                Constant.SUCCESS_REQUEST,
                Constant.SUCCESS);
    }

    public Map<String ,Object> planAdd(Plan plan)
    {

        plan.setDataline(CommitUtil.getTineLine());
        if (!planMapper.planAdd(plan))
            return MapUtil.requestMap(null,false);
        return MapUtil.requestMap(null,true);
    }

    public Map<String ,Object> planEditStatus(Plan plan)
    {
        if(plan.getType().equals("0"))
        {
            //出港
            if(plan.getStatus().equals("1"))
            {
                Plan planModel = planMapper.planModel(plan.getId() + "");
                if (!userMapper.userEditStatus("1", planModel.getPeople()))
                    return MapUtil.requestMap(null,false);
                if (!boatMapper.boatEditUpdateStatus("1", "1", planModel.getBoat()))
                    return MapUtil.requestMap(null,false);
            }
        }else {
            //入港
            if(plan.getStatus().equals("1"))
            {
                Plan planModel = planMapper.planModel(plan.getId() + "");
                if (!userMapper.userEditStatus("0", planModel.getPeople()))
                    return MapUtil.requestMap(null,false);
                if (!boatMapper.boatEditUpdateStatus("0", "0", planModel.getBoat()))
                    return MapUtil.requestMap(null,false);
            }
        }

        if (!planMapper.planEditStatus(plan.getStatus(), plan.getTuolun(), plan.getId() + ""))
            return MapUtil.requestMap(null,false);
        return MapUtil.requestMap(null,true);
    }

    public Map<String ,Object> planDel(Plan plan)
    {
        if(!planMapper.planDel(plan))
            return MapUtil.requestMap(null,false);
        return MapUtil.requestMap(null,true);
    }

}
