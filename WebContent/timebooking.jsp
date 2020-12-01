<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="dao.BookingDao"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking!</title>
</head>
<body>
	<h2 style="color: Green;">Time Frame</h2>
	<div style="overflow-x: auto;">
	<form action="<%= request.getContextPath() %>/books" method="post">
		<table>
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
		  <tr>
		    <td><input type="checkbox" id="am12" name="am12" value="am12"></td>
		    <td><input type="checkbox" id="am1" name="am1" value="am1"></td>
		    <td><input type="checkbox" id="am2" name="am2" value="am2"></td>
		    <td><input type="checkbox" id="am3" name="am3" value="am3"></td>
		    <td><input type="checkbox" id="am4" name="am4" value="am4"></td>
		    <td><input type="checkbox" id="am5" name="am5" value="am5"></td>
		    <td><input type="checkbox" id="am6" name="am6" value="am6"></td>
		    <td><input type="checkbox" id="am7" name="am7" value="am7"></td>
		    <td><input type="checkbox" id="am8" name="am8" value="am8"></td>
		    <td><input type="checkbox" id="am9" name="am9" value="am9"></td>
		    <td><input type="checkbox" id="am10" name="am10" value="am10"></td>
		    <td><input type="checkbox" id="am11" name="am11" value="am11"></td>
		    <td><input type="checkbox" id="pm12" name="pm12" value="pm12"></td>
		    <td><input type="checkbox" id="pm1" name="pm1" value="pm1"></td>
		    <td><input type="checkbox" id="pm2" name="pm2" value="pm2"></td>
		    <td><input type="checkbox" id="pm3" name="pm3" value="pm3"></td>
		    <td><input type="checkbox" id="pm4" name="pm4" value="pm4"></td>
		    <td><input type="checkbox" id="pm5" name="pm5" value="pm5"></td>
		    <td><input type="checkbox" id="pm6" name="pm6" value="pm6"></td>
		    <td><input type="checkbox" id="pm7" name="pm7" value="pm7"></td>
		    <td><input type="checkbox" id="pm8" name="pm8" value="pm8"></td>
		    <td><input type="checkbox" id="pm9" name="pm9" value="pm9"></td>
		    <td><input type="checkbox" id="pm10" name="pm10" value="pm10"></td>
		    <td><input type="checkbox" id="pm11" name="pm11" value="pm11"></td>
		  </tr>
		</table>
			<input type="text" value="bookingid"></input>
			<input type="submit" value="Book this time"></input>
			
	</form>

	</div>
</body>
</html>