package com.lgr.service;

import com.lgr.commitUtil.MapUtil;
import com.lgr.constant.Constant;
import com.lgr.mapper.UserMapper;
import com.lgr.pojo.User;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    public Map<String ,Object> userList(User user)
    {
        System.out.println(user.getName());
        System.out.println(user.getPage());
        System.out.println(user.getLimit());
        return MapUtil.requestMap(userMapper.userList(user),
                userMapper.userListCount(user),
                Constant.SUCCESS_REQUEST,
                Constant.SUCCESS);
    }

    public Map<String, Object> login(User user)
    {
        int login = userMapper.login(user);
        if(login > 0)
            return MapUtil.requestMap(null, Constant.SUCCESS_REQUEST, Constant.SUCCESS);
        return MapUtil.requestMap(null,Constant.NOT_SUCCESS_REQUEST, Constant.NOT_SUCCESS);
    }

}
