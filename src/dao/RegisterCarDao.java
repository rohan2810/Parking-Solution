package dao;

import model.Car;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Utils.Util;

public class RegisterCarDao {

	public void registerCar(Car car) throws ClassNotFoundException {
		String insertCar = "INSERT INTO parkingsolution.Car" + "(Color, Model, Number_Plate, User_Id) VALUES "
				+ " (?, ?, ?, ?);";
		try (Connection connection = Util.getConnection()) {
			PreparedStatement preparedStatement = connection.prepareStatement(insertCar);
			preparedStatement.setString(1, car.getColor());
			preparedStatement.setString(2, car.getModel());
			preparedStatement.setString(3, car.getNumberPlate());
			preparedStatement.setInt(4, 1);
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			Util.printSQLException(e);
		}

	}
}
