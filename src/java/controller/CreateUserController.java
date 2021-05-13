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
import java.io.IOException;
import java.io.PrintWriter;
import org.json.simple.JSONObject;

/**
 *
 * @author abhi
 */
@WebServlet(name = "CreateUserController", urlPatterns = {"/CreateUserController"})
public class CreateUserController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        JSONObject objSend = new JSONObject();

        int status = 200;
        String message = "";
        try {

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String contact = request.getParameter("mobile");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirm_password");
            int role = Integer.parseInt(request.getParameter("role"));

            User user = UserModel.getUserByEmail(email);

            if (user == null) {

                int userId = UserModel.saveUser(name, email, contact, password, role);

                if (userId != 0) {

                    status = 200;
                    message = "Successfully Registered!";

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

        objSend.put("status", status);
        objSend.put("message", message);

        System.out.println(objSend.toString());

        response.setContentType("text/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.print(objSend);
        } finally {
            out.close();
        }

    }

}
