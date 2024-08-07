<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1.cookieTest</title>
	<!-- 
		날짜 : 2024/08/07		
		이름 : 최준혁
		내용 : JSP 쿠키 실습하기
	 -->
</head>
<body>
	<h3>1.Cookie 실습</h3>
	<form action="./proc/cookieCreate.jsp" method="POST">
		<input type="text" name="uid" placeholder="아이디 입력"><br>
		<input type="password" name="pass" placeholder="비밀번호 입력"><br>
		<input type="submit" value="로그인"><br>
	</form>
</body>
</html>