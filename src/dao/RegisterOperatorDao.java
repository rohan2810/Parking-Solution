package dao;

import model.Operator;

import java.sql.*;

public class RegisterOperatorDao {

    public void registerOperator(Operator operator) throws ClassNotFoundException {
        String insertUser = "INSERT INTO parkingsolution.User" + "(Username, Email, Name, Password, Phone_Number) VALUES "
                + " (?, ?, ?, ?,?);";
        String getUserId = "SELECT Id from parkingsolution.User where Username = ?";
        String insertOperator = "INSERT INTO parkingsolution.Operator" + "(User_Id, Garage_Id, Operator_Code) VALUES "
                + " (?, ?, ?);";

        int id;
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingsolution","root","root")){

            PreparedStatement preparedStatement = connection.prepareStatement(insertUser);
            preparedStatement.setString(1, operator.getUsername());
            preparedStatement.setString(2, operator.getEmail());
            preparedStatement.setString(3, operator.getName());
            preparedStatement.setString(4, operator.getPassword());
            preparedStatement.setString(5, operator.getPhone_number());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();

            PreparedStatement preparedStatement1 = connection.prepareStatement(getUserId);
            preparedStatement1.setString(1, operator.getUsername());
            System.out.println(preparedStatement1);
            ResultSet rs = preparedStatement1.executeQuery();
            rs.next();
            id = rs.getInt(1);

            PreparedStatement preparedStatement2 = connection.prepareStatement(insertOperator);
            preparedStatement2.setInt(1, id);
            preparedStatement2.setInt(2, Integer.parseInt(operator.getOperatorCode().substring(0, 2)));
            preparedStatement2.setString(3, operator.getOperatorCode());
            System.out.println(preparedStatement2);
            preparedStatement2.executeUpdate();


        } catch (SQLException e) {
            printSQLException(e);
        }

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

