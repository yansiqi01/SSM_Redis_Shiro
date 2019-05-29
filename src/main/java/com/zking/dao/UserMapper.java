package com.zking.dao;

import com.zking.model.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userMapper")
public interface UserMapper {


    //查询所有用户
    List<User> getUsers();




}
