package com.lgr.mapper;

import com.lgr.pojo.KuCun;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface KuCunMapper {

    @Select("select id, name, num, util from ship_kucun")
    List<KuCun> kucunList(KuCun kuCun);
    @Select("select count(0) from ship_kucun")
    int kucunListCount(KuCun kuCun);
    @Select("select num from ship_kucun where name = #{name}")
    KuCun kucunModel(String name);

    @Insert("insert into ship_kucun(name, num, util) values(#{name}, #{num}, #{util})")
    boolean kucunAdd(String name, String num, String util);

    @Update("update ship_kucun set num = num #{flag} #{num} where name = #{name}")
    boolean updateKuCunForDingDan(String name, String num, char flag);

}
