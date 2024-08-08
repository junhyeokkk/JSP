<%@page import="sub1.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	String auto = request.getParameter("auto");
	
	// 데이터베이스 작업 생략(1~6단계)
	
	// 회원 abc123/1234 라고 가정
	
	if(uid.equals("abc123") && pass.equals("1234")){
		//회원이 맞을 경우 --> 사용자 객체 생성 후 세션 저장
		
		// 자동 로그인 처리
		if(auto != null){
			
			Cookie autoCookie = new Cookie("auto", uid); //자동로그인할 사용자 비교
			autoCookie.setMaxAge(60 * 3); //갱신은 자동로그인 할때마다 이 시간 갱신
			autoCookie.setPath("/ch05"); //쿠키 경로: 해당 경로 하위에서 참조 가능 
			response.addCookie(autoCookie);
			

		}
		
		userVO userVO = new userVO();
	
		userVO.setUid("abc123");
		userVO.setPass("1234");
		userVO.setName("홍길동");
		userVO.setAge(23);
		
		session.setAttribute("sessUser", userVO);
		
		//성공 페이지 이동
		response.sendRedirect("./loginSuccess.jsp");
		
	}else {
		//회원이 아닐 경우
		response.sendRedirect("./login.jsp?success=100"); //주소?파라미터
		
	}
	
%>