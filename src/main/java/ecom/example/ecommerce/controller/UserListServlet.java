package com.example.ecommerce.controllers;

import com.example.ecommerce.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class UserListServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("users", userDAO.getAllUsers());
        req.getRequestDispatcher("userlist.jsp").forward(req, resp);
    }
}
