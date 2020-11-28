package servlets;

import dao.RegisterCarDao;
import model.Car;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utils.Util;

import java.io.IOException;

@WebServlet("/registerCar")
public class CarRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RegisterCarDao registerCarDao;

	public void init() {
		registerCarDao = new RegisterCarDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("uname");
		String model = request.getParameter("model");
		String color = request.getParameter("color");
		String numberPlate = request.getParameter("numberPlate");
		Car car = new Car(numberPlate, color, model);

		try {
			registerCarDao.registerCar(car, Util.getUserId(username));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("Dashboards/customerDashboard.jsp");
	
	}
}