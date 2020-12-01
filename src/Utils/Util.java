package Utils;

import java.sql.*;

public class Util {

	public static int getUserId(String username) throws ClassNotFoundException {
		String getUserId = "SELECT Id from parkingsolution.User where Username = ?";

		int id = 0;

		try (Connection connection = Util.getConnection()) {

			PreparedStatement preparedStatement1 = connection.prepareStatement(getUserId);
			preparedStatement1.setString(1, username);
			ResultSet rs = preparedStatement1.executeQuery();
			rs.next();
			id = rs.getInt(1);

		} catch (SQLException e) {
			printSQLException(e);
		}
		return id;
	}

	public static String getName(int userId) throws ClassNotFoundException {
		String getUserId = "SELECT Name from parkingsolution.User where Id = ?";

		String nameString = "";

		try (Connection connection = Util.getConnection()) {

			PreparedStatement preparedStatement1 = connection.prepareStatement(getUserId);
			preparedStatement1.setInt(1, userId);
			ResultSet rs = preparedStatement1.executeQuery();
			rs.next();
			nameString = rs.getString(1);

		} catch (SQLException e) {
			printSQLException(e);
		}
		return nameString;
	}

	public static int getCarId(String numberPlate) throws ClassNotFoundException {
		String getCarId = "SELECT Car_Id from parkingsolution.Car where Number_Plate = ?";

		int carId = 0;

		try (Connection connection = Util.getConnection()) {

			PreparedStatement preparedStatement1 = connection.prepareStatement(getCarId);
			preparedStatement1.setString(1, numberPlate);
			ResultSet rs = preparedStatement1.executeQuery();
			rs.next();
			carId = rs.getInt(1);

		} catch (SQLException e) {
			printSQLException(e);
		}
		return carId;
	}

	public static int getGarageId(String garageName) throws ClassNotFoundException {
		String getGarageId = "SELECT Garage_Id from parkingsolution.Garage where Garage_Name = ?";

		int id = 0;

		try (Connection connection = Util.getConnection()) {

			PreparedStatement preparedStatement1 = connection.prepareStatement(getGarageId);
			preparedStatement1.setString(1, garageName);
			ResultSet rs = preparedStatement1.executeQuery();
			rs.next();
			id = rs.getInt(1);

		} catch (SQLException e) {
			printSQLException(e);
		}
		return id;
	}

	public static String getGarageName(int garage_id) throws ClassNotFoundException {
		String getGarageId = "SELECT Garage_Name from parkingsolution.Garage where Garage_Id = ?";

		String garageName = "";

		try (Connection connection = Util.getConnection()) {

			PreparedStatement preparedStatement1 = connection.prepareStatement(getGarageId);
			preparedStatement1.setInt(1, garage_id);
			ResultSet rs = preparedStatement1.executeQuery();
			rs.next();
			garageName = rs.getString(1);

		} catch (SQLException e) {
			printSQLException(e);
		}
		return garageName;
	}

	public static int getGarageIdFromUsermame(String username) throws ClassNotFoundException {
		int userId = Util.getUserId(username);
		String getGarageId = "SELECT Garage_Id from parkingsolution.Owner where User_Id = ?";

		int id = 0;

		try (Connection connection = Util.getConnection()) {

			PreparedStatement preparedStatement1 = connection.prepareStatement(getGarageId);
			preparedStatement1.setInt(1, userId);
			ResultSet rs = preparedStatement1.executeQuery();
			rs.next();
			id = rs.getInt(1);

		} catch (SQLException e) {
			printSQLException(e);
		}
		return id;
	}

	public static int getGarageIdFromUsermameOpr(String username) throws ClassNotFoundException {
		int userId = Util.getUserId(username);
		String getGarageId = "SELECT Garage_Id from parkingsolution.Operator where User_Id = ?";

		int id = 0;

		try (Connection connection = Util.getConnection()) {

			PreparedStatement preparedStatement1 = connection.prepareStatement(getGarageId);
			preparedStatement1.setInt(1, userId);
			ResultSet rs = preparedStatement1.executeQuery();
			rs.next();
			id = rs.getInt(1);

		} catch (SQLException e) {
			printSQLException(e);
		}
		return id;
	}

