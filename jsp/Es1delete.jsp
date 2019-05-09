<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Delete</title>
    </head>
    <body>
     <% 
     String idevento = request.getParameter("IDevento");
     %>
        <% 
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=bellati.samuele;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			//preparedStatement
			String sql = "DELETE FROM Evento WHERE IDEvento = ?";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(1, idevento);
			
	        connection.close();
        %>
    </body>
</html>