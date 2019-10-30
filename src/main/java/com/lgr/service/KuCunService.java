package com.lgr.service;

import com.lgr.commitUtil.MapUtil;
import com.lgr.commitUtil.PageUtil;
import com.lgr.constant.Constant;
import com.lgr.mapper.KuCunMapper;
import com.lgr.pojo.KuCun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class KuCunService {

    @Autowired
    KuCunMapper kuCunMapper;

    public Map<String ,Object> kucunList(KuCun kuCun)
    {
        Map<String ,Object> map = new HashMap<>();
        PageUtil p = new PageUtil(kuCun.getPage(), kuCun.getLimit());
        map.put("page", p);
        map.put("data", kuCun);
        return MapUtil.requestMap(kuCunMapper.kucunList(map),
                p.getCount(),
                Constant.SUCCESS_REQUEST,
                Constant.SUCCESS);
    }



}
