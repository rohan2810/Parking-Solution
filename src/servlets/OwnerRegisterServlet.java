package servlets;

import dao.RegisterOwnerDao;
import model.Owner;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/registerOwner")
public class OwnerRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RegisterOwnerDao registerOwnerDao;

    public void init() {
        registerOwnerDao = new RegisterOwnerDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String phonenumber = request.getParameter("phonenumber");
        String code = request.getParameter("code");

        Owner operator = new Owner(username, email, name, phonenumber, password, code);

        try {
            registerOwnerDao.registerOwner(operator);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("registersuccess.jsp");
    }
}