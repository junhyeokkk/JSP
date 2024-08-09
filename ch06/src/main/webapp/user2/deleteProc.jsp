<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1001";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		String sql = "delete from user2 where uid = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("uid"));
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
	} catch(Exception e){
		e.printStackTrace();
	}		
	response.sendRedirect("/ch06/user2/list.jsp");
%>