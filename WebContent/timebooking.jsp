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
<script type="text/javascript">
	var theCheckboxes = $(".only-one-booking input[type='checkbox']");
	theCheckboxes.click(function() {
		if (theCheckboxes.filter(":checked").length > 2)
			$(this).removeAttr("checked");
		alert("You can make one booking one time")
	});
</script>
<title>Booking!</title>
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


	<h2 style="color: Green;">Time Frame</h2>
	<div style="overflow-x: auto;">
		<form action="<%=request.getContextPath()%>/booking" method="post">
			<input type="text" name="carNum"
				placeholder="Enter your car plate number num..."> <input
				type="text" name="startTime"
				placeholder="Enter starting Time in 24H format..."> <input
				type="text" name="endTime"
				placeholder="Enter ending Time in 24H format...">
			<!-- 			<table>
				<tr>
					<th>12:00am</th>
					<th>1:00am</th>
					<th>2:00am</th>
					<th>3:00am</th>
					<th>4:00am</th>
					<th>5:00am</th>
					<th>6:00am</th>
					<th>7:00am</th>
					<th>8:00am</th>
					<th>9:00am</th>
					<th>10:00am</th>
					<th>11:00am</th>
					<th>12:00pm</th>
					<th>1:00pm</th>
					<th>2:00pm</th>
					<th>3:00pm</th>
					<th>4:00pm</th>
					<th>5:00pm</th>
					<th>6:00pm</th>
					<th>7:00pm</th>
					<th>8:00pm</th>
					<th>9:00pm</th>
					<th>10:00pm</th>
					<th>11:00pm</th>
				</tr>
				<tr class="only-one-booking">
					<td><input type="checkbox" id="12am" name="12am" value="12am"></td>
					<td><input type="checkbox" id="1am" name="1am" value="1am"></td>
					<td><input type="checkbox" id="2am" name="2am" value="2am"></td>
					<td><input type="checkbox" id="3am" name="3am" value="3am"></td>
					<td><input type="checkbox" id="4am" name="4am" value="4am"></td>
					<td><input type="checkbox" id="5am" name="5am" value="5am"></td>
					<td><input type="checkbox" id="6am" name="6am" value="6am"></td>
					<td><input type="checkbox" id="7am" name="7am" value="7am"></td>
					<td><input type="checkbox" id="8am" name="8am" value="8am"></td>
					<td><input type="checkbox" id="9am" name="9am" value="9am"></td>
					<td><input type="checkbox" id="10am" name="10am" value="10am"></td>
					<td><input type="checkbox" id="11am" name="11am" value="11am"></td>
					<td><input type="checkbox" id="12pm" name="12pm" value="12pm"></td>
					<td><input type="checkbox" id="1pm" name="1pm" value="1pm"></td>
					<td><input type="checkbox" id="2pm" name="2pm" value="2pm"></td>
					<td><input type="checkbox" id="3pm" name="3pm" value="3pm"></td>
					<td><input type="checkbox" id="4pm" name="4pm" value="4pm"></td>
					<td><input type="checkbox" id="5pm" name="5pm" value="5pm"></td>
					<td><input type="checkbox" id="6pm" name="6pm" value="6pm"></td>
					<td><input type="checkbox" id="7pm" name="7pm" value="7pm"></td>
					<td><input type="checkbox" id="8pm" name="8pm" value="8pm"></td>
					<td><input type="checkbox" id="9pm" name="9pm" value="9pm"></td>
					<td><input type="checkbox" id="10pm" name="10pm" value="10pm"></td>
					<td><input type="checkbox" id="11pm" name="11pm" value="11pm"></td>
				</tr>
			</table> -->
			<input type="submit" value="Book this time" onclick="myFunction2()"></input>
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