<!DOCTYPE html>

<%@ page import="Utils.Util"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="ISO-8859-1">
<title>Owner Dashboard</title>
<link href="../css/dashboard.css" rel="stylesheet">
<link href="../css/register.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<header>
		<div>
			<h3 class="title">ParkingSolution</h3>
			<nav class="navbar fixed-top">
				<ul>
					<li><a class="dash" href="../home.jsp">HOME</a></li>
					<li><a class="dash" href="../garageList.jsp?sortBy=default">GARAGE
							LIST</a></li>
					<li><a class="dash" href="../Registrations/garageRegister.jsp">ADD A NEW GARAGE</a></li>
					<li><a class="dash" href="../previousBookings.jsp">PREVIOUS
							BOOKINGS</a></li>
					<li><a class="dash" href="../manageBooking.jsp">MANAGE NEW
							BOOKINGS</a></li>
					<li><a class="dash"
						href="../viewYourGarages.jsp?sortBy=default">VIEW YOUR GARAGES</a><input
						type="hidden" name="sortBy" value="default"></li>
					<li><a class="dash" href="../showOperators.jsp">SHOW
							OPERATORS</a></li>
					<li><a class="dash"
						href="../manageGarageBookings.jsp?sortBy=default">MANAGE
							GARAGE BOOKINGS</a><input type="hidden" name="sortBy" value="default"></li>
					<li>
						<form action="<%=request.getContextPath()%>/logout">
							<input class = "submitout" type="submit" value="Logout">
						</form>
					</li>
					<%
						String username = (String) session.getAttribute("uname");
					int garageId = Util.getGarageIdFromUsermame(username);
					try (Connection connection = Util.getConnection()) {
						PreparedStatement statement = connection.prepareStatement("SELECT * FROM parkingsolution.Operator");
						ResultSet rs = statement.executeQuery();
						session.setAttribute("gid", garageId);
						request.setAttribute("gid", garageId);
					%>
					<div class="dropdown">
						<button onclick="myFunction()" class="dropbtn">Add an
							Operator to your Garage</button>
						<div id="myDropdown" class="dropdown-content">
							<%
								while (rs.next()) {
							%>
							<a href="../addOprToGarage.jsp?id=<%=rs.getInt(1)%>"
								onclick="myFunction2()"><%=Util.getName(rs.getInt(1))%> </a>
							<%
								}
							}
							%>
						</div>
					</div>
				</ul>
			</nav>
		</div>





	</header>
	<div align="center">
		<h1 class="title">Owner Dashboard</h1>
		<h2 class="title">hello ${uname}</h2>
		<!-- <form action= "Logout">
			<a class="btn btn-info btn-lg"> <span
				class="glyphicon glyphicon-log-out"></span> Log out
			</a>
		</form> -->

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
			alert("Operator successfully added!");
		}
	</script>
</body>
</html>