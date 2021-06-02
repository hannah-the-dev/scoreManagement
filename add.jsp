<%@ page language="java" contentType="text/html; charset=UTF-8"
  import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create</title>
<link href="scores.css" rel="stylesheet" type="text/css" >

</head>
<body>
	<h1>성적 추가 결과</h1>
	<% Class.forName("com.mysql.cj.jdbc.Driver"); 
		// get connection with server address, id, pw
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.17:3306/kopoctc", "root", "kopoctc");
		Statement stmt = conn.createStatement();
		request.setCharacterEncoding("UTF-8");
		int kor = 0;
		int eng = 0;
		int mat = 0;	
		int id = 0;
		String name = request.getParameter("name");
		try {
		kor = Integer.parseInt(request.getParameter("kor"));
		eng = Integer.parseInt(request.getParameter("eng"));
		mat = Integer.parseInt(request.getParameter("mat"));
		} catch (NumberFormatException e) {
			%>
			<div>Please add score data in positive integer.</div>
	<%	}
	try {
		id = 209901;
		ResultSet maxId = stmt.executeQuery("select max(id) from scores;");
		while (maxId.next()) {
			if (maxId.getInt(1)!=0) {		//데이터가 있으면
				id = maxId.getInt(1) + 1;   
			}
		}
	} catch (Exception e) {
		String err=e.getMessage();
	%> 
		
		<div>Alert: </div>
			<%=err %>
<%	} finally {
	}
%>
	
<%	try{
		String query  = String.format("insert into scores values (%d, \"%s\", %d, %d, %d);", 
						id, name, kor, eng, mat);
		
		stmt.execute(query);
		query  = String.format("select * from scores where id = %d;", id);
		ResultSet rset = stmt.executeQuery(query);
		while (rset.next()) { %>
		
		Score added.
		<table>
		<tr>
			<td>이름</td>
			<td class="added"><%= rset.getString(2) %></td>
		</tr>
		<tr>
			<td>학번</td>
			<td class="added"><%= rset.getString(1) %></td>
		</tr>
		<tr>
			<td>국어</td>
			<td class="added"><%= rset.getInt(3) %></td>
		</tr>
		<tr>
			<td>영어</td>
			<td class="added"><%= rset.getInt(4) %></td>
		</tr>
		<tr>
			<td>수학</td>
			<td class="added"><%= rset.getInt(5) %></td>
		</tr>
	</table>
		
	<% } 			
		
	} catch (Exception e) {
		String err=e.getMessage();
	%> 
		
		<div>Insert failed.</div>
			<%=err %>
<%	} finally {
		stmt.close();
		conn.close();
	}
%>

</body>
</html>