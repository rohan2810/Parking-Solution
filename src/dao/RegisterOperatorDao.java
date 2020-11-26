package dao;

import Utils.Util;
import model.Operator;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static Utils.Util.printSQLException;

public class RegisterOperatorDao {

	public void registerOperator(Operator operator) throws ClassNotFoundException {
		String insertUser = "INSERT INTO parkingsolution.User"
				+ "(Username, Email, Name, Password, Phone_Number) VALUES " + " (?, ?, ?, ?,?);";
		String insertOperator = "INSERT INTO parkingsolution.Operator" + "(User_Id, Garage_Id, Operator_Code) VALUES "
				+ " (?, ?, ?);";

		int id;
		try (Connection connection = Util.getConnection()) {

			PreparedStatement preparedStatement = connection.prepareStatement(insertUser);
			preparedStatement.setString(1, operator.getUsername());
			preparedStatement.setString(2, operator.getEmail());
			preparedStatement.setString(3, operator.getName());
			preparedStatement.setString(4, operator.getPassword());
			preparedStatement.setString(5, operator.getPhone_number());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();

			id = Util.getUserId(operator.getUsername());

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

}
