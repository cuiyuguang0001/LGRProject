package com.lgr.mapper;

import com.lgr.pojo.KuCun;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

@Mapper
public interface KuCunMapper {

    @Select("select id, name, num, util from ship_kucun where status = #{status}")
    List<KuCun> kucunList(Map<String, Object> map);

    @Select("select num from ship_kucun where name = #{name}")
    KuCun kucunModel(String name);

    @Insert("insert into ship_kucun(name, num, util) values(#{name}, #{num}, #{util})")
    boolean kucunAdd(String name, String num, String util);

    @Update("update ship_kucun set num = num #{flag} #{num} where name = #{name}")
    boolean updateKuCunForDingDan(String name, String num, char flag);

}
