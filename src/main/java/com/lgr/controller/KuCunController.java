package com.lgr.controller;

import com.lgr.pojo.KuCun;
import com.lgr.service.KuCunService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@CrossOrigin
@RestController
@RequestMapping("kucun")
public class KuCunController {

    @Autowired
    KuCunService kuCunService;

    @PostMapping("kucunList")
    public Map<String, Object> kucunList(@RequestBody KuCun kuCun)
    {
        return kuCunService.kucunList(kuCun);
    }

}
