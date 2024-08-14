<%@page import="sub1.User5VO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String seq = request.getParameter("seq");
	User5VO vo = null;
	try{
		//1단계 - JNDI 서비스 객체 생성
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
				
		//2단계 - 커넥션 가져오기
		DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		//2단계 - SQL실행 객체 생성
		String sql = "select * from user5 where seq = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, seq);
		
		//3단계 - SQL 실행
		ResultSet rs = pstmt.executeQuery();
		
		//4단계 - 결과 처리(SELECT)
		if(rs.next()){
			vo = new User5VO();
			vo.setSeq(Integer.parseInt(rs.getString(1)));
			vo.setName(rs.getString(2));
			vo.setGender(rs.getString(3));
			vo.setAge(Integer.parseInt(rs.getString(4)));
			vo.setAddr(rs.getString(5));
		
		}
		//5단계 - 데이터베이스 종료
		pstmt.close();
		conn.close();
		
	} catch(Exception e){
		e.printStackTrace();
		System.out.println("오류");	
	}

	
	//JSON 출력
	Gson gson = new Gson();
	String jsonData = gson.toJson(vo);
	out.print(jsonData);

%>