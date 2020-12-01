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
<title>Operator Dashboard</title>
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
					<li><a class="dash1" href="../home.jsp">HOME</a></li>
					<li><a class="dash1" href="../garageList.jsp?sortBy=default">GARAGE
							LIST</a></li>
					<li><a class="dash1" href="../previousBookings.jsp">PREVIOUS
							BOOKINGS</a></li>
					<li><a class="dash1" href="../manageBooking.jsp">MANAGE NEW
							BOOKINGS</a></li>
					<li><a class="dash1"
						href="../viewYourGaragesOpr.jsp?sortBy=default">View Your
							Garages</a><input type="hidden" name="sortBy" value="default"></li>
					<li><a class="dash1" href="../showOwner.jsp">Show owners</a></li>
					<li><a class="dash1"
						href="../manageGarageBookingsOpr.jsp?sortBy=default">MANAGE
							GARAGE BOOKINGS</a><input type="hidden" name="sortBy" value="default"></li>
				</ul>
			</nav>
		</div>
	</header>
	<div align="center">
		<h1 class="title">Operator Dashboard</h1>
		<h2 class="title">hello ${uname}</h2>
		<form action="<%=request.getContextPath()%>/logout">
			<input class="submitout" type="submit" value="Logout">
		</form>
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