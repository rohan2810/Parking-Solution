package servlets;

import dao.RegisterGarageDao;
import model.Garage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/registerGarage")
public class GarageRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RegisterGarageDao registerGarageDao;

    public void init() {
        registerGarageDao = new RegisterGarageDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String garageName = request.getParameter("garageName");
        int setCost = Integer.parseInt(request.getParameter("setCost"));
        String zip = request.getParameter("zip");
        String garageAddress = request.getParameter("garageAddress");
        int numberFloors = Integer.parseInt(request.getParameter("numberFloors"));
        int numberSpots = Integer.parseInt(request.getParameter("numberSpots"));
        String username = request.getParameter("username");

        Garage garage = new Garage(garageName, setCost, zip, garageAddress, numberFloors, numberSpots);
        String ownerCode = null;
        try {
            ownerCode = registerGarageDao.registerGarage(garage, username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("OwnerCode", ownerCode);
        request.getRequestDispatcher("garageAdded.jsp").forward(request, response);
    }

}