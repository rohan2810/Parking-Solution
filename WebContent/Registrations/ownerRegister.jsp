<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>Owner Register Form</h1>
		<form action="<%=request.getContextPath()%>/registerOwner"
			method="post">
			<table style="with: 80%">
				<tr>
					<td>Username</td>
					<td><label> <input type="text" name="username" />
					</label></td>
				</tr>
				<tr>
					<td>Name</td>
					<td><label> <input type="text" name="name" />
					</label></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><label> <input type="email" name="email" />
					</label></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><label> <input type="password" name="password" />
					</label></td>
				</tr>
				<tr>
					<td>Phone-Number</td>
					<td><label> <input type="text" name="phonenumber" />
					</label></td>
				</tr>
				<tr>
					<td>Owner Code</td>
					<td><label> <input type="text" name="code" />
					</label></td>
				</tr>
			</table>
			<input type="submit" value="Submit" />
		</form>
		<form action="../login.jsp">
			<input type="submit" value="Already Registered? LOGIN here!" />
		</form>
	</div>
</body>
</html>