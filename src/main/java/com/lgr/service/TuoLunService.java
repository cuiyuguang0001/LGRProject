package com.lgr.service;

import com.lgr.commitUtil.MapUtil;
import com.lgr.commitUtil.PageUtil;
import com.lgr.constant.Constant;
import com.lgr.mapper.BoatMapper;
import com.lgr.mapper.TuoLunMapper;
import com.lgr.mapper.UserMapper;
import com.lgr.pojo.TuoLun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class TuoLunService {

    @Autowired
    TuoLunMapper tuoLunMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    BoatMapper boatMapper;

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
        if(!tuoLunMapper.tuolunDel(tuoLun))
            return MapUtil.requestMap(null,false);
        return MapUtil.requestMap(null,true);
    }

    public Map<String, Object> tuolunEditStatus(TuoLun tuoLun){
        if(tuoLun.getStatus().equals("1"))
        {
            if(!userMapper.userEditStatus("0", tuoLun.getPeople()))
                return MapUtil.requestMap(null,false);
        }

        if(!tuoLunMapper.tuolunEditStatus(tuoLun.getStatus(), tuoLun.getId() + ""))
            return MapUtil.requestMap(null,false);
        return MapUtil.requestMap(null,true);
    }

    public Map<String ,Object> tuolunAdd(TuoLun tuoLun)
    {
        if(!userMapper.userEditStatus("1", tuoLun.getPeople()))
            return MapUtil.requestMap(null,false);
        if(!tuoLunMapper.tuolunAdd(tuoLun))
            return MapUtil.requestMap(null,false);
        return MapUtil.requestMap(null,true);
    }

}
