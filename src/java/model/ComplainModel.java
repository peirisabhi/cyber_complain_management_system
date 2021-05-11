package model;

import db.DBConnection;

import java.sql.*;

public class ComplainModel {
    public static boolean saveComplain(String title, String category,  String date, String time, String description, int userId) {

        Connection connection = null;
        boolean status = true;

        try {

            connection = DBConnection.getConnection();

            PreparedStatement preparedStatement1 = connection.prepareStatement("INSERT INTO complain  (`title`, `category`, `date`, `time`, `description`, `user_id`, `active_status`, `status`) VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
            preparedStatement1.setString(1, title);
            preparedStatement1.setString(2, category);
            preparedStatement1.setString(3, date);
            preparedStatement1.setString(4, time);
            preparedStatement1.setString(5, description);
            preparedStatement1.setInt(6, userId);
            preparedStatement1.setInt(7, 1);
            preparedStatement1.setString(8, " ");

            preparedStatement1.executeUpdate();



        } catch (Exception e) {
            e.printStackTrace();
            status = false;
        } finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
                status = false;
            }
        }

        return status;
    }
}
