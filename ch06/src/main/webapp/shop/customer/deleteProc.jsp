<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	
	
	try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop"); //커넥션 풀 이름 
		Connection conn = ds.getConnection();
		
		String sql = "delete from customer where custId = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("uid"));
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
	} catch(Exception e){
		e.printStackTrace();
	}		
	response.sendRedirect("/ch06/customer/list.jsp");
%>