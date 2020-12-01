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

import Utils.Util;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingDao bookingDao = new BookingDao();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("uname");
		int garageId = (int) session.getAttribute("gid");
		String num = request.getParameter("carNum");
		int carId = 0;
		try {
			carId = Util.getCarId(num);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		String spot = Util.getSpot(garageId);
		String starttime = request.getParameter("startTime");
		String endtime = request.getParameter("endTime");
		
		int cost = ((Integer.parseInt(endtime) - Integer.parseInt(starttime)) * Util.getCost(garageId));

		Booking booking = new Booking(Integer.parseInt(spot), Integer.parseInt(starttime), Integer.parseInt(endtime), cost);
		try {
			bookingDao.booking(booking, Util.getUserId(username), garageId, carId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("Dashboards/customerDashboard.jsp");
	}

}
