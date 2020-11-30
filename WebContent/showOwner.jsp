
<%@ page import="Utils.Util"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<html>
<head>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
}

td a {
	display: block;
	width: 100%;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}
</style>
</head>
<body>

	<%
	String username = (String) session.getAttribute("uname");
int garageId = Util.getGarageIdFromUsermameOpr(username);

%>

	<h2 style="color: Tomato;">Owners of garages you work at:</h2>
	<div style="overflow-x: auto;">
		<table>
			<tr>
				<th>S. No</th>
				<th>Name</th>
				<th>Email</th>
				<th>Phone_number</th>
				<th>Code</th>
			</tr>
			<div>
				<%
					try (Connection connection = Util.getConnection()) {
					PreparedStatement statement = connection
					.prepareStatement("SELECT * FROM Owner o, User u where o.User_Id = u.Id AND Garage_Id = ?");
					statement.setInt(1, garageId);
					ResultSet rs = statement.executeQuery();
					int i = 1;
					while (rs.next()) {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(9)%></td>
					<td><%=rs.getString(3)%></td>
				</tr>
				<%
					}
				rs.close();
				} catch (SQLException e) {
				out.println("SQLException caught: " + e.getMessage());
				}
				%>

			</div>
		</table>
	</div>
</body>
</html>
