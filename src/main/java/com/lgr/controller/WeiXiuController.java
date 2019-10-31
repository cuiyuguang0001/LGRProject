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

    @PostMapping("weixiuAdd")
    public Map<String ,Object> weixiuAdd(@RequestBody WeiXiu weiXiu)
    {
        return weiXiuService.weixiuAdd(weiXiu);
    }

    @PostMapping("weixiuDel")
    public Map<String ,Object> weixiuDel(@RequestBody WeiXiu weiXiu)
    {
        return weiXiuService.weixiuDel(weiXiu);
    }

    @PostMapping("weixiuEditStatus")
    public Map<String ,Object> weixiuEditStatus(@RequestBody WeiXiu weiXiu)
    {
        return weiXiuService.weixiuEditStatus(weiXiu);
    }

}
