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
		if (session.getAttribute("uname") == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<div id="label"></div>
	<select id="mySelect" name="forma" onchange="location = this.value;">
		<option
			value="searchByName.jsp?sortBy=default&search=<%=request.getParameter("search")%>">Sort
			By</option>
		<option
			value="searchByName.jsp?sortBy=costAsc&search=<%=request.getParameter("search")%>">Cost:
			Low to High</option>
		<option
			value="searchByName.jsp?sortBy=costDes&search=<%=request.getParameter("search")%>">Cost:
			High to Low</option>
		<option
			value="searchByName.jsp?sortBy=availbDes&search=<%=request.getParameter("search")%>">Availability:
			High to Low</option>
		<option
			value="searchByName.jsp?sortBy=availbAsc&search=<%=request.getParameter("search")%>">Availability:
			Low to High</option>
		<option
			value="searchByName.jsp?sortBy=zipAsc&search=<%=request.getParameter("search")%>">Zip:
			Ascending</option>
		<option
			value="searchByName.jsp?sortBy=zipDes&search=<%=request.getParameter("search")%>">Zip:
			Descending</option>


	</select>
	<h2 style="color: Tomato;">Garage List:</h2>
	<div style="overflow-x: auto;">
		<table>
			<tr>
				<th>S. No</th>
				<th>Zip Code</th>
				<th>Price ($/ hr)</th>
				<th>Garage Name</th>
				<th>Garage Address</th>
				<th>Spots Available</th>
			</tr>
			<div>
				<%
					String search = request.getParameter("search");
				String sortBy = request.getParameter("sortBy");

				try (Connection connection = Util.getConnection()) {
					PreparedStatement statement = connection
					.prepareStatement("SELECT * FROM parkingsolution.garage WHERE Garage_Name LIKE ?");
					switch (sortBy) {
					case "costAsc":
						statement = connection.prepareStatement(
						"SELECT * FROM parkingsolution.garage WHERE Garage_Name LIKE ? ORDER BY Set_Cost ASC");
						break;
					case "costDes":
						statement = connection.prepareStatement(
						"SELECT * FROM parkingsolution.garage WHERE Garage_Name LIKE ? ORDER BY Set_Cost DESC");
						break;
					case "availbDes":
						statement = connection.prepareStatement(
						"SELECT * FROM parkingsolution.garage WHERE Garage_Name LIKE ? ORDER BY Number_Spots DESC");
						break;
					case "availbAsc":
						statement = connection.prepareStatement(
						"SELECT * FROM parkingsolution.garage WHERE Garage_Name LIKE ? ORDER BY Number_Spots ASC");
						break;
					case "zipAsc":
						statement = connection
						.prepareStatement("SELECT * FROM parkingsolution.garage WHERE Garage_Name LIKE ? ORDER BY Zip ASC");
						break;
					case "zipDes":
						statement = connection
						.prepareStatement("SELECT * FROM parkingsolution.garage WHERE Garage_Name LIKE ? ORDER BY Zip DESC");
						break;
					default:
						statement = connection.prepareStatement("SELECT * FROM parkingsolution.garage WHERE Garage_Name LIKE ?");
					}
					statement.setString(1, "%" + search + "%");
					ResultSet rs = statement.executeQuery();
					int i = 1;
					while (rs.next()) {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=rs.getInt(2)%></td>
					<td><%=rs.getInt(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getInt(7)%></td>
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
