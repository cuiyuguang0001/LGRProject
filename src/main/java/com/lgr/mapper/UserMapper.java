package com.lgr.mapper;

import com.lgr.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMapper {

    @Select("select id, name, age, sex, sal, status, dataline, post, list " +
            "from ship_user where name like concat(ifNull(#{name}, ''), '%') " +
            "order by list asc,dataline desc limit #{page},#{limit}")
    List<User> userList(User user);

    @Select("select count(0) from ship_user where name like concat(ifNull(#{name}, ''), '%')")
    int userListCount(User user);

    @Select("select count(0) from ship_user where username = #{username} and pwd = #{pwd}")
    int login(User user);

}
