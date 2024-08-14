<%@page import="sub1.User2VO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//User1VO 리스트 생성
	List<User2VO> users = new ArrayList(); 
	try{
		//1단계 - JNDI 서비스 객체 생성
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
				
		//2단계 - 커넥션 가져오기
		DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		//2단계 - SQL실행 객체 생성
		String sql = "select * from user2 ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		
		//3단계 - SQL 실행
		ResultSet rs = pstmt.executeQuery();
		
		//4단계 - 결과 처리(SELECT)
		while(rs.next()){
			User2VO vo = new User2VO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setBirth(rs.getString(3));
			vo.setAddr(rs.getString(4));
			
			users.add(vo);
		}
		//5단계 - 데이터베이스 종료
		pstmt.close();
		conn.close();
		
	} catch(Exception e){
		e.printStackTrace();
		System.out.println("오류");	
	}

	// JSON 출력 -> 
	Gson gson = new Gson();
	String jsonData = gson.toJson(users);
	out.print(jsonData);
%>