package com.lgr.controller;

import com.lgr.pojo.DingDan;
import com.lgr.service.DingDanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@CrossOrigin
@RestController
@RequestMapping("dingdan")
public class DingDanController {

    @Autowired
    DingDanService dingDanService;

    @PostMapping("dingdanList")
    public Map<String ,Object> dingDanList(DingDan dingDan)
    {
        return dingDanService.dingDanList(dingDan);
    }

}
