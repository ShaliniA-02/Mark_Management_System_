package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.MarkDAO;
import com.model.StudentMark;

@WebServlet("/subjectReport")

public class SubjectReportServlet
extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        try {

            String subject =
                    request.getParameter("subject");

            MarkDAO dao =
                    new MarkDAO();

            List<StudentMark> list =
                    dao.getMarksBySubject(subject);

            request.setAttribute("list", list);

            request.setAttribute("subject", subject);

            request.getRequestDispatcher("subject.jsp")
                    .forward(request, response);

        }

        catch(Exception e){

            e.printStackTrace();
        }
    }
}