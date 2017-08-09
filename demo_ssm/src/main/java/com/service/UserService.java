package com.service;

import com.entity.User;

import java.util.List;

/**
 * Created by HP on 2017/8/3.
 */
public interface UserService {
    public List<User> getUser(String userName,String pwd);
    public int addUser(User user);
    public List<User>validateUsername(String userName);
}
