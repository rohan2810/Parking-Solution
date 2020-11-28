package dao;

import Utils.Util;
import model.Garage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import static Utils.Util.printSQLException;

public class RegisterGarageDao {

	public String registerGarage(Garage garage, String username) throws ClassNotFoundException {
		String insertUser = "INSERT INTO parkingsolution.Garage(Zip, Set_Cost, Garage_Name, Address, Number_Floors, Number_Spots) VALUES "
				+ " (?, ?, ?, ?, ?, ?);";
		String insertIntoOwner = "INSERT INTO parkingsolution.Owner(User_Id, Garage_Id, Owner_Code) VALUES "
				+ "(?, ?, ?);";
		String ownerCode = "";
		try (Connection connection = Util.getConnection()) {

			PreparedStatement preparedStatement = connection.prepareStatement(insertUser);
			preparedStatement.setString(1, garage.getZip());
			preparedStatement.setInt(2, garage.getSetCost());
			preparedStatement.setString(3, garage.getGarageName());
			preparedStatement.setString(4, garage.getGarageAddress());
			preparedStatement.setInt(5, garage.getNumberFloors());
			preparedStatement.setInt(6, garage.getNumberSpots());
			preparedStatement.executeUpdate();
			Random rnd = new Random();
			int number = rnd.nextInt(9999);
			int id = Util.getUserId(username);
			int garageId = Util.getGarageId(garage.getGarageName());
			StringBuilder stringBuilder = new StringBuilder();
			if (String.valueOf(garageId).length() == 2) {
				stringBuilder.append(garageId);
			}
			stringBuilder.append(String.format("%04d", number));

			ownerCode = stringBuilder.toString();
			PreparedStatement preparedStatement1 = connection.prepareStatement(insertIntoOwner);
			preparedStatement1.setInt(1, id);
			preparedStatement1.setInt(2, garageId);
			preparedStatement1.setString(3, ownerCode);
			preparedStatement1.executeUpdate();

		} catch (SQLException e) {
			printSQLException(e);
		}
		return ownerCode;
	}

}
