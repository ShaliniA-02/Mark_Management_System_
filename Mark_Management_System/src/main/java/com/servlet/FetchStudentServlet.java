package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.MarkDAO;
import com.model.StudentMark;

@WebServlet("/fetchStudent")

public class FetchStudentServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        try {

            int id =
                    Integer.parseInt(
                            request.getParameter("id")
                    );

            MarkDAO dao =
                    new MarkDAO();

            StudentMark sm =
                    dao.getMarkById(id);

            request.setAttribute(
                    "student",
                    sm
            );

            request.getRequestDispatcher(
                    "markupdate.jsp"
            ).forward(request, response);

        }

        catch(Exception e) {

            e.printStackTrace();
        }
    }
}