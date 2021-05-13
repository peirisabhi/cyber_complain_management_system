/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.User;
import model.UserModel;

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
@WebServlet(name = "AdminLoginController", urlPatterns = {"/AdminLoginController"})
public class AdminLoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int status = 200;
        String message = "";

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = UserModel.getUserByEmail(email);
//        System.out.println(user);
        if(user != null){
            if(user.getPassword().equals(password)){

                HttpSession session = request.getSession();
                session.setAttribute("admin_id", user.getId());
                session.setAttribute("name", user.getName());
                session.setAttribute("email", user.getEmail());
                session.setAttribute("mobile", user.getMobile());
                session.setAttribute("user_role", user.getUserRole());
                session.setAttribute("user_role_id", user.getRole_id());

                response.sendRedirect("home.jsp");
            }else{
                status = 500;
                message = "Invalid Password!";
            }
        }else{
            status = 500;
            message = "Invalid Email!";
        }

        if(status == 500){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }


    }
}
