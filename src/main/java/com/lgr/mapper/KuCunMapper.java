package com.lgr.mapper;

import com.lgr.pojo.KuCun;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface KuCunMapper {

    @Select("select id, name, num, util from ship_kucun")
    List<KuCun> kucunList(KuCun kuCun);
    @Select("select count(0) from ship_kucun")
    int kucunListCount(KuCun kuCun);

}
