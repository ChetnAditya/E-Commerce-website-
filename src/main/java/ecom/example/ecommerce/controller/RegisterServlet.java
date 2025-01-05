package com.example.ecommerce.controllers;

import com.example.ecommerce.dao.UserDAO;
import com.example.ecommerce.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User newUser = new User(username, password);
        userDAO.addUser(newUser);

        resp.sendRedirect("userlist");
    }
}

