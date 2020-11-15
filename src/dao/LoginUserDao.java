package dao;


import model.User;

import java.sql.*;

public class LoginUserDao {

    public boolean validate(User login) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/parkingsolution", "root", "root")) {

            PreparedStatement preparedStatement = connection.prepareStatement("select * from parkingsolution.User where username = ? and password = ? ");
            preparedStatement.setString(1, login.getUsername());
            preparedStatement.setString(2, login.getPassword());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            printSQLException(e);
        }
        return status;
    }

    public String getLoginType(User user) throws ClassNotFoundException {
        String username = user.getUsername();
        String type = null;
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingsolution", "root", "root")) {
            PreparedStatement getId = connection.prepareStatement("SELECT Id FROM parkingsolution.User WHERE Username = ?");
            getId.setString(1, username);
            ResultSet rs = getId.executeQuery();
            rs.next();
            int Id = rs.getInt(1);

            PreparedStatement checkOwner = connection.prepareStatement("SELECT * FROM parkingsolution.Owner WHERE User_Id = ?");
            checkOwner.setInt(1, Id);
            ResultSet rs1 = checkOwner.executeQuery();
            if (rs1.next()) {
                type = "Owner";
            } else {
                PreparedStatement checkOperator = connection.prepareStatement("SELECT * FROM parkingsolution.Operator WHERE User_Id = ?");
                checkOperator.setInt(1, Id);
                ResultSet rs2 = checkOperator.executeQuery();
                rs2.next();
                if (rs2.next()) {
                    type = "Operator";
                } else {
                    type = "Customer";
                }
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return type;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}