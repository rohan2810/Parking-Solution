<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register your car!</title>
</head>
<link href="../css/homestyles1.css" rel="stylesheet">
<link href="../css/popup.css" rel="stylesheet">
<link href="../css/register.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body>
	<header>
		<div class="container">
			<nav class="navbar fixed-top">
				<ul>
					<li><a href="../home.jsp">HOME</a></li>
					<li><a href="../dashboard.jsp">DASHBOARD</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<div align="center">
		<h1>Car Register Form</h1>
		<form class = "submit" action="<%=request.getContextPath()%>/registerCar" method="post">
			<table>
				<tr>
					<td>Model</td>
					<td><label> <input class = "info" type="text" name="model" />
					</label></td>
				</tr>
				<tr>
					<td>Color</td>
					<td><label> <input class = "info" type="text" name="color" />
					</label></td>
				</tr>
				<tr>
					<td>Plate Number</td>
					<td><label> <input class = "info" type="text" name="numberPlate" />
					</label></td>
				</tr>
			</table>
			<input class = "submit" type="submit" value="Submit" onclick="myFunction2()" />
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
			alert("Car successfully added!");
		}
	</script>
</body>
</html>