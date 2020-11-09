<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>User info</title>
    <link href="css/homestyles.css" rel="stylesheet">
    </head>
  <body>
    <h1>User info</h1>  
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
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM parkingsolution.user");
            while (rs.next()) {
                out.println(rs.getString(2) + " | " + rs.getString(3) + " | " + rs.getString(4) + " | " + rs.getString(6) + "<br/><br/>");
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
