package com.lgr.service;

import com.lgr.commitUtil.CommitUtil;
import com.lgr.commitUtil.MapUtil;
import com.lgr.constant.Constant;
import com.lgr.mapper.BoatMapper;
import com.lgr.pojo.Boat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BoatService {

    @Autowired
    BoatMapper boatMapper;

    public Map<String ,Object> boatList(Boat boat)
    {

        //处理时间戳
        List<Boat> boats = boatMapper.boatList(boat);
        for(Boat b : boats)
        {
            b.setDataline(CommitUtil.timestampToStr(Long.valueOf(b.getDataline())));
            b.setUpdatedata(CommitUtil.timestampToStr(Long.valueOf(b.getUpdatedata())));
        }

        return MapUtil.requestMap(boats,
                boatMapper.boatListCount(boat),
                Constant.SUCCESS_REQUEST,
                Constant.SUCCESS);
    }

    public Map<String, Object> boatAdd(Boat boat)
    {
        boat.setDataline(CommitUtil.getTineLine());
        if (boatMapper.boatAdd(boat))
            return MapUtil.requestMap(null, true);
        return MapUtil.requestMap(null, false);
    }

    public Map<String, Object> boatEdit(Boat boat)
    {
        if (boatMapper.boatEdit(boat))
            return MapUtil.requestMap(null, true);
        return MapUtil.requestMap(null, false);
    }

    public Map<String, Object> boatDel(Boat boat)
    {
        if (boatMapper.boatDel(boat))
            return MapUtil.requestMap(null, true);
        return MapUtil.requestMap(null, false);
    }

}