	public static String getCarNumber(int id) throws ClassNotFoundException {
		String getGarageId = "SELECT Number_Plate from parkingsolution.Car where Car_Id = ?";

		String number = "";

		try (Connection connection = Util.getConnection()) {

			PreparedStatement preparedStatement1 = connection.prepareStatement(getGarageId);
			preparedStatement1.setInt(1, id);
			ResultSet rs = preparedStatement1.executeQuery();
			rs.next();
			number = rs.getString(1);

		} catch (SQLException e) {
			printSQLException(e);
		}
		return number;
	}

	public static int getBookingCountForCar(int car_Id) {

		String getCount = "SELECT COUNT(*) FROM parkingsolution.Booking WHERE Car_Id = ?";

		int count = 0;

		try (Connection connection = Util.getConnection()) {

			PreparedStatement preparedStatement1 = connection.prepareStatement(getCount);
			preparedStatement1.setInt(1, car_Id);
			ResultSet rs = preparedStatement1.executeQuery();
			rs.next();
			count = rs.getInt(1);

		} catch (SQLException e) {
			printSQLException(e);
		}
		return count;

	}

	public static int getCost(int garageId) {

		String getCost = "SELECT Set_Cost FROM parkingsolution.Garage WHERE Garage_Id = ?";

		int cost = 0;
		try (Connection connection = Util.getConnection()) {
			PreparedStatement preparedStatement1 = connection.prepareStatement(getCost);
			preparedStatement1.setInt(1, garageId);
			ResultSet rs = preparedStatement1.executeQuery();
			rs.next();
			cost = rs.getInt(1);

		} catch (SQLException e) {
			printSQLException(e);
		}
		return cost;
	}

	public static String getSpot(int garageId) {

		String update = "UPDATE parkingsolution.floor,garage SET floor.Total_Booked= floor.Total_Booked+1 WHERE floor.garage_ID = garage.garage_Id and garage.garage_Id = ?;";
		String getFLoor = "SELECT floor_Id FROM parkingsolution.Floor, Garage where Floor.Garage_Id = Garage.Garage_Id and garage.Garage_Id = ? and floor.Total_Available>0;";
		String getSpot = "SELECT Spot_Id FROM parkingsolution.Floor, Garage, Spot where Floor.Garage_Id = Garage.Garage_Id and garage.Garage_Id = ? and "
				+ "floor.floor_Id = ? and spot.Garage_Id = garage.Garage_Id and  spot.Garage_Id = floor.Garage_Id and floor.Total_Available > 0\n"
				+ "";

		int floor = 0;
		int spot = 0;
		try (Connection connection = Util.getConnection()) {
			PreparedStatement preparedStatement1 = connection.prepareStatement(update);
			preparedStatement1.setInt(1, garageId);
			preparedStatement1.executeUpdate();

			PreparedStatement preparedStatement2 = connection.prepareStatement(getFLoor);
			preparedStatement2.setInt(1, garageId);
			ResultSet rSet = preparedStatement2.executeQuery();
			while (rSet.next()) {
				floor = rSet.getInt(1);
			}

			PreparedStatement preparedStatement3 = connection.prepareStatement(getSpot);
			preparedStatement3.setInt(1, garageId);
			preparedStatement3.setInt(2, floor);
			ResultSet rSet1 = preparedStatement3.executeQuery();
			while (rSet1.next()) {
				spot = rSet1.getInt(1);
			}

		} catch (SQLException e) {
			printSQLException(e);
		}
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append(garageId);
		sBuilder.append(floor);
		sBuilder.append(spot);

		return sBuilder.toString();
	}

	public static void printSQLException(SQLException ex) {
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

	public static Connection getConnection() {
		String user = "root";
		String password = "root";
		Connection con = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingsolution", user, password);

		} catch (Exception e) {
			assert e instanceof SQLException;
			Util.printSQLException((SQLException) e);
		}
		return con;
	}

}
