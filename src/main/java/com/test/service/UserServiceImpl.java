package com.test.service;

import com.test.dao.UserMapper;
import com.test.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    public User FindUserByName(String username) {
        User user=null;
        user=userMapper.selectByusername(username);
        return user;
    }

    public void insert(User user) {

        userMapper.insertSelective(user);

    }
}
