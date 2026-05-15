package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.MarkDAO;
import com.model.StudentMark;

@WebServlet("/edit")
public class EditServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id =
                    Integer.parseInt(
                    request.getParameter("id"));

            MarkDAO dao = new MarkDAO();

            StudentMark student =
                    dao.getMarkById(id);

            request.setAttribute(
                    "student",
                    student);

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                    "markupdate.jsp");

            rd.forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Error : " + e.getMessage());
        }
    }
}