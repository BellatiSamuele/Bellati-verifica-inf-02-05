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
     String idevento = request.getParameter("ID");
     String username = request.getParameter("username");
     String idcittadino = request.getParameter("IDCitt");
     %>
        <% 
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=bellati.samuele;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			//preparedStatement
			String sql2 = "SELECT COUNT (IDE) FROM Comunicazione WHERE IDE = ? AND IDC = ?";
			PreparedStatement pstm1 = connection.prepareStatement(sql2);
			pstmt2.setString(1, idevento);
			pstmt2.setString(2, idcittadino);
			
			ResultSet rs = pstmt2.executeQuery();
			
			if(rs.next()){
			    
			String sql = "DELETE FROM Evento WHERE ID = ?";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(1, idevento);
		
		    pstmt.executeUpdate();
		    
		    response.sendRedirect("../html/es1login.html");
		
			    
			}else{
			    out.print("problem");
			}
			
	        connection.close();
        %>
    </body>
</html>