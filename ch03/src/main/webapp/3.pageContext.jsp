<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3.pageContext</title>
	<!-- 
		날짜 : 2024/08/06		
		이름 : 최준혁
		내용 : pageContext 내장객체 실습하기
	 -->
</head>
<body>
	<h3>3.pageContext 내장객체</h3>
	
	
	<h4>include</h4>
	<!-- 정적 include -->
	<%@ include file="./inc/header.jsp" %>
	<!-- pageContext 내장객체 동적 include -->
	<%
		pageContext.include("./inc/header.jsp");
		pageContext.include("./inc/footer.jsp");
	%>
	
	<h4>forword</h4>
	
	<a href="./proc/forword1.jsp">포워드1</a>
	<a href="./proc/forword2.jsp">포워드2</a>
	
</body>
</html>