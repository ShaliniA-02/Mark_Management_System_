package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.MarkDAO;

@WebServlet("/finaldelete")
public class FinalDeleteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
                          HttpServletResponse res)
            throws ServletException, IOException {

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