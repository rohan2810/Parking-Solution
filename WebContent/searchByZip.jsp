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

tr:nth-child(even) {
	background-color: #f2f2f2;
}
</style>
</head>
<body>
<h2 style="color:Tomato;">Garage List:</h2>
	<div style="overflow-x: auto;">
		<table>
			<tr>
				<th>Zip Code</th>
				<th>Garage Name</th>
				<th>Garage Address</th>
				<th>Spots Available</th>
			</tr>
			<div>
				<%
					try (Connection connection = Util.getConnection()) {
					int parsedZip = Integer.parseInt((String) request.getParameter("zip"));
					PreparedStatement statement = connection
					.prepareStatement("SELECT * FROM parkingsolution.garage where Zip between ? and ?");
					statement.setString(1, parsedZip - 10 + "");
					statement.setString(2, parsedZip + 10 + "");
					ResultSet rs = statement.executeQuery();
					while (rs.next()) {
						if (Integer.parseInt(rs.getString(7)) > 0) {
				%>
				<tr>
					<td><%=rs.getInt(2)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(7)%></td>
				</tr>
				<%
					}
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
