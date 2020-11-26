package dao;

import model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Utils.Util;

public class RegisterCustomerDao {

	public void registerCustomer(User user) throws ClassNotFoundException {
		String insertUser = "INSERT INTO parkingsolution.User"
				+ "(Username, Email, Name, Password, Phone_Number) VALUES " + " (?, ?, ?, ?,?);";
		try (Connection connection = Util.getConnection()) {

			PreparedStatement preparedStatement = connection.prepareStatement(insertUser);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getName());
			preparedStatement.setString(4, user.getPassword());
			preparedStatement.setString(5, user.getPhone_number());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			Util.printSQLException(e);
		}

	}
}
