package dao;

import Utils.Util;
import model.User;

import java.sql.*;

public class LoginUserDao {

	public boolean validate(User login) throws ClassNotFoundException {
		boolean status = false;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingsolution", "root",
				"root")) {

			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from parkingsolution.User where username = ? and password = ? ");
			preparedStatement.setString(1, login.getUsername());
			preparedStatement.setString(2, login.getPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();

		} catch (SQLException e) {
			Util.printSQLException(e);
		}
		return status;
	}

	public String getLoginType(String username) throws ClassNotFoundException {
		String type = null;
		try (Connection connection = Util.getConnection()) {
			int id = Util.getUserId(username);
			PreparedStatement checkOwner = connection
					.prepareStatement("SELECT * FROM parkingsolution.Owner WHERE User_Id = ?");
			checkOwner.setInt(1, id);
			ResultSet rs1 = checkOwner.executeQuery();
			if (rs1.next()) {
				type = "Owner";
			} else {
				PreparedStatement checkOperator = connection
						.prepareStatement("SELECT * FROM parkingsolution.Operator WHERE User_Id = ?");
				checkOperator.setInt(1, id);
				ResultSet rs2 = checkOperator.executeQuery();
				if (rs2.next()) {
					type = "Operator";
				} else {
					type = "Customer";
				}
			}

		} catch (SQLException e) {
			Util.printSQLException(e);
		}
		return type;
	}

}