<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Owner Register</title>
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
				</ul>
			</nav>
		</div>
	</header>
	<div align="center">
		<h1>Owner Register Form</h1>
		<form action="<%=request.getContextPath()%>/registerOwner"
			method="post">
			<table style="with: 80%">
				<tr>
					<td>Username</td>
					<td><label> <input class = "info" type="text" name="username" />
					</label></td>
				</tr>
				<tr>
					<td>Name</td>
					<td><label> <input class = "info" type="text" name="name" />
					</label></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><label> <input class = "info" type="email" name="email" />
					</label></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><label> <input class = "info" type="password" name="password" />
					</label></td>
				</tr>
				<tr>
					<td>Phone-Number</td>
					<td><label> <input class = "info" type="text" name="phonenumber" />
					</label></td>
				</tr>
				<tr>
					<td>Owner Code</td>
					<td><label> <input class = "info" type="text" name="code" />
					</label></td>
				</tr>
			</table>
			<input class = "submit" type="submit" value="Submit" />
		</form>
		<form action="../login.jsp">
			<input class = "already" type="submit" value="Already Registered? LOGIN here!" />
		</form>
	</div>
</body>
</html>