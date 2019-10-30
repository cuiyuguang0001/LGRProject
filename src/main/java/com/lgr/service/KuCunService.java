package com.lgr.service;

import com.lgr.commitUtil.MapUtil;
import com.lgr.constant.Constant;
import com.lgr.mapper.KuCunMapper;
import com.lgr.pojo.KuCun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class KuCunService {

    @Autowired
    KuCunMapper kuCunMapper;

    public Map<String ,Object> kucunList(KuCun kuCun)
    {
        return MapUtil.requestMap(kuCunMapper.kucunList(kuCun),
                kuCunMapper.kucunListCount(kuCun),
                Constant.SUCCESS_REQUEST,
                Constant.SUCCESS);
    }



}
