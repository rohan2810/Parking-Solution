<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="Utils.Util"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int id = Integer.parseInt((String) request.getParameter("id"));
	String username = (String) session.getAttribute("uname");
	int user_id = Util.getUserId(username);
	try (Connection connection = Util.getConnection()) {
		PreparedStatement statement2 = connection.prepareStatement("DELETE from Owner where Garage_Id = ?;");
		PreparedStatement statement1 = connection.prepareStatement("DELETE from booking where Garage_Id = ?;");

		statement1.setInt(1, id);
		statement2.setInt(1, id);
		statement1.executeUpdate();
		statement2.executeUpdate();

	} catch (SQLException e) {
		out.println("SQLException caught: " + e.getMessage());
	}
	response.sendRedirect("viewYourGarages.jsp?sortBy=default");
	%>
	deleted

</body>
</html>