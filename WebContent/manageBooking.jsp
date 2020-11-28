
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
		<option value="manageBooking.jsp?sortBy=default">View
			By</option>
		<option value="manageBooking.jsp?sortBy=old">Previous
			Bookings</option>
		<option value="manageBooking.jsp?sortBy=new">Advanced
			Bookings</option>

	</select>
	<h2 style="color: Tomato;">Booking::</h2>
	<div style="overflow-x: auto;">
		<table>
			<tr>
				<th>S. No</th>
				<th>Booking Id</th>
				<th>Garage Name</th>
				<th>Number_Plate</th>
				<th>Spot</th>
				<th>Start Time</th>
				<th>End Time</th>
				<th>Cost</th>
				<th>Booking Time</th>
			</tr>
			<div>
				<%
					String username = (String) session.getAttribute("uname");
				String sortBy = request.getParameter("sortBy");

				try (Connection connection = Util.getConnection()) {
					PreparedStatement statement = connection
					.prepareStatement("SELECT * FROM parkingsolution.Booking WHERE User_Id = ?");
					switch (sortBy) {
					case "old":
						statement = connection
						.prepareStatement("SELECT * FROM parkingsolution.Booking WHERE User_Id = ? AND Start_Time < NOW();");
						break;
					case "new":
						statement = connection
						.prepareStatement("SELECT * FROM parkingsolution.Booking WHERE User_Id = ? AND Start_Time >= NOW();");
						break;
					default:
						statement = connection.prepareStatement("SELECT * FROM parkingsolution.Booking WHERE User_Id = ?");
					}
					statement.setInt(1, Util.getUserId(username));
					ResultSet rs = statement.executeQuery();
					int i = 1;
					while (rs.next()) {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=rs.getInt(1)%></td>
					<td><%=Util.getGarageName(rs.getInt(10))%></td>
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
