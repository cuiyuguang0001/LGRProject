package com.lgr.service;

import com.lgr.commitUtil.MapUtil;
import com.lgr.commitUtil.PageUtil;
import com.lgr.constant.Constant;
import com.lgr.mapper.TuoLunMapper;
import com.lgr.pojo.TuoLun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class TuoLunService {

    @Autowired
    TuoLunMapper tuoLunMapper;

    public Map<String, Object> tuolunList(TuoLun tuoLun){
        Map<String, Object> map = new HashMap<>();
        PageUtil p = new PageUtil(tuoLun.getPage(), tuoLun.getLimit());
        map.put("page", p);
        return MapUtil.requestMap(tuoLunMapper.tuolunList(map),
                p.getCount(),
                Constant.SUCCESS_REQUEST,
                Constant.SUCCESS);
    }

    public Map<String, Object> tuolunDel(TuoLun tuoLun){

    }

}
