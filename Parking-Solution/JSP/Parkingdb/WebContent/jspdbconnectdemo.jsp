<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Get Started</title>
    <link href="css/homestyles.css" rel="stylesheet">
    </head>
  <body>
    <h1>Get started</h1>  
    <table border="5">
     <tr>
        <td>zip</td>
        <td>name</td>
        <td>address</td>
        <td>spots left</td>
        <br>
   	</tr>
   	<div>
    <% 
     String db = "parkingsolution";
        String user;
          user = "root";
        String password = "root";
        try {
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingsolution","root","root");
            //out.println(db + " database successfully opened.<br/><br/>");
            out.println("Garage List: <br/><br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM parkingsolution.garage");
            while (rs.next()) {
                out.println(rs.getInt(2) + " | " + rs.getString(4) + " | " + rs.getString(5) + " | " +rs.getString(7) + "<br/><br/>");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
	%>
	</div>
  </body>
</html>
