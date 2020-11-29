package servlets;

import dao.RegisterCustomerDao;
import model.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/registerCustomer")
public class CustomerRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RegisterCustomerDao registerCustomerDao;

	public void init() {
		registerCustomerDao = new RegisterCustomerDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String phonenumber = request.getParameter("phonenumber");

		User user = new User(username, email, name, phonenumber, password);

		try {
			registerCustomerDao.registerCustomer(user);
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect("Dashboards/customerDashboard.jsp");
	}
}