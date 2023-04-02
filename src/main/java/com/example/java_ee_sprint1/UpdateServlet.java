package com.example.java_ee_sprint1;

import classes.DBManager;
import classes.Tasks;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UpdateServlet", value = "/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));

        String name = request.getParameter("nameTask");
        String description = request.getParameter("description");
        String deadLine = request.getParameter("deadline");

        Tasks task = DBManager.getTask(id);

        task.setName(name);
        task.setDescription(description);
        task.setDeadlineDate(deadLine);

        response.sendRedirect("/main");
    }
}
