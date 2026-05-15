package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.MarkDAO;
import com.model.StudentMark;

@WebServlet("/update")
public class UpdateMarkServlet extends HttpServlet {

    // STEP 1: FETCH STUDENT & SHOW JSP
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse res)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));

            MarkDAO dao = new MarkDAO();

            StudentMark student = dao.getMarkById(id);

            if (student == null) {
                res.getWriter().println("Student not found for ID: " + id);
                return;
            }

            req.setAttribute("student", student);

            req.getRequestDispatcher("markupdate.jsp")
               .forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // STEP 2: UPDATE ONLY MARKS
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse res)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            int marks = Integer.parseInt(req.getParameter("marks"));

            MarkDAO dao = new MarkDAO();

            StudentMark sm = new StudentMark();
            sm.setStudentID(id);
            sm.setMarks(marks);

            boolean updated = dao.updateMark(sm);

            if (updated) {
                res.sendRedirect("display");
            } else {
                res.getWriter().println("Update failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}