package dao;

import model.Booking;
import java.sql.*;
import java.util.Random;
import Utils.Util;

public class BookingDao {
    public int booking(Booking booking) throws ClassNotFoundException {
        int result = 0;

        //
        
        
        
        
        //code gen
        int num = 05;
        String n = String.valueOf(num);
        System.out.println(num);
        Random rnd = new Random();
        int number = rnd.nextInt(9999);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(15);
        stringBuilder.append(String.format("%04d", number));
        //

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingsolution","root","root");

            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO parkingsolution.booking" + "(Booking_Id, User_Id, Spot, Code, Start_Time, End_Time, Car_no_plate, Cost, Booking_Time) VALUES" +"(?,?,?,?,?,?,?,?,?);")) {
            preparedStatement.setString(1, booking.getBookingid());
            preparedStatement.setString(2, booking.getUserid());
            preparedStatement.setString(3, booking.getSpot());
            preparedStatement.setString(4, booking.getCode());
            preparedStatement.setString(5, booking.getStarttime());
            preparedStatement.setString(6, booking.getEndtime());
            preparedStatement.setString(7, booking.getCarplate());
            preparedStatement.setString(8, booking.getCost());
            preparedStatement.setString(9, booking.getBookingtime());
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
        	Util.printSQLException(e);
        }
        System.out.println();
        return result;
    }

}
