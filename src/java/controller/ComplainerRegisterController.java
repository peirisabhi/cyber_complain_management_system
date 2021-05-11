/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.User;
import model.UserModel;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author abhi
 */
@WebServlet(name = "ComplainerRegisterController", urlPatterns = {"/ComplainerRegisterController"})
public class ComplainerRegisterController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int status = 200;
        String message = "";

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        try {

            User user = UserModel.getUserByEmail(email);

            if (user == null) {

                int userId = UserModel.saveUser(name, email, contact, password, 1);

                    if(userId != 0){

                        status = 200;
                        message = "Successfully Registered!";

                        System.out.println(userId);

                        HttpSession session = request.getSession();
                        session.setAttribute("id", userId);
                        session.setAttribute("name", name);
                        session.setAttribute("email", email);
                        session.setAttribute("mobile", contact);
                        session.setAttribute("user_role", "Complainer");

                        response.sendRedirect("index.jsp");

                    }


            } else {
                status = 500;
                message = "This Email is already taken!";
            }


        } catch (Exception e) {
            e.printStackTrace();
            status = 500;
            message = "Something Went Wrong!";
        }

        if(status == 500){
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }

    }

}
