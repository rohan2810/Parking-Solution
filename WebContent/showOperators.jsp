
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
		String username = (String) session.getAttribute("uname");
	int garageId = Util.getGarageIdFromUsermame(username);
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
	<h2 style="color: Tomato;">Operators Working at your garage:</h2>
	<h2 style="color: Tomato;"><%=Util.getGarageName(garageId)%></h2>
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
					.prepareStatement("SELECT * FROM Operator o, User u where o.User_Id = u.Id AND Garage_Id = ?");
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
