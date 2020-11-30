
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
	<div id="label"></div>
	<select id="mySelect" name="forma" onchange="location = this.value;">
		<option value="manageGarageBookings.jsp?sortBy=default">View
			By</option>
		<option value="manageGarageBookings.jsp?sortBy=default">All
			Bookings</option>
		<option value="manageGarageBookings.jsp?sortBy=old">Previous
			Bookings</option>
		<option value="manageGarageBookings.jsp?sortBy=new">Advanced
			Bookings</option>
		<%
			String username = (String) session.getAttribute("uname");
		String sortBy = request.getParameter("sortBy");
		int garageId = Util.getGarageIdFromUsermameOpr(username);
		%>
	</select>
	<h2 style="color: Tomato;">Booking:</h2>
	<h3 style="color: Tomato;"><%=Util.getGarageName(garageId)%></h3>
	<div style="overflow-x: auto;">
		<table>
			<tr>
				<th>S. No</th>
				<th>Booking Id</th>
				<th>Number_Plate</th>
				<th>Spot</th>
				<th>Start Time</th>
				<th>End Time</th>
				<th>Cost</th>
				<th>Booking Time</th>
			</tr>
			<div>
				<%
					try (Connection connection = Util.getConnection()) {
					PreparedStatement statement = connection
					.prepareStatement("SELECT * FROM parkingsolution.Booking WHERE Garage_Id = ?");
					switch (sortBy) {
					case "old":
						statement = connection
						.prepareStatement("SELECT * FROM parkingsolution.Booking WHERE Garage_Id = ? AND Start_Time < NOW();");
						break;
					case "new":
						statement = connection
						.prepareStatement("SELECT * FROM parkingsolution.Booking WHERE Garage_Id = ? AND Start_Time >= NOW();");
						break;
					default:
						statement = connection.prepareStatement("SELECT * FROM parkingsolution.Booking WHERE Garage_Id = ?");
					}
					statement.setInt(1, garageId);
					ResultSet rs = statement.executeQuery();
					int i = 1;
					while (rs.next()) {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=rs.getInt(1)%></td>
					<td><%=Util.getCarNumber(rs.getInt(3))%></td>
					<td><%=rs.getInt(4)%></td>
					<td><%=rs.getDate(6)%></td>
					<td><%=rs.getDate(7)%></td>
					<td><%=rs.getInt(8)%></td>
					<td><%=rs.getDate(9)%></td>
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
