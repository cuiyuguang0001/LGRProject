package com.lgr.controller;

import com.lgr.pojo.WeiXiu;
import com.lgr.service.WeiXiuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@CrossOrigin
@RequestMapping("weixiu")
public class WeiXiuController {

    @Autowired
    WeiXiuService weiXiuService;

    @PostMapping("weixiuList")
    public Map<String ,Object> weixiuList(@RequestBody WeiXiu weiXiu)
    {
        return weiXiuService.weixiuList(weiXiu);
    }

}
