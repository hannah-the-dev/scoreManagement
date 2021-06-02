<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
	<style>
	#blank {
		visibility: hidden;
	}
	</style>
</head>
<body style="background-color: lightgrey; color:black">
  <ul>
    <li><a href="create.jsp" target="main">Table 생성</a></li>
    <li><a href="drop.jsp" target="main">Table 삭제</a></li>
    <li><a href="insert.jsp" target="main">Data 삽입</a></li>
    <li><a href="select.jsp" target="main">Data 전체 조회</a></li>
    <li id="blank"></li>
	<li><a href="add.html" target="main">Data 추가</a></li>
	<li><a href="find.html" target="main">Data 정정/삭제</a></li>
    
  </ul>
</body>
</html>