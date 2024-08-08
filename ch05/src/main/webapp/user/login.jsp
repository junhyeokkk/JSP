<%@page import="sub1.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	// 자동 로그인 검사
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		
		for(Cookie cookie : cookies){
			
			if(cookie.getName().equals("auto")){
				
				// 쿠키값으로 사용자 데이터베이스 조회 
				String uid = cookie.getValue();
				
				// 로그인 사용자 생성
				userVO userVO = new userVO();
				userVO.setUid("abc123");
				userVO.setPass("1234");
				userVO.setName("홍길동");
				userVO.setAge(23);
				
				// 세션 저장
				session.setAttribute("sessUser", userVO);
				
				// 로그인 성공 페이지로 이동
				response.sendRedirect("./loginSuccess.jsp");
				
				return; //여기서 처리를 끝내야함 (오류페이지 방지)
			}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user::login</title>
</head>
<body>
	<h3>로그인</h3>
	
	<form action="./loginProc.jsp" method="POST">
		<input type="text" name="uid" placeholder="아이디입력"/><br>
		<input type="password" name="pass" placeholder="비밀번호입력"/><br>	
		<label><input type="checkbox" name="auto" value="1">자동로그인</label><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>