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
        <title>CARICA</title>
    </head>
    <body>
     <% 
     int id = Integer.parseInt(request.getParameter("id"));
     String nome = request.getParameter("nome");
     String descrizione = request.getParameter("descrizione");
     String data = request.getParameter("data");
     %>
        <% 
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=bellati.samuele;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			//preparedStatement
			String sql = "INSERT INTO Evento (id, nome, descrizione, data) VALUES (?, ?, ?, ?);";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			
			pstmt.setInt(1, id);
			pstmt.setString(2, nome);
			pstmt.setString(3, descrizione);
			pstmt.setString(4, data);
			pstmt.executeUpdate();
		
	        out.println("evento inserito");

	        connection.close();
        %>
    </body>
</html>