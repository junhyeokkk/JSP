<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1.Scriptlet</title>
	<!-- 
		날짜 : 2024/08/05
		이름 : 최준혁
		내용 : JSP 기본문법 실습하기
	 -->
</head>
<body>
	<h3>1. 스크립트 요소</h3>
	
	<h4>스크립트릿(Scriptlet)</h4>
	<%
		// 스크립트릿(자바 코드 영역)
		int var1 = 1;
		boolean var2 = true;
		double var3 = 3.14;
		String var4 = "Hello";
	
		out.println("<p>var1 : "+ var1 + "</p>");
		out.println("<p>var2 : "+ var2 + "</p>");
	%>
	
	<h4>표현식 (Expression)</h4>
	<p><%= var3 %></p>
	<p><%= var4 %></p>
</body>
</html>