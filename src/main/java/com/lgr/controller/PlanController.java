package com.lgr.controller;

import com.lgr.pojo.Plan;
import com.lgr.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@CrossOrigin
@RestController
@RequestMapping("plan")
public class PlanController {

    @Autowired
    PlanService planService;

    @PostMapping("planList")
    public Map<String ,Object> planList(@RequestBody Plan plan){
        return planService.planList(plan);
    }

    @PostMapping("planAdd")
    public Map<String ,Object> planAdd(@RequestBody Plan plan){
        return planService.planAdd(plan);
    }

    @PostMapping("planEditStatus")
    public Map<String ,Object> planEditStatus(@RequestBody Plan plan){
        return planService.planEditStatus(plan);
    }

    @PostMapping("planDel")
    public Map<String ,Object> planDel(@RequestBody Plan plan){
        return planService.planDel(plan);
    }

}
