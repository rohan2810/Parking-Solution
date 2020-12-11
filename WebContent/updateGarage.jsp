<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="Utils.Util"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<html>
<head>
<link href="css/homestyles1.css" rel="stylesheet">
<link href="css/popup.css" rel="stylesheet">
<link href="css/register.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class ="logininput">
		<form method="post" id="update"
			action="<%=request.getContextPath()%>/update">
			<h1>Update Floors and Spots</h1>
			<label class = "biglabel"> No. of Floors: </label> <label> <input class ="info1" name="floor"
				placeholder="New Floor number...">
			</label>
			<br> <br> 
			<label class = "biglabel"> No. of Spots : </label> <label> <input class ="info1"
				type="number" name="spot"
				placeholder="New Spot number...">
			</label><br> <br> <input type="submit" class="submit" name="submit"
				value="update"><input
						type="hidden" name="id"
						value=<%=Integer.parseInt((String) request.getParameter("id"))%>>
		</form>
	</div>

</body>
</html>