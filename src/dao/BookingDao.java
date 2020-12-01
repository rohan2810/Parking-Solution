package dao;

import model.Booking;
import java.sql.*;
import java.util.Random;
import Utils.Util;

public class BookingDao {
	public int booking(Booking booking, int user_Id, int garage_Id, int car_id) throws ClassNotFoundException {
		int result = 0;
		// random code generation
		Random rnd = new Random();
		int number = rnd.nextInt(999999);
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append(String.format("%06d", number));

		try (Connection connection = Util.getConnection()) {

			PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO parkingsolution.booking"
					+ "(User_Id, Car_Id, Spot, Code, Start_Hour, End_Hour,Date, Cost, Garage_Id,Booking_Time) VALUES"
					+ "(?,?,?,?,?,?,curdate(),?,?,now());");
			preparedStatement.setInt(1, user_Id);
			preparedStatement.setInt(2, car_id);
			preparedStatement.setInt(3, booking.getSpot());
			preparedStatement.setString(4, stringBuilder.toString());
			preparedStatement.setInt(5, booking.getStart_time());
			preparedStatement.setInt(6, booking.getEnd_time());
			preparedStatement.setInt(7, booking.getCost());
			preparedStatement.setInt(8, garage_Id);
			
			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			Util.printSQLException(e);
		}
		return result;
	}

}
