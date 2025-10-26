package com.eventmgmt.controller;

import com.eventmgmt.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/RegistrationController")
public class RegistrationController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String eventName = request.getParameter("event");

        User user = new User(name, email);
        request.setAttribute("user", user);
        request.setAttribute("eventName", eventName);

        request.getRequestDispatcher("pages/confirmation.jsp").forward(request, response);
    }
}
