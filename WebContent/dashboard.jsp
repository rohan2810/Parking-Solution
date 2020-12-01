<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="dao.LoginUserDao"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (session.getAttribute("uname") != null) {
		LoginUserDao loginUserDao = new LoginUserDao();
		String userType = loginUserDao.getLoginType((String) session.getAttribute("uname"));
		if (userType.equals("Owner")) {
			response.sendRedirect("Dashboards/ownerDashboard.jsp");
		} else if (userType.equals("Operator")) {
			response.sendRedirect("Dashboards/operatorDashboard.jsp");
		} else {
			response.sendRedirect("Dashboards/customerDashboard.jsp");
		}
	}
		else{
			response.sendRedirect("login.jsp");
		}
	%>
</body>
</html>