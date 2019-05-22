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
        <title>Login</title>
    </head>
    <body>
     <% 
     String username = request.getParameter("username");
     String password = request.getParameter("psw");
     %>
        <% 
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=bellati.samuele;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			//preparedStatement
			String sql = "SELECT * FROM Cittadino WHERE username = ? AND password = ?";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			
	        if(rs.next()){
	            out.println("Login effettuato");
	            
	            String sql1 = "SELECT Evento.nome, Evento.ID, Comunicazione.IDC, Cittadino.ID FROM Comunicazione INNER JOIN Evento ON Comunicazione.IDE = Evento.ID INNER JOIN Cittadino ON Comunicazione.IDC = Cittadino.ID WHERE Username = ?";
	            
	            PreparedStatement stmtRicerca = connection.prepareStatement(sql1);
                stmtRicerca.setString(1, username);
                ResultSet rsRicerca = stmtRicerca.executeQuery();
	            
	        while(rsRicerca.next()){
	            String nome = rsRicerca.getString("nome");
	            out.println("<ul><li><a href= /jsp/Es1delete.jsp?ID=" + rsRicerca.getString("ID") + " >" + nome + "</a></li></ul>");
	           }
	           
	        }else{
	            out.println("fallito");
	        }
	        connection.close();
        %>
    </body>
</html>