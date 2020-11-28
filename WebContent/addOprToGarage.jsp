<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="Utils.Util"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.Random"%>
<html>
<head>
<meta charset="UTF-8">
<title>Add Operator to Garage</title>
</head>
<body>
	<%
		int userId = Integer.parseInt(request.getParameter("id"));
	int garageId = (int) session.getAttribute("gid");
	String n = String.valueOf(garageId);
	Random rnd = new Random();
	int number = rnd.nextInt(9999);
	StringBuilder stringBuilder = new StringBuilder();
	stringBuilder.append(0).append(n);
	stringBuilder.append(String.format("%4d", number));
	try (Connection connection = Util.getConnection()) {
		PreparedStatement statement = connection.prepareStatement("INSERT INTO Operator VALUES (?,?,?)");
		statement.setInt(1, userId);
		statement.setInt(2, garageId);
		statement.setString(3, stringBuilder.toString());
		int rs = statement.executeUpdate();
	}
	response.sendRedirect("Dashboards/ownerDashboard.jsp");
	%>


</body>
</html>