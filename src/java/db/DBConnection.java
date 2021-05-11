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

    private static final String db_url = "jdbc:mysql://localhost:3306/cyber_crime_db?useSSL=false";
    private static final String db_username = "root";
    private static final String db_password = "1234";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(db_url, db_username, db_password);
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
