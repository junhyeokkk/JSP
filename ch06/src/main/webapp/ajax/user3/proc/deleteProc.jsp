<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String uid = request.getParameter("uid");
	int row = 0;
	try{
		//1단계 - JNDI 서비스 객체 생성
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
				
		//2단계 - 커넥션 가져오기
		DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		//2단계 - SQL실행 객체 생성
		String sql = "delete from user3 where uid = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uid);
		
		//3단계 - SQL 실행
		row = pstmt.executeUpdate();
		
		//4단계 - 결과 처리(SELECT)
		
		//5단계 - 데이터베이스 종료
		pstmt.close();
		conn.close();
		
	} catch(Exception e){
		e.printStackTrace();
		System.out.println("오류");	
	}

	//JSON 출력
	JsonObject json = new JsonObject();
	json.addProperty("result",row);
	
	out.print(json.toString());
%>