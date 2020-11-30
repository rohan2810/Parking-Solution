<!DOCTYPE html>
<html lang="en-US">
<head>
<title>Parking!</title>
<link href="css/homestyles.css" rel="stylesheet">
<link href="css/popup.css" rel="stylesheet">
<link href="css/textbox.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.dropbtn {
	background-color: #4CAF50;
	color: white;
	font-size: 30px;
	border: none;
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
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	bottom: 100%;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}
</style>
</head>
<body>
	<header>
		<div class="container">
			<h3 class="projectTitle">ParkingSolution</h3>
			<nav class="navbar fixed-top">
				<ul>
					<li><a href="home.jsp">HOME</a></li>
					<li><a href="dashboard.jsp">DASHBOARD</a></li>
					<li><a href="garageList.jsp?sortBy=default">GARAGE LIST</a></li>
					<li><a href="Registrations/customerRegister.jsp">REGISTER</a></li>
					<li><a href="login.jsp">LOGIN</a></li>
				</ul>
			</nav>
		</div>
	</header>

	<div class="userInput">
		<form>
			<label> <input placeholder="Enter Zip Code...." type="text"
				name="zip"> <input type="hidden" name="sortBy"
				value="default">
			</label>
			<button class="button button1" type="submit"
				formaction="searchByZip.jsp">get started</button>
		</form>
	</div>
	<section class="right">
		<div>
			<form class="search" action="searchByName.jsp?sortBy=default">
				<input type="text" placeholder="Or Search by Garage Name...."
					name="search"><input type="hidden" name="sortBy"
					value="default">
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
	<div class="footer">
		<div class="leftFooter">
			<li>FASTEST SOLUTION</li>
			<li>GREAT PRICING</li>
			<li>BEST SERVICE</li>
		</div>
		<div class="rightFooter">
			<li><a class="a a1" href="support.html"> <strong>Support</strong></a>
			</li>
			<div class="dropdown">
				<button class="dropbtn">Manage Your Garage</button>
				<div class="dropdown-content">
					<a href="Registrations/ownerRegister.jsp">Owner</a> <a
						href="Registrations/operatorRegister.jsp">Operator</a>
				</div>
			</div>
			<!-- <li><a class="a a1" href="manageGarage.html"> <strong>Manage
						Your Garage</strong></a></li> -->
		</div>
	</div>
</body>
</html>