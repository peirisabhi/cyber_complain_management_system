package model;

import db.DBConnection;
import dto.User;

import java.sql.*;

public class UserModel {

    public static int saveUser(String name, String email, String contact, String password, int roleId) {

        Connection connection = null;
        int userId = 0;

        try {

            connection = DBConnection.getConnection();

            PreparedStatement preparedStatement1 = connection.prepareStatement("INSERT INTO user  (`name`, `email`, `mobile`, `password`, `status`, `user_role_id`) VALUES(?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            preparedStatement1.setString(1, name);
            preparedStatement1.setString(2, email);
            preparedStatement1.setString(3, contact);
            preparedStatement1.setString(4, password);
            preparedStatement1.setInt(5, 1);
            preparedStatement1.setInt(6, roleId);

            preparedStatement1.executeUpdate();

            ResultSet rs = preparedStatement1.getGeneratedKeys();

            if (rs.next()) {
                userId = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return userId;
    }


    public static User getUserByEmail(String email) {
        Connection connection = null;
        User user = null;

        try {

            connection = DBConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM user WHERE email = ?");
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt(1));
                user.setName(resultSet.getString(2));
                user.setEmail(resultSet.getString(3));
                user.setMobile(resultSet.getString(4));
                user.setPassword(resultSet.getString(5));
                user.setRole_id(resultSet.getInt(7));
                user.setStatus(resultSet.getInt(8));

                ResultSet rs = connection.createStatement().executeQuery("SELECT * FROM user_role WHERE id = '" + resultSet.getInt(7) + "'");

                if(rs.next()){
                    user.setUserRole(rs.getString(2));
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return user;
    }


    public static boolean removeUser(int id) {
        Connection connection = null;
        boolean status = true;

        try {

            connection = DBConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM user WHERE id = ?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                PreparedStatement preparedStatement1 = connection.prepareStatement("UPDATE user SET status = ? WHERE id = ?");
                preparedStatement1.setInt(1, 0);
                preparedStatement1.setInt(2, id);

                preparedStatement1.executeUpdate();

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return status;
    }





}
