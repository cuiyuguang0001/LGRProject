package com.lgr.service;

import com.lgr.commitUtil.CommitUtil;
import com.lgr.commitUtil.MapUtil;
import com.lgr.commitUtil.PageUtil;
import com.lgr.constant.Constant;
import com.lgr.mapper.DingDanMapper;
import com.lgr.mapper.KuCunMapper;
import com.lgr.pojo.DingDan;
import com.lgr.pojo.KuCun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class DingDanService {

    @Autowired
    DingDanMapper dingDanMapper;
    @Autowired
    KuCunMapper kuCunMapper;

    public Map<String ,Object> dingDanList(DingDan dingDan)
    {
        Map<String ,Object> map = new HashMap<>();
        PageUtil p = new PageUtil(dingDan.getPage(), dingDan.getLimit());
        map.put("page", p);
        map.put("data", dingDan);
        List<DingDan> dingDans = dingDanMapper.dingDanList(map);
        for(DingDan d : dingDans)
            d.setDataline(CommitUtil.timestampToStr(Long.valueOf(d.getDataline())));
        return MapUtil.requestMap(dingDans,
                p.getCount(),
                Constant.SUCCESS_REQUEST,
                Constant.SUCCESS);
    }

    public Map<String ,Object> dingdanAdd(DingDan dingDan)
    {
        if(dingDan.getType().equals("0"))
        {
            KuCun kuCun = kuCunMapper.kucunModel(dingDan.getName());
            if(kuCun == null)
                return MapUtil.requestMap(null,Constant.NOT_SUCCESS_KUCUN, Constant.NOT_SUCCESS);
            if(Integer.valueOf(kuCun.getNum()) - Integer.valueOf(dingDan.getNum()) < 0)
                return MapUtil.requestMap(null,Constant.NOT_SUCCESS_KUCUN_NUM, Constant.NOT_SUCCESS);
            if (!kuCunMapper.updateKuCunForDingDan(dingDan.getName(), dingDan.getNum(), '-'))
                return MapUtil.requestMap(null, false);

        }else
        {
            KuCun kuCun = kuCunMapper.kucunModel(dingDan.getName());
            if(kuCun == null){
                if (!kuCunMapper.kucunAdd(dingDan.getName(), dingDan.getNum(), dingDan.getUtil()))
                    return MapUtil.requestMap(null,false);
            }else {
                if (!kuCunMapper.updateKuCunForDingDan(dingDan.getName(), dingDan.getNum(), '+'))
                    return MapUtil.requestMap(null,false);
            }
        }

        dingDan.setDataline(CommitUtil.getTineLine());
        if (dingDanMapper.dingdanAdd(dingDan))
            return MapUtil.requestMap(null, true);
        return MapUtil.requestMap(null, false);
    }

    public Map<String ,Object> dingdanDel(DingDan dingDan)
    {
        if (dingDanMapper.dingdanDel(dingDan))
            return MapUtil.requestMap(null, true);
        return MapUtil.requestMap(null, false);
    }


}
