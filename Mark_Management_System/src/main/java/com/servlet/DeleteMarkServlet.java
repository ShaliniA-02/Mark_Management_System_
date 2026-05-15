package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.MarkDAO;

@WebServlet("/delete")
public class DeleteMarkServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req,
                         HttpServletResponse res)
            throws IOException {

        try {

            int id = Integer.parseInt(req.getParameter("id"));

            MarkDAO dao = new MarkDAO();

            dao.deleteMark(id);

            res.sendRedirect("display");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}