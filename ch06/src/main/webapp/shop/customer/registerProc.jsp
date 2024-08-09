<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");

	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1001";
	
	try{
		//드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//1단계 - 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		
		//2단계 - SQL실행 객체 생성

		String sql = "insert into user1 values (?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
	
		pstmt.setString(1, uid);
		pstmt.setString(2, name);
		pstmt.setString(3, birth);
		pstmt.setString(4, hp);
		pstmt.setString(5, age);
		
		//3단계 - SQL 실행
		pstmt.executeUpdate();
		
		//4단계 - 결과 처리(SELECT)

		//5단계 - 데이터베이스 종료
		pstmt.close();
		conn.close();
		
	} catch(Exception e){
		e.printStackTrace();
		System.out.println("오류");
		
	}
	
	//목록이동
	response.sendRedirect("/ch06/user1/list.jsp");

%>