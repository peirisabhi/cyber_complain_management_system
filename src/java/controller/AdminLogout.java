/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author abhi
 */
@WebServlet(name = "AdminLogout", urlPatterns = {"/AdminLogout"})
public class AdminLogout extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session != null) {
            session.removeAttribute("admin_id");
            session.removeAttribute("name");
            session.removeAttribute("email");
            session.removeAttribute("mobile");
            session.removeAttribute("user_role");
            session.removeAttribute("user_role_id");

//            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/index.jsp");
//            dispatcher.forward(request, response);

            response.sendRedirect("admin/index.jsp");
        }
    }

}
