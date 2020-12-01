<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Garage Register </title>
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
		<h1>Garage Register Form</h1>
		<form action="<%=request.getContextPath()%>/registerGarage"
			method="post">
			<table style="with: 80%">
				<tr>
					<td>Garage Name</td>
					<td><label> <input class = "info" type="text" name="garageName" />
					</label></td>
				</tr>
				<tr>
					<td>Set Cost</td>
					<td><label> <input class = "info" type="number" name="setCost" min ="0"/>
					</label></td>
				</tr>
				<tr>
					<td>Zip</td>
					<td><label> <input class = "info" type="text" name="zip" />
					</label></td>
				</tr>
				<tr>
					<td>Address</td>
					<td><label> <input class = "info" type="text" name="garageAddress" />
					</label></td>
				</tr>
				<tr>
					<td>Number Of Floors</td>
					<td><label> <input class = "info" type="number" name="numberFloors" min ="1"/>
					</label></td>
				</tr>
				<tr>
					<td>Number Of Spots</td>
					<td><label> <input class = "info" type="number" name="numberSpots" min ="1"/>
					</label></td>
				</tr>
			</table>
			<input class = "submit" type="submit" value="Submit" onclick="myFunction2()" />
		</form>
	</div>
	<script type="text/javascript">
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
			alert("Your request is being processed. We will verify details and get back to you.");
		}
	</script>
</body>
</html>