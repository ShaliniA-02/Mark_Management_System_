package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.MarkDAO;
import com.model.StudentMark;

@WebServlet("/report")
public class ReportServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
                          HttpServletResponse res)
            throws IOException, ServletException {

        try {

            String type = req.getParameter("type");

            MarkDAO dao = new MarkDAO();

            List<StudentMark> list = null;

            if (type.equals("above")) {

                int marks =
                        Integer.parseInt(req.getParameter("marks"));

                list = dao.getAboveMarks(marks);

                req.setAttribute("reportTitle",
                        "Students Above " + marks);

            } else if (type.equals("subject")) {

                String subject =
                        req.getParameter("subject");

                list = dao.getMarksBySubject(subject);

                req.setAttribute("reportTitle",
                        "Subject : " + subject);

            } else if (type.equals("topn")) {

                int n =
                        Integer.parseInt(req.getParameter("n"));

                list = dao.getTopNStudents(n);

                req.setAttribute("reportTitle",
                        "Top " + n + " Students");
            }

            req.setAttribute("data", list);

            req.getRequestDispatcher("report_result.jsp")
                    .forward(req, res);

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}