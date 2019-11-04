package com.lgr.mapper;

import com.lgr.pojo.User;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.session.RowBounds;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {
    @Select("select id, name, age, sex, sal, status, dataline, post, list " +
            "from ship_user where name like concat(ifNull(#{name}, ''), '%') " +
            "order by list asc,dataline desc")
    List<User> userList(Map<String ,Object> map);

    @Select("select name from ship_user order by list asc")
    List<String> userListName();

    @Select("select count(0) from ship_user where username = #{username} and pwd = #{pwd}")
    int login(User user);

    @Insert("insert into ship_user(name, age, sex, sal, status, dataline, post, list) " +
            "values(#{name}, #{age}, #{sex}, #{sal}, 0, #{dataline}, #{post}, #{list})")
    boolean userAdd(User user);

    @Select("select id from ship_post where post = #{name}")
    String findPostNumForName(String name);

    @Update("update ship_user set name = #{name}, age = #{age}, sex = #{sex}, sal = #{sal}, " +
            "post = #{post}, list = #{list} where id = #{id}")
    boolean userEdit(User user);

    @Delete("delete from ship_user where id = #{id}")
    boolean uerDel(User user);

    @Update("update ship_user set status = #{status} where name = #{name}")
    boolean userEditStatus(String status, String name);

}
