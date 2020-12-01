<!DOCTYPE html>
<%@page import="dao.LoginUserDao"%>
<html>
<head>
<link href="css/login2.css" rel="stylesheet">
<link href="css/popup.css" rel="stylesheet">
<link href="css/register.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<%
		if (session.getAttribute("uname") != null) {
		LoginUserDao loginUserDao = new LoginUserDao();
		String userType = loginUserDao.getLoginType((String) session.getAttribute("uname"));
		if (userType.equals("Owner")) {
			response.sendRedirect("Dashboards/ownerDashboard.jsp");
		} else if (userType.equals("Operator")) {
			response.sendRedirect("Dashboards/operatorDashboard.jsp");
		} else {
			response.sendRedirect("Dashboards/customerDashboard.jsp");
		}
	}
	%>
	<header>
		<div class="container"> 
			<nav class="navbar fixed-top">
				<ul>
					<li><a href="home.jsp">HOME</a></li>
					<li><a href="dashboard.jsp">DASHBOARD</a></li>
				</ul>
			</nav>
		</div>
	</header>

	<div class ="logininput">
		<form method="post" id="login"
			action="<%=request.getContextPath()%>/login">
			<h1>Login</h1>
			<label class = "biglabel"> Username: </label> <label> <input class ="info1" name="username"
				placeholder="Enter your username">
			</label>
			<br> <br> 
			<label class = "biglabel"> Password : </label> <label> <input class ="info1"
				type="password" name="password"
				placeholder="Enter your new password">
			</label><br> <br> <input type="submit" class="submit" name="submit"
				value="Sign in">
		</form>
	</div>
</body>
</html>