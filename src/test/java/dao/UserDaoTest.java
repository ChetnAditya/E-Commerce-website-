package com.example.tests;

import com.example.dao.UserDAO;
import com.example.models.User;
import org.junit.Test;
import java.util.List;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertEquals;

public class UserDAOTest {

    @Test
    public void testSaveUser() {
        UserDAO userDAO = new UserDAO();
        User user = new User("Chetan Aditya", "chetanaditya04@gmail.com");

        boolean isSaved = userDAO.saveUser(user);
        assertTrue(isSaved);
    }

    @Test
    public void testGetAllUsers() {
        UserDAO userDAO = new UserDAO();
        User user1 = new User("Aryan Raj", "ar6312070@gmail.com");
        User user2 = new User("Arjun Kumar", "aksir648@gmail.com");

        userDAO.saveUser(user1);
        userDAO.saveUser(user2);

        List<User> users = userDAO.getAllUsers();
        assertEquals(2, users.size());
    }
}

