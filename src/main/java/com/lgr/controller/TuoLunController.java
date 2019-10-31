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

    @PostMapping("tuolunDel")
    public Map<String, Object> tuolunDel(@RequestBody TuoLun tuoLun)
    {
        return tuoLunService.tuolunDel(tuoLun);
    }

    @PostMapping("tuolunEditStatus")
    public Map<String, Object> tuolunEditStatus(@RequestBody TuoLun tuoLun)
    {
        return tuoLunService.tuolunEditStatus(tuoLun);
    }

    @PostMapping("tuolunAdd")
    public Map<String, Object> tuolunAdd(@RequestBody TuoLun tuoLun)
    {
        return tuoLunService.tuolunAdd(tuoLun);
    }

}
