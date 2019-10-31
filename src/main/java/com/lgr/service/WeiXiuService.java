package com.lgr.service;

import com.lgr.commitUtil.MapUtil;
import com.lgr.commitUtil.PageUtil;
import com.lgr.constant.Constant;
import com.lgr.mapper.WeiXiuMapper;
import com.lgr.pojo.WeiXiu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class WeiXiuService {

    @Autowired
    WeiXiuMapper weiXiuMapper;

    public Map<String ,Object> weixiuList(WeiXiu weiXiu)
    {
        Map<String, Object> map = new HashMap<>();
        PageUtil p = new PageUtil(weiXiu.getPage(), weiXiu.getLimit());
        map.put("page", p);
        return MapUtil.requestMap(weiXiuMapper.weixiuList(map),
                p.getCount(),
                Constant.SUCCESS_REQUEST,
                Constant.SUCCESS);
    }

}
