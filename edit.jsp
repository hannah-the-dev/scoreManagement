<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add record</title>
<link href="scores.css" rel="stylesheet" type="text/css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="scores.js"></script> 
</head>
<body>

	<% 	Class.forName("com.mysql.cj.jdbc.Driver"); 
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.17:3306/kopoctc", "root", "kopoctc");
		Statement stmtc = conn.createStatement();
		Statement stmtr = conn.createStatement();
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = "\"\"";
		String kor = "\"\"";
		String eng = "\"\"";
		String mat = "\"\"";
		
		try {
			ResultSet rcnt = stmtc.executeQuery("select count(*) from scores where id=" + id);
			while (rcnt.next()) { 
				if (rcnt.getInt(1) == 0) {  
					id = "\"No such ID.\"";   
				 	rcnt.close();
	%>	<script> idInvalid(); </script> 		
	<%
					break;
				} else {
					ResultSet rset = stmtr.executeQuery("select * from scores where id=" + id);
					while (rset.next()) {
						name="\""+ rset.getString(2) +"\"";
						kor=rset.getString(3);
						eng=rset.getString(4);
						mat=rset.getString(5);
						
					}
					rset.close();
				}
			}
				

	%>
				
	<h1>조회 및 정정/삭제</h1>
	<form method="get" accept-charset="UTF-8" onsubmit="return isSubmittable();">
		<input type="number" id="search" min="209901" size="300"
			value=<%= request.getParameter("id") %> style="border:1px solid #000" readonly>

		<table>
			<tr>
				<td>이름</td>	
				<td class="finding"><input type="text" name="name" value=<%= name %> required></td>
			</tr>
			<tr>
				<td>학번</td>
				<td class="finding"><input type="text" name="id" value=<%= id %> readonly></td>
			</tr>
			<tr>
				<td>국어</td>
				<td class="finding"><input type="number" name="kor" min="0" max="100" size="300" value=<%= kor %> required></td>
			</tr>
			<tr>
				<td>영어</td>
				<td class="finding"><input type="number" name="eng" min="0" max="100" value=<%= eng %> required></td>
			</tr>
			<tr>
				<td>수학</td>
				<td class="finding"><input type="number" name="mat" min="0" max="100" value=<%= mat %> required></td>
			</tr>
		</table>
		
		<input type="submit" id="edit" value="Update" formaction="update.jsp">
		<input type="reset" value="Reset">
		<input type="submit" id="delete" value="Delete" formaction="delete.jsp">
		

		
		
	<% }
		catch (Exception e) {		
		String err=e.toString();			
	%>
			<div>Error occurred.<br>
				<%=err %></div>	
				
	<%	} finally {
		stmtr.close();
		stmtc.close();
		conn.close();
	%>
		<button onClick='location.href="find.html"'>Back</button>
<%	}
%>
	</form>
	<script> 
	if ($("input[name='id']").val()=="No such ID.") {
		console.log(true);
		$("input[type='submit']").remove();
		$("input[type='reset']").remove();
		$("input[type='button']").remove();
	} else { console.log(false); }
	</script> 		
</body>
</html>