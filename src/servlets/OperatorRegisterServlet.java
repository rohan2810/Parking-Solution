package servlets;

import dao.RegisterOperatorDao;
import model.Operator;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/registerOperator")
public class OperatorRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RegisterOperatorDao registerOperatorDao;

    public void init() {
        registerOperatorDao = new RegisterOperatorDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String phonenumber = request.getParameter("phonenumber");
        String code = request.getParameter("code");

        Operator operator = new Operator(username, email, name, phonenumber, password, code);

        try {
            registerOperatorDao.registerOperator(operator);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("Dashboards/ownerDashboard.jsp");
    }
}