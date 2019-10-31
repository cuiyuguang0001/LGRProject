package com.lgr.controller;

import com.lgr.pojo.TuoLun;
import com.lgr.service.TuoLunService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@CrossOrigin
@RestController
@RequestMapping("tuolun")
public class TuoLunController {

    @Autowired
    TuoLunService tuoLunService;

    @PostMapping("tuolunList")
    public Map<String, Object> tuolunList(@RequestBody TuoLun tuoLun)
    {
        return tuoLunService.tuolunList(tuoLun);
    }

}
