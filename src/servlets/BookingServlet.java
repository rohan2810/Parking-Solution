package servlets;

import dao.BookingDao;
import model.Booking;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/books")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingDao bookingDao = new BookingDao();
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookingid = request.getParameter("bookingid");	
		String userid = request.getParameter("userid");
		String spot = request.getParameter("spot");	
		String code = request.getParameter("code");
		String starttime = request.getParameter("starttime");	
		String endtime = request.getParameter("endtime");
		String carplate = request.getParameter("carplate");	
		String cost = request.getParameter("cost");
		String bookingtime = request.getParameter("bookingtime");
		
		Booking booking = new Booking(bookingid,userid,spot,code,starttime, endtime, carplate, cost, bookingtime);
		booking.setBookingid(bookingid);
		booking.setUserid(userid);
		booking.setSpot(spot);
		booking.setCode(code);
		booking.setStarttime(starttime);
		booking.setEndtime(endtime);
		booking.setCarplate(carplate);
		booking.setCost(cost);
		booking.setBookingtime(bookingtime);
		
		try {
            bookingDao.booking(booking);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("timebooking.jsp");
	}

}
