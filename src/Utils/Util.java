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
