<%@ page language="java" contentType="text/html; charset=UTF-8"
  import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create</title>
<link href="scores.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1>테이블 생성</h1>
	<% Class.forName("com.mysql.cj.jdbc.Driver"); 
		// get connection with server address, id, pw
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.17:3306/kopoctc", "root", "kopoctc");
		Statement stmt = conn.createStatement();
		String query = "";
		try {
		 	query = "CREATE TABLE scores("
				   + "id VARCHAR(20) PRIMARY KEY NOT NULL,"
				   + "studentName VARCHAR(10),"
				   + "korean INT,"
				   + "english INT,"
				   + "math INT"
				   + ");";
			stmt.execute(query);
			%>
			<div>Table created!</div>
	<% } catch (Exception e) {		%>
		<div>Table scores exist. Try delete option first. 
			
			<% 
			int count = 0;
			query = "SELECT COUNT(*) FROM scores;";
			ResultSet rset = stmt.executeQuery(query); 
			while(rset.next()) {count = rset.getInt(1);}%> <%=count%> record(s) found.
			</div>	
	<%	}  finally {
			stmt.close();
			conn.close();	
		}
	
	%>
</body>
</html>