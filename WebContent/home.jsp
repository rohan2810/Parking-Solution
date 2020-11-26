<!DOCTYPE html>
<html lang="en-US">
<head>
<title>Parking!</title>
<link href="css/homestyles.css" rel="stylesheet">
<link href="css/popup.css" rel="stylesheet">
<link href="css/textbox.css" rel="stylesheet">
</head>
<body>
	<header>
		<div class="container">
			<h3 class="projectTitle">ParkingSolution</h3>
			<nav class="navbar fixed-top">
				<ul>
					<li><a href="home.jsp">HOME</a></li>
					<li><a href="gragelist.html">GARAGE LIST</a></li>
					<li><a href="reserveAspot.html">RESERVE A SPOT</a></li>
					<li><a href="managebooking.html">MANAGE BOOKING</a></li>
					<li><a href="customerRegister.jsp">REGISTER</a></li>
					<li><a href="login.html">LOGIN</a></li>
				</ul>
			</nav>
		</div>
	</header>

	<div class="userInput">
		<form>
			<label> <input placeholder="Enter Zip Code...." type="text" name="zip"></label>
			<button class="button button1" type="submit"
				formaction="searchByZip.jsp">get started</button>
		</form>
	</div>
	<section class="right">
		<!--
<div class="popup" onclick="myFunction()">
    <a href="#">or search by garage</a>
    <span class="popuptext" id="searchByGrage">no function yet</span>
</div>
<script>
    // When the user clicks on div, open the popup
    function myFunction() {
        var popup = document.getElementById("searchByGrage");
        popup.classList.toggle("show");
    }
</script>
-->
		<div>
			<form method="POST" id="searchByGrage" action="searchbygrage.jsp">
				<input type="submit" class="button button2" name="searchByGrage"
					value="or search by garage">
			</form>
		</div>
	</section>
	<!-- <section class="description">
<div class="desciption-div">
    <ul>

    </ul>
</div>
</section> -->
	<div class="footer">
		<div class="leftFooter">
			<li>FASTEST SOLUTION</li>
			<li>GREAT PRICING</li>
			<li>BEST SERVICE</li>
		</div>
		<div class="rightFooter">
			<li><a class="a a1" href="support.html"> <strong>Support</strong></a>
			</li>
			<li><a class="a a1" href="manageGarage.html"> <strong>Manage
						Your Garage</strong></a></li>
		</div>
	</div>
</body>
</html>