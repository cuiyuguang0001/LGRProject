package com.lgr.controller;

import com.lgr.pojo.DingDan;
import com.lgr.service.DingDanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@CrossOrigin
@RestController
@RequestMapping("dingdan")
public class DingDanController {

    @Autowired
    DingDanService dingDanService;

    @PostMapping("dingdanList")
    public Map<String ,Object> dingDanList(@RequestBody DingDan dingDan)
    {
        return dingDanService.dingDanList(dingDan);
    }

    @PostMapping("dingdanAdd")
    public Map<String ,Object> dingDanAdd(@RequestBody DingDan dingDan)
    {
        return dingDanService.dingdanAdd(dingDan);
    }

    @PostMapping("dingdanDel")
    public Map<String ,Object> dingDanDel(@RequestBody DingDan dingDan)
    {
        return dingDanService.dingdanDel(dingDan);
    }

}
