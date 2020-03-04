package com.test.service;

import com.test.entity.User;

public interface UserService {
    User FindUserByName(String username);
    void insert(User user);
}
