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
    public Map<String,Object> login(User user){
        return userService.login(user);
    }

}
