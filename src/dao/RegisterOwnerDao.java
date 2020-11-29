package dao;

import Utils.Util;
import model.Owner;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static Utils.Util.printSQLException;

public class RegisterOwnerDao {
	public void registerOwner(Owner owner) throws ClassNotFoundException {
		String insertUser = "INSERT INTO parkingsolution.User"
				+ "(Username, Email, Name, Password, Phone_Number) VALUES " + " (?, ?, ?, ?,?);";
		String insertOperator = "INSERT INTO parkingsolution.Owner" + "(User_Id, Garage_Id, Owner_Code) VALUES "
				+ " (?, ?, ?);";

		int id;
		try (Connection connection = Util.getConnection()) {

			PreparedStatement preparedStatement = connection.prepareStatement(insertUser);
			preparedStatement.setString(1, owner.getUsername());
			preparedStatement.setString(2, owner.getEmail());
			preparedStatement.setString(3, owner.getName());
			preparedStatement.setString(4, owner.getPassword());
			preparedStatement.setString(5, owner.getPhone_number());
			preparedStatement.executeUpdate();

			id = Util.getUserId(owner.getUsername());

			PreparedStatement preparedStatement2 = connection.prepareStatement(insertOperator);
			preparedStatement2.setInt(1, id);
			preparedStatement2.setInt(2, Integer.parseInt(owner.getOnwer_code().substring(0, 2)));
			preparedStatement2.setString(3, owner.getOnwer_code());
			preparedStatement2.executeUpdate();

		} catch (SQLException e) {
			printSQLException(e);
		}

	}

}
