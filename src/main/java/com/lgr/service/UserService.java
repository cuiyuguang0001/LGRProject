package com.lgr.service;

import com.lgr.commitUtil.CommitUtil;
import com.lgr.commitUtil.MapUtil;
import com.lgr.commitUtil.PageUtil;
import com.lgr.constant.Constant;
import com.lgr.mapper.UserMapper;
import com.lgr.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    public Map<String ,Object> userList(User user)
    {
        Map<String ,Object> map = new HashMap<>();
        PageUtil p = new PageUtil(user.getPage(), user.getLimit());
        map.put("page", p);
        map.put("name", user.getName());
        List<User> users = userMapper.userList(map);
        System.out.println(users);
        for(User u : users)
            u.setDataline(CommitUtil.timestampToStr(Long.valueOf(u.getDataline())));
        return MapUtil.requestMap(users,
                p.getCount(),
                Constant.SUCCESS_REQUEST,
                Constant.SUCCESS);
    }

    public Map<String, Object> login(User user)
    {
        int login = userMapper.login(user);
        if(login > 0)
            return MapUtil.requestMap(null, true);
        return MapUtil.requestMap(null,false);
    }

    public Map<String, Object> userAdd(User user)
    {
        user.setDataline(CommitUtil.getTineLine());
        System.out.println(user.getPost());
        user.setList(userMapper.findPostNumForName(user.getPost()) + "");
        if(userMapper.userAdd(user))
            return MapUtil.requestMap(null, true);
        return MapUtil.requestMap(null, false);
    }

    public Map<String, Object> userEdit(User user)
    {
        user.setList(userMapper.findPostNumForName(user.getPost()) + "");
        if(userMapper.userEdit(user))
            return MapUtil.requestMap(null, true);
        return MapUtil.requestMap(null, false);
    }

    public Map<String ,Object> userDel(User user)
    {
        if(userMapper.uerDel(user))
            return MapUtil.requestMap(null, true);
        return MapUtil.requestMap(null, false);
    }

    public Map<String ,Object> userListName(){
        return MapUtil.requestMap(userMapper.userListName(), true);
    }

}
