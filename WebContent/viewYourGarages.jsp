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
		<option value="viewYourGarages.jsp?sortBy=default">Sort By</option>
		<option value="viewYourGarages.jsp?sortBy=costAsc">Cost: Low
			to High</option>
		<option value="viewYourGarages.jsp?sortBy=costDes">Cost: High
			to Low</option>
		<option value="viewYourGarages.jsp?sortBy=availbDes">Availability:
			High to Low</option>
		<option value="viewYourGarages.jsp?sortBy=availbAsc">Availability:
			Low to High</option>

	</select>
	<h2 style="color: Tomato;">You Garage List:</h2>
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
				String username = (String) session.getAttribute("uname");
				int user_id = Util.getUserId(username);
				try (Connection connection = Util.getConnection()) {
					PreparedStatement statement = connection.prepareStatement(
					"SELECT * FROM owner, garage where owner.Garage_Id = garage.Garage_Id and owner.User_Id = ?;");
					switch (sortBy) {
						case "costAsc" :
					statement = connection.prepareStatement(
							"SELECT * FROM owner, garage where owner.Garage_Id = garage.Garage_Id and owner.User_Id = ? ORDER BY Set_Cost ASC");
					break;
						case "costDes" :
					statement = connection.prepareStatement(
							"SELECT * FROM owner, garage where owner.Garage_Id = garage.Garage_Id and owner.User_Id = ? ORDER BY Set_Cost DESC");
					break;
						case "availbDes" :
					statement = connection.prepareStatement(
							"SELECT * FROM owner, garage where owner.Garage_Id = garage.Garage_Id and owner.User_Id = ? ORDER BY Number_Spots DESC");
					break;
						case "availbAsc" :
					statement = connection.prepareStatement(
							"SELECT * FROM owner, garage where owner.Garage_Id = garage.Garage_Id and owner.User_Id = ? ORDER BY Number_Spots ASC");
					break;
						default :
					statement = connection.prepareStatement(
							"SELECT * FROM owner, garage where owner.Garage_Id = garage.Garage_Id and owner.User_Id = ?");
					}

					statement.setInt(1, user_id);
					ResultSet rs = statement.executeQuery();
					int i = 1;
					while (rs.next()) {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=rs.getInt(5)%></td>
					<td><%=rs.getInt(6)%></td>
					<td><%=rs.getString(7)%><a
						href="deleteGarage.jsp?id=<%=Util.getGarageId(rs.getString(7))%>"
						onclick="myFunction2()"><strong>Delete This Garage</strong></a><input
						type="hidden" name="id"
						value=<%=Util.getGarageId(rs.getString(7))%>></td>
					<td><%=rs.getString(8)%></td>
					<td><%=rs.getInt(9)%></td>
					<%-- ?id=<%=Util.getGarageId(rs.getString(7))%> --%>
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
	<script>
		/* When the user clicks on the button, 
		 toggle between hiding and showing the dropdown content */
		function myFunction() {
			document.getElementById("myDropdown").classList.toggle("show");
		}

		// Close the dropdown if the user clicks outside of it
		window.onclick = function(event) {
			if (!event.target.matches('.dropbtn')) {
				var dropdowns = document
						.getElementsByClassName("dropdown-content");
				var i;
				for (i = 0; i < dropdowns.length; i++) {
					var openDropdown = dropdowns[i];
					if (openDropdown.classList.contains('show')) {
						openDropdown.classList.remove('show');
					}
				}
			}
		}
		function myFunction2() {
			alert("Garage successfully deleted!");
		}
	</script>
</body>
</html>
