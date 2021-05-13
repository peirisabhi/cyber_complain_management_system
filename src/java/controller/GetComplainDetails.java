/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import dto.Complain;
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
@WebServlet(name = "GetComplainDetails", urlPatterns = {"/GetComplainDetails"})
public class GetComplainDetails extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        JSONObject objSend = new JSONObject();
        JsonElement data = null;

        int status = 200;
        try {

            int id = Integer.parseInt(request.getParameter("id"));

            Complain complain = ComplainModel.getComplainById(id);

            if(complain != null){

                Gson g = new Gson();
                 data = g.toJsonTree(complain, Complain.class);
                
                

                status = 200;
            }else{
                status = 500;
            }

        } catch (Exception e) {
            e.printStackTrace();
            status = 500;
        }

        objSend.put("status", status);
        objSend.put("data", data);

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
