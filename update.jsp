<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update record</title>
<link href="scores.css" rel="stylesheet" type="text/css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="scores.js"></script>
</head>
<body>

	<% 	Class.forName("com.mysql.cj.jdbc.Driver"); 
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.17:3306/kopoctc", "root", "kopoctc");
		Statement stmt = conn.createStatement();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		
		try{
			String query  = "update scores set studentName = ?, korean = ?, english = ?, math = ? where id = ?;";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setInt(2, kor);
			pstmt.setInt(3, eng);
			pstmt.setInt(4, mat);
			pstmt.setString(5, id);

			pstmt.executeUpdate();
			
	%>
			
			<h1>데이터 업데이트 결과</h1>
		<%	pstmt.close();
			try { 			
				rset = stmt.executeQuery("select * from scores;");
		%>

			<table>
				<tr>
					<th>Name</th>
					<th>ID</th>
					<th>Korean</th>
					<th>English</th>
					<th>Math</th>
				</tr>
				
			
				<% while (rset.next()) { 
					if (rset.getString(1).equals(id)) { %>
					<tr id="updated">
				<%	} else { %>
					<tr>
				<% } %>
						<td><a href="indi.jsp?id=<%= rset.getString(1) %>&name=<%= rset.getString(2) %>" target="main"><%= rset.getString(2) %></a></td>
						<td><%= rset.getString(1) %></td>
						<td><%= rset.getInt(3) %></td>
						<td><%= rset.getInt(4) %></td>
						<td><%= rset.getInt(5) %></td>
					</tr>
				
			<% 	
				} %>
		</table>
		<% 	} catch (Exception e) {
			String err=e.getMessage();			
		%>
			<div>Error occurred.<br>
			<%=err %></div>
		<%	} finally {
			stmt.close();

			}
		%>
			
	<% 	} catch (Exception e) {
			String err=e.getMessage();
	%> 
			<div>Update failed.</div>
				<%=err %>
	<%	} finally {
			rset.close(); 
			conn.close();
		}
	%>

</body>
</html>