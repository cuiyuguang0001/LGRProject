package com.lgr.service;

import com.lgr.commitUtil.CommitUtil;
import com.lgr.commitUtil.MapUtil;
import com.lgr.commitUtil.PageUtil;
import com.lgr.constant.Constant;
import com.lgr.mapper.BoatMapper;
import com.lgr.mapper.UserMapper;
import com.lgr.mapper.WeiXiuMapper;
import com.lgr.pojo.WeiXiu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

@Service
@Transactional
public class WeiXiuService {

    @Autowired
    WeiXiuMapper weiXiuMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    BoatMapper boatMapper;

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

    public Map<String ,Object> weixiuAdd(WeiXiu weiXiu)
    {
        if(!userMapper.userEditStatus("1", weiXiu.getPeople()))
            return MapUtil.requestMap(null,false);
        if(!boatMapper.boatEditUpdateStatus("2", "0", weiXiu.getBoat()))
            return MapUtil.requestMap(null,false);

        weiXiu.setDataline(CommitUtil.getTineLine());
        if (!weiXiuMapper.weixiuAdd(weiXiu))
            return MapUtil.requestMap(null,false);
        return MapUtil.requestMap(null,true);
    }

    public Map<String ,Object> weixiuDel(WeiXiu weiXiu)
    {
        if(!weiXiuMapper.weixiuDel(weiXiu))
            return MapUtil.requestMap(null,false);
        return MapUtil.requestMap(null,true);
    }

    public Map<String, Object> weixiuEditStatus(WeiXiu weiXiu)
    {
        if(!userMapper.userEditStatus("0", weiXiu.getPeople()))
            return MapUtil.requestMap(null,false);
        if(!boatMapper.boatEditUpdateStatus("0", "0", weiXiu.getBoat()))
            return MapUtil.requestMap(null,false);
        if(!weiXiuMapper.weixiuEditStatus(weiXiu.getStatus(), weiXiu.getId() + ""))
            return MapUtil.requestMap(null,false);
        return MapUtil.requestMap(null,true);
    }

}
