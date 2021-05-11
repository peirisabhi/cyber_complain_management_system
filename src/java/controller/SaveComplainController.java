/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.User;
import model.ComplainModel;
import model.UserModel;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;

/**
 * @author abhi
 */
@WebServlet(name = "SaveComplain", urlPatterns = {"/SaveComplain"})
@MultipartConfig
public class SaveComplainController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("do post");
        JSONObject objSend = new JSONObject();

        int status = 200;
        String message = "";

        HttpSession session = request.getSession();

        if (session.getAttribute("id") == null) {
            status = 404;
            message = "Not Logged!";
        } else {
            
            try {

            String title = request.getParameter("title");
            String category = request.getParameter("category");
            String otherCategory = request.getParameter("other_category");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String description = request.getParameter("description");
            int userId = (int) session.getAttribute("id");
//            System.out.println(title + category);
//            System.out.println(category);

                if (category.equals("other")){
                    category = otherCategory;
                }

                boolean result = ComplainModel.saveComplain(title, category, date, time, description, userId);

                if (result) {
                    status = 200;
                    message = "Successfully Posted!";
                } else {
                    status = 500;
                    message = "Something Went Wrong!";
                }

            } catch (Exception e) {
                e.printStackTrace();
                status = 500;
                message = "Something Went Wrong!";
            }

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
