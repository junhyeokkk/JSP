<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2.Condition</title>
	<!-- 
		날짜 : 2024/08/05
		이름 : 최준혁
		내용 : 조건문 실습하기
	 -->
</head>
<body>
	<h3>2. 조건문</h3>
	
	<h4>if</h4>
	<%
		int num1 = 1;
		int num2 = 2;
		int num3 = 3;
		int num4 = 4;
		
		if(num1 > 0){
			out.println("<p>num1은 0보다 크다</p>");
		}
	%>
	
	<h4>if ~else</h4>
	<%
		int var1 = 1, var2 = 2;
		if(var1 > var2){
			
	%>
		<p>var1은 var2보다 크다.
	<%
		}else {
	%>
		<p>var1은 var2보다 작다.
	<%
		}
	%>
	<h4>if ~else if ~else</h4>
	<% if(num1>num2){ %>
		<p>num1은 num2보다 크다
	<% }else if(num2 > num3) {%>
		<p>num2은 num3보다 크다
	<% }else if(num3 > num4) {%>
		<p>num3은 num4보다 크다
	<% }else {%>
		<p>num4가 가장 크다
	<% }%>
</body>
</html>