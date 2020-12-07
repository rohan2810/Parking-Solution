package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utils.Util;
import model.User;

@WebServlet("/update")
public class UpdateGarageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String floor = request.getParameter("floor");
		String spot = request.getParameter("spot");
		HttpSession session = request.getSession();
		int id = Integer.parseInt((String) request.getParameter("id"));
		Util.updateGarage(id, Integer.parseInt(floor), Integer.parseInt(spot));
		response.sendRedirect("Dashboards/ownerDashboard.jsp");
	}
}