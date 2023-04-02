package com.example.java_ee_sprint1;

import classes.DBManager;
import classes.Tasks;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AddServlet", value = "/add")
public class AddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameTask = request.getParameter("nameTask");
        String description = request.getParameter("description");
        String deadLine = request.getParameter("deadLine");

        Tasks task = new Tasks();

        task.setName(nameTask);
        task.setDescription(description);
        task.setDeadlineDate(deadLine);

        DBManager.addTask(task);

        response.sendRedirect("/main");
    }
}
