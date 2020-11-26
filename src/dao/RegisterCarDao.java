package dao;

import model.Car;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Utils.Util;



public class RegisterCarDao {

    public void registerCar(Car car) throws ClassNotFoundException {
        String insertCar = "INSERT INTO parkingsolution.Car" + "(Car_Id, Color, Model, Number_Plate, User_Id) VALUES "
                + " (?, ?, ?, ?,?);";
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingsolution", "root", "root")) {
            PreparedStatement preparedStatement = connection.prepareStatement(insertCar);
            preparedStatement.setString(1, Car.getCar_Id());
            preparedStatement.setString(2, Car.getColor());
            preparedStatement.setString(3, Car.getModel());
            preparedStatement.setString(4, Car.getNumber_Plate());
            preparedStatement.setString(5, Car.getUser_Id());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            Util.printSQLException(e);
        }

    }
}
