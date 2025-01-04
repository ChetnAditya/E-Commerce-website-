package com.example.ecommerce.service;

import com.example.ecommerce.model.User;
import com.example.ecommerce.dao.UserDAO;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public void registerUser(String username, String password) {
        User user = new User(username, password);
        userDAO.addUser(user);
    }
}
