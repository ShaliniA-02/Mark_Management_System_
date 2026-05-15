package com.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.MarkDAO;
import com.model.StudentMark;

@WebServlet("/add")
public class AddMarkServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));

            String name = request.getParameter("name");

            String subject = request.getParameter("subject");

            int marks = Integer.parseInt(request.getParameter("marks"));

            java.sql.Date date =
            java.sql.Date.valueOf(
            request.getParameter("date"));

            StudentMark sm = new StudentMark();

            sm.setStudentID(id);

            sm.setStudentName(name);

            sm.setSubject(subject);

            sm.setMarks(marks);

            sm.setExamDate(date);

            MarkDAO dao = new MarkDAO();

            dao.addMark(sm);

            // SUCCESS REDIRECT

            response.sendRedirect(
            "markadd.jsp?msg=success");

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
            "Error: " + e.getMessage());
        }
    }
}