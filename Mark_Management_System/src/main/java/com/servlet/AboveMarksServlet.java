package com.servlet;

import com.dao.MarkDAO;
import com.model.StudentMark;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/aboveMarks")

public class AboveMarksServlet
extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        try {

            String condition =
                    request.getParameter("condition");

            String operator = ">=";

            int marks = 0;

            Pattern p =
                    Pattern.compile("(<=|>=|=|<|>)?(\\d+)");

            Matcher m =
                    p.matcher(condition);

            if(m.matches()){

                if(m.group(1) != null){

                    operator = m.group(1);
                }

                marks =
                        Integer.parseInt(m.group(2));
            }

            MarkDAO dao =
                    new MarkDAO();

            List<StudentMark> list =
                    dao.getMarksByCondition(
                            operator,
                            marks
                    );

            request.setAttribute("list", list);

            request.getRequestDispatcher("above.jsp")
                    .forward(request, response);

        }

        catch(Exception e){

            e.printStackTrace();
        }
    }
}