<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	//데이터베이스 수정 처리
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1001";
	

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		String sql = "Update user5 set name = ?, gender=?, age=?, addr=? where seq=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("name"));
		pstmt.setString(2, request.getParameter("gender"));
		pstmt.setString(3, request.getParameter("age"));
		pstmt.setString(4, request.getParameter("addr"));
		pstmt.setString(5, request.getParameter("seq"));
		
		pstmt.executeUpdate();
		
	} catch(Exception e){
		e.printStackTrace();
	}
	
	//목록 이동
	response.sendRedirect("/ch06/user5/list.jsp");


%>