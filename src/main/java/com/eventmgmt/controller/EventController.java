package com.eventmgmt.controller;

import com.eventmgmt.model.Event;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/EventController")
public class EventController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static List<Event> events = new ArrayList<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String description = request.getParameter("description");

        Event event = new Event(name, date, description);
        events.add(event);

        request.setAttribute("events", events);
        request.getRequestDispatcher("pages/viewEvents.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("events", events);
        request.getRequestDispatcher("pages/viewEvents.jsp").forward(request, response);
    }
}
