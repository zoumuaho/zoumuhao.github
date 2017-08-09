package com.service.impl;

import com.entity.User;
import com.mapper.UserMapper;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by HP on 2017/8/3.
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    public List<User> validateUsername(String userName) {
        return userMapper.validateUsername(userName);
    }

    public List<User> getUser(String userName, String pwd) {
        return userMapper.getUser(userName,pwd);
    }
}
