package model;

import db.DBConnection;
import dto.Complain;
import mail.Mail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ComplainModel {
    public static boolean saveComplain(String title, String category, String date, String time, String description, int userId) {

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
            preparedStatement1.setString(8, "Pending");

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


    public static Complain getComplainById(int id) {
        Connection connection = null;
        Complain complain = null;

        try {

            connection = DBConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM  complain INNER JOIN `user` WHERE `complain`.user_id = `user`.id  AND `complain`.`active_status` != 0 AND complain.id = ?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                complain = new Complain();
                complain.setId(resultSet.getInt(1));
                complain.setTitle(resultSet.getString(2));
                complain.setCategory(resultSet.getString(3));
                complain.setDate(resultSet.getString(4));
                complain.setTime(resultSet.getString(5));
                complain.setDescription(resultSet.getString(6));
                complain.setCreatedAt(resultSet.getString(7));
                complain.setUserId(resultSet.getString(8));
                complain.setStatus(resultSet.getString(10));
                complain.setComment(resultSet.getString(11));
                complain.setComplainer(resultSet.getString(13));
                complain.setComplainerEmail(resultSet.getString(14));
                complain.setComplainerMobile(resultSet.getString(15));


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

        return complain;
    }


    public static boolean approveComplain(int id) {
        Connection connection = null;
        boolean status = true;

        try {

            connection = DBConnection.getConnection();

            PreparedStatement preparedStatement1 = connection.prepareStatement("UPDATE complain SET status = ?, active_status = ? WHERE id = ?");
            preparedStatement1.setString(1, "Approved");
            preparedStatement1.setInt(2, 2);
            preparedStatement1.setInt(3, id);

            preparedStatement1.executeUpdate();
            
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM  complain INNER JOIN `user` WHERE `complain`.user_id = `user`.id  AND `complain`.`active_status` != 0 AND complain.id = ?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            if (resultSet.next()) {
                Complain complain = new Complain();
                complain.setId(resultSet.getInt(1));
                complain.setTitle(resultSet.getString(2));
                complain.setCategory(resultSet.getString(3));
                complain.setDate(resultSet.getString(4));
                complain.setTime(resultSet.getString(5));
                complain.setDescription(resultSet.getString(6));
                complain.setCreatedAt(resultSet.getString(7));
                complain.setUserId(resultSet.getString(8));
                complain.setStatus(resultSet.getString(10));
                complain.setComment(resultSet.getString(11));
                complain.setComplainer(resultSet.getString(13));
                complain.setComplainerEmail(resultSet.getString(14));
                complain.setComplainerMobile(resultSet.getString(15));

                sendMail(complain, "Approved");
            }


        } catch (Exception e) {
            e.printStackTrace();
            status = false;
        } finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }


        return status;
    }


    public static boolean updateComplainStatus(int id, String comment, String complainStatus) {
        Connection connection = null;
        boolean status = true;

        try {

            connection = DBConnection.getConnection();

            PreparedStatement preparedStatement1 = connection.prepareStatement("UPDATE complain SET status = ?, comment = ? WHERE id = ?");
            preparedStatement1.setString(1, complainStatus);
            preparedStatement1.setString(2, comment);
            preparedStatement1.setInt(3, id);

            preparedStatement1.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();
            status = false;
        } finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }


        return status;
    }


    public static boolean rejectComplain(int id) {
        Connection connection = null;
        boolean status = true;

        try {

            connection = DBConnection.getConnection();

            PreparedStatement preparedStatement1 = connection.prepareStatement("UPDATE complain SET status = ?, active_status = ? WHERE id = ?");
            preparedStatement1.setString(1, "Rejected");
            preparedStatement1.setInt(2, 3);
            preparedStatement1.setInt(3, id);

            preparedStatement1.executeUpdate();


            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM  complain INNER JOIN `user` WHERE `complain`.user_id = `user`.id  AND `complain`.`active_status` != 0 AND complain.id = ?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Complain complain = new Complain();
                complain.setId(resultSet.getInt(1));
                complain.setTitle(resultSet.getString(2));
                complain.setCategory(resultSet.getString(3));
                complain.setDate(resultSet.getString(4));
                complain.setTime(resultSet.getString(5));
                complain.setDescription(resultSet.getString(6));
                complain.setCreatedAt(resultSet.getString(7));
                complain.setUserId(resultSet.getString(8));
                complain.setStatus(resultSet.getString(10));
                complain.setComment(resultSet.getString(11));
                complain.setComplainer(resultSet.getString(13));
                complain.setComplainerEmail(resultSet.getString(14));
                complain.setComplainerMobile(resultSet.getString(15));

                sendMail(complain, "Rejected");
            }


        } catch (Exception e) {
            e.printStackTrace();
            status = false;
        } finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }


        return status;
    }


   public static void sendMail(Complain complain, String status){
        String msg = "<!DOCTYPE html> <html> <head> <title></title> <meta http-equiv='Content-Type' content='text/html; charset=utf-8' /> <meta name='viewport' content='width=device-width, initial-scale=1'> <meta http-equiv='X-UA-Compatible' content='IE=edge' /> <style type='text/css'> @media screen {@font-face {font-family: 'Lato'; font-style: normal; font-weight: 400; src: local('Lato Regular'), local('Lato-Regular'), url(https://fonts.gstatic.com/s/lato/v11/qIIYRU-oROkIk8vfvxw6QvesZW2xOQ-xsNqO47m55DA.woff) format('woff'); } @font-face {font-family: 'Lato'; font-style: normal; font-weight: 700; src: local('Lato Bold'), local('Lato-Bold'), url(https://fonts.gstatic.com/s/lato/v11/qdgUG4U09HnJwhYI-uK18wLUuEpTyoUstqEm5AMlJo4.woff) format('woff'); } @font-face {font-family: 'Lato'; font-style: italic; font-weight: 400; src: local('Lato Italic'), local('Lato-Italic'), url(https://fonts.gstatic.com/s/lato/v11/RYyZNoeFgb0l7W3Vu1aSWOvvDin1pK8aKteLpeZ5c0A.woff) format('woff'); } @font-face {font-family: 'Lato'; font-style: italic; font-weight: 700; src: local('Lato Bold Italic'), local('Lato-BoldItalic'), url(https://fonts.gstatic.com/s/lato/v11/HkF_qI1x_noxlxhrhMQYELO3LdcAZYWl9Si6vvxL-qU.woff) format('woff'); } } /* CLIENT-SPECIFIC STYLES */ body, table, td, a {-webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; } table, td {mso-table-lspace: 0pt; mso-table-rspace: 0pt; } img {-ms-interpolation-mode: bicubic; } /* RESET STYLES */ img {border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none; } table {border-collapse: collapse !important; } body {height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important; } /* iOS BLUE LINKS */ a[x-apple-data-detectors] {color: inherit !important; text-decoration: none !important; font-size: inherit !important; font-family: inherit !important; font-weight: inherit !important; line-height: inherit !important; } /* MOBILE STYLES */ @media screen and (max-width:600px) {h1 {font-size: 32px !important; line-height: 32px !important; } } /* ANDROID CENTER FIX */ div[style*='margin: 16px 0;'] {margin: 0 !important; } </style> </head> <body style='background-color: #f4f4f4; margin: 0 !important; padding: 0 !important;'> <!-- HIDDEN PREHEADER TEXT --> <div style='display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: 'Lato', Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;'> </div> <table border='0' cellpadding='0' cellspacing='0' width='100%'> <!-- LOGO --> <tr> <td bgcolor='#FFA73B' align='center'> <table border='0' cellpadding='0' cellspacing='0' width='100%' style='max-width: 600px;'> <tr> <td align='center' valign='top' style='padding: 40px 10px 40px 10px;'> </td> </tr> </table> </td> </tr> <tr> <td bgcolor='#FFA73B' align='center' style='padding: 0px 10px 0px 10px;'> <table border='0' cellpadding='0' cellspacing='0' width='100%' style='max-width: 600px;'> <tr> <td bgcolor='#ffffff' align='center' valign='top' style='padding: 40px 20px 20px 20px; border-radius: 4px 4px 0px 0px; color: #111111; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; letter-spacing: 4px; line-height: 48px;'> <h1 style='font-size: 48px; font-weight: 400; margin: 2;'>Hello!</h1> <img src=' https://img.icons8.com/clouds/100/000000/handshake.png' width='125' height='120' style='display: block; border: 0px;' /> </td> </tr> </table> </td> </tr> <tr> <td bgcolor='#f4f4f4' align='center' style='padding: 0px 10px 0px 10px;'> <table border='0' cellpadding='0' cellspacing='0' width='100%' style='max-width: 600px;'> <tr> <td bgcolor='#ffffff' align='left' style='padding: 20px 30px 40px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;'> <p style='padding: 20px;'> Hello, "+complain.getComplainer()+", <br/> Your Complain '"+complain.getTitle()+"', <br/> Is "+status+". <br/> Please Login to the CyberCrime Website and check it! </p> </td> </tr> <tr> <td bgcolor='#ffffff' align='left' style='padding: 0px 30px 0px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;'> <p style='padding-left: 20px;'>If you have any questions, feel free to reply to the email and we will get back to you.</p> </td> </tr> <!-- COPY --> <tr> <td bgcolor='#ffffff' align='left' style='padding: 0px 30px 40px 30px; border-radius: 0px 0px 4px 4px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;'> <p style='padding-left: 20px;'>Regards,<br>CyberCrime Team</p> </td> </tr> </table> </td> </tr> <tr> <td bgcolor='#f4f4f4' align='center' style='padding: 30px 10px 0px 10px;'> <table border='0' cellpadding='0' cellspacing='0' width='100%' style='max-width: 600px;'> <tr> <td bgcolor='#FFECD1' align='center' style='padding: 30px 30px 30px 30px; border-radius: 4px 4px 4px 4px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;'> <h2 style='font-size: 20px; font-weight: 400; color: #111111; margin: 0;'>Need more help?</h2> <p style='margin: 0;'><a href='#' target='_blank' style='color: #FFA73B;'>We&rsquo;re here to help you out</a></p> </td> </tr> </table> </td> </tr> </table> <br> </body> </html>";

       try {
           Mail.sendMail(complain.getComplainerEmail(), "Your Complain " + status, msg);
           System.out.println("ok mail sent");
       } catch (Exception e) {
           e.printStackTrace();
       }

    }


}
