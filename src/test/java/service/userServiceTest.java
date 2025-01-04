package com.example.tests;

import com.example.models.User;
import com.example.services.UserService;
import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class UserServiceTest {

    @Test
    public void testRegisterUserSuccess() {
        UserService userService = new UserService();
        User user = new User("Chetan Aditya", "chetanaditya04@gmail.com");

        String result = userService.registerUser(user);
        assertEquals("User registered successfully!", result);
    }

    @Test
    public void testRegisterUserFailure() {
        UserService userService = new UserService();
        User user = null;

        String result = userService.registerUser(user);
        assertEquals("User registration failed.", result);
    }
}
