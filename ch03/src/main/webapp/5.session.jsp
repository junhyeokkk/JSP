<%@page import="sub1.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>5.session</title>
	<!-- 
		날짜 : 2024/08/06		
		이름 : 최준혁
		내용 : session 내장객체 실습하기
	 -->
</head>
<body>
	<h3>5.session 내장객체</h3>
	
	<h4>session ID 확인</h4>
	<!-- 브라우저에 따라 sessionID는 다름 -->
	<%= session.getId() %>
	
	<h4>session 설정</h4>
	<%
	
		//브라우저 정보
		String agent = request.getHeader("User-agent");	
	
		//Edg -> 엣지 브라우저 크롬은 없음!<엔진은 같으나 크롬과 엣지의 차이점>
		if(agent.contains("Edg")){
			UserVO user = new UserVO("a101","김유신",23);
			
			// 세션 저장
			session.setAttribute("user", user);
			
			
		}else {
			UserVO user = new UserVO("a102","김춘추",21);
			
			// 세션 저장
			session.setAttribute("user", user);
			
		}
		
		// 세션 조회
		UserVO uservo = (UserVO) session.getAttribute("user");
	
	%>
	<p>
		아이디: <%=uservo.getUid() %> <br>
		이름: <%=uservo.getName() %> <br>
		나이: <%=uservo.getAge() %> <br>
	</p>
	
</body>
</html>