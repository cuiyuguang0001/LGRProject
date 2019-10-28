package com.lgr.commitUtil;

import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class MapUtil {

    /**
     * 用于普通返回
     * @param list
     * @param msg
     * @param ret
     * @return
     */
    public static Map<String, Object> requestMap(List list, int count, String msg, int ret)
    {
        Map<String, Object> map = new HashMap<>();
        map.put("data", list);
        map.put("msg", msg);
        map.put("count", count);
        map.put("code", 0);
        map.put("ret", ret);
        return map;
    }

    public static Map<String, Object> requestMap(List list, String msg, int ret)
    {
        Map<String, Object> map = new HashMap<>();
        map.put("data", list);
        map.put("msg", msg);
        map.put("ret", ret);
        return map;
    }


}
