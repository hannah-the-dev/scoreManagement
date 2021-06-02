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
	<% Class.forName("com.mysql.cj.jdbc.Driver"); 
		// get connection with server address, id, pw
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.17:3306/kopoctc", "root", "kopoctc");
		Statement stmt = conn.createStatement();
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		try { 	
			ResultSet rset = stmt.executeQuery("select * from scores where id=" + id);
			%>
			<h1>[<%= name %>] 조회</h1>
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
					<td><%= rset.getString(2) %></td>
					<td><%= rset.getString(1) %></td>
					<td><%= rset.getInt(3) %></td>
					<td><%= rset.getInt(4) %></td>
					<td><%= rset.getInt(5) %></td>
				</tr>
				
			<% } %>
		</table>
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