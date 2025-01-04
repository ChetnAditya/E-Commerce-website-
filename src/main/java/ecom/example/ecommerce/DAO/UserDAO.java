
package com.example.dao;

import com.example.models.User;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private static List<User> users = new ArrayList<>();

    public boolean saveUser(User user) {
        return users.add(user);
    }

    public List<User> getAllUsers() {
        return users;
    }
}

