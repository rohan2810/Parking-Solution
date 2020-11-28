<!DOCTYPE html>
<%@page import="dao.LoginUserDao"%>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="css/login.css">
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

	<div class="sign_up">
		<form method="post" id="login"
			action="<%=request.getContextPath()%>/login">
			<h1>Login</h1>
			<label> Username: </label> <label> <input name="username"
				placeholder="Enter your username">
			</label><br> <br> <label> Password : </label> <label> <input
				type="password" name="password"
				placeholder="Enter your new password">
			</label><br> <br> <input type="submit" class="button" name="submit"
				value="Sign in">
		</form>
	</div>
</body>
</html>