<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>4.application</title>
	<!-- 
		날짜 : 2024/08/06		
		이름 : 최준혁
		내용 : application 내장객체 실습하기
	 -->
</head>
<body>
	<h3>4.application 내장객체</h3>
	
	<h4>서버 정보</h4>
	<!-- 톰캣정보 -->
	<%= application.getServerInfo() %>
	
	<h4>파라미터 정보</h4>
	<%
		String param1 = application.getInitParameter("param1");
		String param2 = application.getInitParameter("param2");
	%>
	<!-- 서버 재부팅 필요 -->
	<p>
		param1 : <%= param1 %> <br>
		param2 : <%= param2 %> <br>
	</p>
	<!-- 워크스페이스랑 서버가 실행되는 자원경로가 다름 인지 -->
	<h4>자원경로 정보</h4>
	<%= application.getRealPath("./4.application.jsp") %>
	
</body>
</html>