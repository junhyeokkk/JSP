<%@page import="sub1.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4.Directive</title>
	<!-- 
		날짜 : 2024/08/05
		이름 : 최준혁
		내용 : 지시자 실습하기
	 -->
</head>
<body>
	<h3>4.지시자</h3>
	
	<h4>page 지시자</h4>
	
	<%
		Account kb = new Account("국민은행","101-12-1001","김유신",10000);
		Account wr = new Account("우리은행","101-12-1002","김춘추",10000);
	%>
	<p><%= kb %></p>
	<p><%= wr %></p>
	
	<h4></h4>
	
	<h4>include 지시자</h4>
	<%@ include file="./inc/header.jsp" %>
	<%@ include file="./inc/footer.jsp" %>
</body>
</html>