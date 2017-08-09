package com.mapper;

import com.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by HP on 2017/8/3.
 */
public interface UserMapper {
    public List<User> getUser(@Param("userName")String userName,@Param("pwd")String pwd);

    public int addUser(User user);

    public List<User> validateUsername(@Param("userName")String userName);
}
