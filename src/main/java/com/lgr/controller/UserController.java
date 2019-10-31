package com.lgr.controller;

import com.lgr.pojo.User;
import com.lgr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("user")
@CrossOrigin
public class UserController {

    @Autowired
    UserService userService;

    @PostMapping("userList")
    public Map<String,Object> userList(@RequestBody User user){
        return userService.userList(user);
    }

    @PostMapping("login")
    public Map<String,Object> login(@RequestBody User user){
        return userService.login(user);
    }

    @PostMapping("userAdd")
    public Map<String,Object> userAdd(@RequestBody User user){
        return userService.userAdd(user);
    }

    @PostMapping("userEdit")
    public Map<String,Object> userEdit(@RequestBody User user){
        System.out.println(user.getId());
        System.out.println(user.getName());
        System.out.println(user.getPost());
        return userService.userEdit(user);
    }

    @PostMapping("userDel")
    public Map<String,Object> userDel(@RequestBody User user){
        return userService.userDel(user);
    }

    @PostMapping("userListName")
    public Map<String,Object> userListName(@RequestBody User user){
        return userService.userListName();
    }

}
