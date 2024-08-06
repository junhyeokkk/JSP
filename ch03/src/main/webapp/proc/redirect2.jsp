<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>redirect2</title>	
	</head>
<body>
	<h3>redirect2 페이지</h3>
	<%
		//해당 주소로 다시 요청 명령
		response.sendRedirect("http://naver.com");
	%>
</body>
</html>