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
	<h1>전체 데이터 조회</h1>
	<% Class.forName("com.mysql.cj.jdbc.Driver"); 
		// get connection with server address, id, pw
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.17:3306/kopoctc", "root", "kopoctc");
		Statement stmt = conn.createStatement();
	
		try { 			
			ResultSet rset = stmt.executeQuery("select * from scores;");
			%>

			<table>
				<tr>
					<th>Name</th>
					<th>ID</th>
					<th>Korean</th>
					<th>English</th>
					<th>Math</th>
				</tr>
				
			
			<% while (rset.next()) { %>
				<tr>
					<td><a href="indi.jsp?id=<%= rset.getString(1) %>&name=<%= rset.getString(2) %>" target="main"><%= rset.getString(2) %></a></td>
					<td><%= rset.getString(1) %></td>
					<td><%= rset.getInt(3) %></td>
					<td><%= rset.getInt(4) %></td>
					<td><%= rset.getInt(5) %></td>
				</tr>
				
			<% } %>
			</table>
		<div><br>----End of data----</div>
		<% }
		catch (Exception e) {
		String err=e.getMessage();			
		%>
			<div>Error occurred.<br>
				<%=err %></div>
	<%	} finally {
		stmt.close();
		conn.close();
	}
	%>
</body>
</html>