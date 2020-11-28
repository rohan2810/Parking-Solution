
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
	<h2 style="color: Tomato;">Cars:</h2>
	<div style="overflow-x: auto;">
		<table>
			<tr>
				<th>S. No</th>
				<th>Number Plate</th>
				<th>Color</th>
				<th>Model</th>
				<th>Bookings Made</th>
			</tr>
			<div>
				<%
					String username = (String) session.getAttribute("uname");

				try (Connection connection = Util.getConnection()) {
					PreparedStatement statement = connection.prepareStatement("SELECT * FROM parkingsolution.Car WHERE User_Id = ?");
					statement.setInt(1, Util.getUserId(username));
					ResultSet rs = statement.executeQuery();
					int i = 1;
					while (rs.next()) {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=Util.getBookingCountForCar(rs.getInt(1))%></td>
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
