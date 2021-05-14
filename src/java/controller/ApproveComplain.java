/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.ComplainModel;

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
@WebServlet(name = "ApproveComplain", urlPatterns = {"/ApproveComplain"})
public class ApproveComplain extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        JSONObject objSend = new JSONObject();

        int status = 200;
        String message = "";
        try {

            int id = Integer.parseInt(request.getParameter("id"));

            boolean result = ComplainModel.approveComplain(id);

            if (result) {
                status = 200;
                message = "Successfully Approved!";
            } else {
                status = 500;
                message = "Something Went Wrong!";
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
