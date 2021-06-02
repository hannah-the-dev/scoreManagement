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
	<h1>레코드 입력</h1>
	<% Class.forName("com.mysql.cj.jdbc.Driver"); 
		// get connection with server address, id, pw
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.17:3306/kopoctc", "root", "kopoctc");
		Statement stmt = conn.createStatement();
		try{
			int id = 209901;
			ResultSet maxId = stmt.executeQuery("select max(id) from scores;");
			while (maxId.next()) {
				if (maxId.getInt(1)!=0) {		//데이터가 있으면
					id = maxId.getInt(1) + 1;   
				}
			}
	%> <div> id: <%=id%> <%
			maxId.close();
			stmt.execute(String.format("insert into scores value (%d, '나연', rand()*100, rand()*100, rand()*100);", id)); id++;
			stmt.execute(String.format("insert into scores value (%d, '정연', rand()*100, rand()*100, rand()*100);", id)); id++;
			stmt.execute(String.format("insert into scores value (%d, '모모', rand()*100, rand()*100, rand()*100);", id)); id++;
			stmt.execute(String.format("insert into scores value (%d, '사나', rand()*100, rand()*100, rand()*100);", id)); id++;
			stmt.execute(String.format("insert into scores value (%d, '지효', rand()*100, rand()*100, rand()*100);", id)); id++;
			stmt.execute(String.format("insert into scores value (%d, '미나', rand()*100, rand()*100, rand()*100);", id)); id++;
			stmt.execute(String.format("insert into scores value (%d, '다현', rand()*100, rand()*100, rand()*100);", id)); id++;
			stmt.execute(String.format("insert into scores value (%d, '채영', rand()*100, rand()*100, rand()*100);", id)); id++;
			stmt.execute(String.format("insert into scores value (%d, '쯔위', rand()*100, rand()*100, rand()*100);", id)); id++;
			stmt.execute(String.format("insert into scores value (%d, '나연', rand()*100, rand()*100, rand()*100);", id)); id++;
			stmt.execute(String.format("insert into scores value (%d, '정연',  rand()*100, rand()*100, rand()*100);", id)); id++;
			stmt.execute(String.format("insert into scores value (%d, '모모', rand()*100, rand()*100, rand()*100);", id)); id++;
			stmt.execute(String.format("insert into scores value (%d, '사나', rand()*100, rand()*100, rand()*100);", id)); id++;
			stmt.execute(String.format("insert into scores value (%d, '지효', rand()*100, rand()*100, rand()*100);", id)); id++;
			stmt.execute(String.format("insert into scores value (%d, '미나', rand()*100, rand()*100, rand()*100);", id)); id++;
			stmt.execute(String.format("insert into scores value (%d, '다현', rand()*100, rand()*100, rand()*100);", id)); id++;
			stmt.execute(String.format("insert into scores value (%d, '채영', rand()*100, rand()*100, rand()*100);", id)); id++;
			stmt.execute(String.format("insert into scores value (%d, '쯔위', rand()*100, rand()*100, rand()*100);", id)); 

	%>
	~ <%=id%>
	Inserted.</div>
		
	<%	
		} catch (Exception e) {
			String err=e.getMessage();
	%> 
		<div>Insert failed.<br>
			<%=err %></div>
	<%	} finally {
			stmt.close();
			conn.close();
		}
	%>
</body>
</html>