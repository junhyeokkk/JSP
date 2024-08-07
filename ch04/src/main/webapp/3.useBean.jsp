<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3.useBean</title>
	<!-- 
		날짜 : 2024/08/07		
		이름 : 최준혁
		내용 : include 액션태그 실습하기
	 -->
</head>
<body>
	<h3>3.userBean 액션태그</h3>
	
	<!-- form => 사용자가 입력한 값을 서버로 전송해주는 태그 -->
	<form action="./proc/userProc.jsp" method= "GET"> <!-- <= 입력값을 어디로 보낼건지  -->
		<input type = "text" name= "uid" placeholder="아이디 입력"><br>
		<input type = "text" name= "name" placeholder="이름 입력"><br>
		<input type = "text" name= "hp" placeholder="휴대폰 입력"><br>
		<input type = "number" name= "age" placeholder="나이 입력"><br>
		<input type = "submit" value = "전송하기"><br>
	</form>
</body>
</html>