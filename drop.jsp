<%@ page language="java" contentType="text/html; charset=UTF-8"
  import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create</title>
</head>
<body>
	<h1>테이블 삭제</h1>
	<% Class.forName("com.mysql.cj.jdbc.Driver"); 
		// get connection with server address, id, pw
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.17:3306/kopoctc", "root", "kopoctc");
		Statement stmt = conn.createStatement();
		String query = "";
		try { 	
		query = "DROP table scores;";
			stmt.execute(query);
			
	%> Table dropped.
				
	<%	}catch (Exception e) {		
	%>
			<div>Table scores doesn't exist. Try create option first.</div>	
	<%	} finally {
		stmt.close();
		conn.close();
	}
	%>
</body>
</html>