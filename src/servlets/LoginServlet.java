package servlets;

import dao.LoginUserDao;
import model.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginUserDao loginUserDao;

    public void init() {
        loginUserDao = new LoginUserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = new User(username, password);

        try {
            if (loginUserDao.validate(user)) {
                String userType = loginUserDao.getLoginType(user);
                if (userType.equals("Owner")) {
                    response.sendRedirect("Dashboards/ownerDashboard.jsp");
                } else if (userType.equals("Operator")) {
                    response.sendRedirect("Dashboards/operatorDashboard.jsp");
                } else {
                    response.sendRedirect("Dashboards/customerDashboard.jsp");
                }
            } else {
                HttpSession session = request.getSession();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}