package com.lgr.controller;

import com.lgr.pojo.Plan;
import com.lgr.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@CrossOrigin
@RestController
@RequestMapping("plan")
public class PlanController {

    @Autowired
    PlanService planService;

    public Map<String ,Object> planList(Plan plan){
        return planService.planList(plan);
    }

}
