<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="dao.BookingDao"%>
<%@ page import="Utils.Util"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">

<title>Booking!</title>
<link href="css/homestyles.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">
<link href="css/register.css" rel="stylesheet">
</head>
<body>

	<%
		int gid = Integer.parseInt((String) request.getParameter("gid"));
	String username = (String) session.getAttribute("uname");
	int user_id = Util.getUserId(username);
	/* 	String num = request.getParameter("carNum");
		int carId = Util.getCarId(num);
		session.setAttribute("cid", carId);
		request.setAttribute("cid", carId); */
	session.setAttribute("gid", gid);
	request.setAttribute("gid", gid);
	%>

	<header>
		<div class = booking>
			<nav class="navbar fixed-top">
				<a class = "bighome" href="home.jsp">HOME</a>
			</nav>
		</div>
	</header>

	<h2 align = center class="timeframe">Time Frame</h2>
	<div align="center" style="overflow-x: auto;">
		<form action="<%=request.getContextPath()%>/booking" method="post">
		<table>
			<tr>
				<td>Enter your car plate number number</td>
				<td><label> <input class = "info" type="text" name="carNum" required/>
				</label></td>
			</tr>
			<tr>
				<td>Enter starting Time(in 24H format)</td>
				<td><label> <input class = "info" type="text" name="startTime" required/>
				</label></td>
			</tr>
			<tr>
				<td>Enter ending Time(in 24H format)</td>
				<td><label> <input class = "info" type="text" name="endTime" required/>
				</label></td>
			</tr>
		</table>
			<input class = "submit" type="submit" value="Book this time" onclick="myFunction2()"></input>
		</form>
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
			alert("Booking successfully made!");
		}
	</script>
</body>
</html>