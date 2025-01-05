package com.example.ecommerce.controllers;

import com.example.ecommerce.dao.UserDAO;
import com.example.ecommerce.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = userDAO.getUserByUsername(username);

        if (user != null && user.getPassword().equals(password)) {
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
            resp.sendRedirect("welcome.jsp");
        } else {
            req.setAttribute("errorMessage", "Invalid username or password.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
