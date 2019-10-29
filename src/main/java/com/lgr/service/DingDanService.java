package com.lgr.service;

import com.lgr.commitUtil.CommitUtil;
import com.lgr.commitUtil.MapUtil;
import com.lgr.constant.Constant;
import com.lgr.mapper.DingDanMapper;
import com.lgr.pojo.DingDan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DingDanService {

    @Autowired
    DingDanMapper dingDanMapper;

    public Map<String ,Object> dingDanList(DingDan dingDan)
    {
        List<DingDan> dingDans = dingDanMapper.dingDanList(dingDan);
        for(DingDan d : dingDans)
            d.setDataline(CommitUtil.timestampToStr(Long.valueOf(d.getDataline())));
        return MapUtil.requestMap(dingDans,
                dingDanMapper.dingDanCount(dingDan),
                Constant.SUCCESS_REQUEST,
                Constant.SUCCESS);
    }

}
