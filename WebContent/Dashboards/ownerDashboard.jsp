<!DOCTYPE html>

<%@ page import="Utils.Util"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.dropbtn {
	background-color: #3498DB;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
	background-color: #2980B9;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	overflow: auto;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown a:hover {
	background-color: #ddd;
}

.show {
	display: block;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="../css/homestyles.css" rel="stylesheet">
<link href="../css/popup.css" rel="stylesheet">
<link href="../css/textbox.css" rel="stylesheet">
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
		<div class="container">
			<h3 class="projectTitle">ParkingSolution</h3>
			<nav class="navbar fixed-top">
				<ul>
					<li><a href="../home.jsp">HOME</a></li>
					<li><a href="../garageList.jsp?sortBy=default">GARAGE LIST</a></li>
					<li><a href="../manageBooking.jsp?sortBy=default">MANAGE
							BOOKING</a><input type="hidden" name="sortBy" value="default"></li>
					<li><a href="../showOperators.jsp">Show operators</a></li>
					<li><a href="../manageGarageBookings.jsp?sortBy=default">MANAGE
							GARAGE BOOKINGS</a><input type="hidden" name="sortBy" value="default"></li>
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
		<h1>/Owner Dashboard</h1>
		<h2>hello ${uname}</h2>
		<form action="<%=request.getContextPath()%>/logout">
			<input type="submit" value="Logout">
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