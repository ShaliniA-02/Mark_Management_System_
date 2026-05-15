package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.MarkDAO;
import com.model.StudentMark;

@WebServlet("/display")
public class DisplayMarksServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            MarkDAO dao = new MarkDAO();

            List<StudentMark> list =
                    dao.getAllMarks();

            request.setAttribute("list", list);

            request.getRequestDispatcher(
                    "markdisplay.jsp")
                    .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}