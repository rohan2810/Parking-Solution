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
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("uname") == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<div id="label"></div>
	<select id="mySelect" name="forma" onchange="location = this.value;">
		<option
			value="searchByZip.jsp?sortBy=default&zip=<%=request.getParameter("zip")%>">Sort
			By</option>
		<option
			value="searchByZip.jsp?sortBy=costAsc&zip=<%=request.getParameter("zip")%>">Cost:
			Low to High</option>
		<option
			value="searchByZip.jsp?sortBy=costDes&zip=<%=request.getParameter("zip")%>">Cost:
			High to Low</option>
		<option
			value="searchByZip.jsp?sortBy=availbDes&zip=<%=request.getParameter("zip")%>">Availability:
			High to Low</option>
		<option
			value="searchByZip.jsp?sortBy=availbAsc&zip=<%=request.getParameter("zip")%>">Availability:
			Low to High</option>
		<option
			value="searchByZip.jsp?sortBy=zipAsc&zip=<%=request.getParameter("zip")%>">Zip:
			Ascending</option>
		<option
			value="searchByZip.jsp?sortBy=zipDes&zip=<%=request.getParameter("zip")%>">Zip:
			Descending</option>


	</select>
	<h2 style="color: Tomato;">Garage List:</h2>
	<div style="overflow-x: auto;">
		<table>
			<tr>
				<th>Zip Code</th>
				<th>Price ($/ hr)</th>
				<th>Garage Name</th>
				<th>Garage Address</th>
				<th>Spots Available</th>
			</tr>
			<div>
				<%
					String sortBy = request.getParameter("sortBy");
				try (Connection connection = Util.getConnection()) {
					int parsedZip = Integer.parseInt((String) request.getParameter("zip"));
					PreparedStatement statement = connection
					.prepareStatement("SELECT * FROM parkingsolution.garage where Zip between ? and ?");
					switch (sortBy) {
					case "costAsc":
						statement = connection.prepareStatement(
						"SELECT * FROM parkingsolution.garage where Zip between ? and ? ORDER BY Set_Cost ASC");
						break;
					case "costDes":
						statement = connection.prepareStatement(
						"SELECT * FROM parkingsolution.garage where Zip between ? and ? ORDER BY Set_Cost DESC");
						break;
					case "availbDes":
						statement = connection.prepareStatement(
						"SELECT * FROM parkingsolution.garage where Zip between ? and ? ORDER BY Number_Spots DESC");
						break;
					case "availbAsc":
						statement = connection.prepareStatement(
						"SELECT * FROM parkingsolution.garage where Zip between ? and ? ORDER BY Number_Spots ASC");
						break;
					case "zipAsc":
						statement = connection
						.prepareStatement("SELECT * FROM parkingsolution.garage where Zip between ? and ? ORDER BY Zip ASC");
						break;
					case "zipDes":
						statement = connection
						.prepareStatement("SELECT * FROM parkingsolution.garage where Zip between ? and ? ORDER BY Zip DESC");
						break;
					default:
						statement = connection.prepareStatement("SELECT * FROM parkingsolution.garage where Zip between ? and ?");
					}
					statement.setString(1, parsedZip - 10 + "");
					statement.setString(2, parsedZip + 10 + "");
					ResultSet rs = statement.executeQuery();
					while (rs.next()) {
						if (Integer.parseInt(rs.getString(7)) > 0) {
				%>
				<tr>
					<td><%=rs.getInt(2)%></td>
					<td><%=rs.getInt(3)%></td>
					<td><%=rs.getString(4)%><a
						href='DisplayItems?ItemId=<%=rs.getString(4)%>'><strong>Select
								this Garage</strong></a></td>
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
