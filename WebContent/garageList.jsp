<%@ page import="Utils.Util"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<html>
<head>
<link href="css/homestyles1.css" rel="stylesheet">
<link href="css/popup.css" rel="stylesheet">
<link href="css/textbox.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	background-color: #ff6347;
}
</style>
</head>
<body>
	<%
		if (session.getAttribute("uname") == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<header>
		<div class="container">
			<nav class="navbar fixed-top">
				<ul>
					<li><a href="home.jsp">HOME</a></li>
					<li><a href="dashboard.jsp">DASHBOARD</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<div id="label"></div>
	<select id="mySelect" name="forma" onchange="location = this.value;">
		<option value="garageList.jsp?sortBy=default">Sort By</option>
		<option value="garageList.jsp?sortBy=costAsc">Cost: Low to
			High</option>
		<option value="garageList.jsp?sortBy=costDes">Cost: High to
			Low</option>
		<option value="garageList.jsp?sortBy=availbDes">Availability:
			High to Low</option>
		<option value="garageList.jsp?sortBy=availbAsc">Availability:
			Low to High</option>

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
					String sortBy = request.getParameter("sortBy");

				try (Connection connection = Util.getConnection()) {
					PreparedStatement statement = connection.prepareStatement("SELECT * FROM parkingsolution.garage");
					switch (sortBy) {
					case "costAsc":
						statement = connection.prepareStatement("SELECT * FROM parkingsolution.garage ORDER BY Set_Cost ASC");
						break;
					case "costDes":
						statement = connection.prepareStatement("SELECT * FROM parkingsolution.garage ORDER BY Set_Cost DESC");
						break;
					case "availbDes":
						statement = connection.prepareStatement("SELECT * FROM parkingsolution.garage ORDER BY Number_Spots DESC");
						break;
					case "availbAsc":
						statement = connection.prepareStatement("SELECT * FROM parkingsolution.garage ORDER BY Number_Spots ASC");
						break;
					default:
						statement = connection.prepareStatement("SELECT * FROM parkingsolution.garage");
					}

					ResultSet rs = statement.executeQuery();
					int i = 1;
					while (rs.next()) {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=rs.getInt(2)%></td>
					<td><%=rs.getInt(3)%></td>
					<td><%=rs.getString(4)%><a
						href="timebooking.jsp?gid=<%=Util.getGarageId(rs.getString(4))%>"><strong>Select
								this Garage</strong></a><input type="hidden" name="id"
						value=<%=Util.getGarageId(rs.getString(4))%>></td>
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
