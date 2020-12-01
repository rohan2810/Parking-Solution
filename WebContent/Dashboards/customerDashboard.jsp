<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Dashboard</title>
<link href="../css/dashboard.css" rel="stylesheet">
<link href="../css/popup.css" rel="stylesheet">
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
					<li><a class="dash" href="../previousBookings.jsp">PREVIOUS
							BOOKINGS</a></li>
					<li><a class="dash" href="../manageBooking.jsp">MANAGE NEW
							BOOKINGS</a></li>
					<li><a class="dash"
						href="../Registrations/carRegistration.jsp">ADD A NEW CAR</a></li>
					<li><a class="dash" href="../userCars.jsp">SEE YOUR CARS</a></li>
					<li>
						<form action="<%=request.getContextPath()%>/logout">
							<input class = "submitout" type="submit" value="Logout">
						</form>
					</li>
				</ul>
			</nav>
		</div>
	</header>
	<div align="center">
		<h1 class="title">Customer Dashboard</h1>
		<h2 class="title">hello ${uname}</h2>
		<!-- <form action= "Logout">
			<a class="btn btn-info btn-lg"> <span
				class="glyphicon glyphicon-log-out"></span> Log out
			</a>
		</form> -->

		<div class="biguserInput1">
			<form>
				<label> <input class="smallfont"
					placeholder="Enter Zip Code" type="text" name="zip"> <input
					type="hidden" name="sortBy" value="default">
				</label>
				<button class="button button1" type="submit"
					formaction="../searchByZip.jsp">get started</button>
			</form>
		</div>
		<section class="belowuserInput1">
			<div>
				<form class="search" action="../searchByName.jsp?sortBy=default">
					<input class="smallfont" type="text"
						placeholder="Or Search by Garage" name="search"><input
						type="hidden" name="sortBy" value="default">
					<button class="button button1" type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
			<!-- 		<div>
			<form method="POST" id="searchByGrage" action="searchbygrage.jsp">
				<input type="submit" class="button button2" name="searchByGrage"
					value="or search by garage">
			</form>
		</div> -->
		</section>
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