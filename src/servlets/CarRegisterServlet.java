package servlets;

import dao.RegisterCarDao;
import model.Car;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

        String model = request.getParameter("model");
        String color = request.getParameter("color");
        String numberPlate = request.getParameter("numberPlate");
        
        Car car = new Car(model, color, numberPlate);
        
//        String ownerCode = null;  (NOT SURE WHAT GOES HERE AND CAR_ID AND USERNAME ATTRIBUTES TO BE
//        try {                         ADDED ABOVE)
//            ownerCode = registerGarageDao.registerGarage(garage, username);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        request.setAttribute("OwnerCode", ownerCode);
//        request.getRequestDispatcher("garageAdded.jsp").forward(request, response);
    }
}