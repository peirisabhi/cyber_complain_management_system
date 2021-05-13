/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.DriverManager;
import java.sql.Connection;

/**
 *
 * @author abhi
 */
public class DBConnection {

    public static final String DB_URL = "jdbc:mysql://localhost:3306/cyber_crime_db?useSSL=false";
    public static final String DB_USERNAME = "root";
    public static final String DB_PASSWORD = "1234";
    public static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName(DB_DRIVER);
            Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            conn = connection;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }

    public static void main(String[] args) {  // test connection
        Connection connection = getConnection();
        
        System.out.println(connection);
    }
    
}
