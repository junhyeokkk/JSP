<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="ch07.FiletestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	// 파일번호 수신
	String no = request.getParameter("no");
	String s_name = request.getParameter("sname");
	
	// 데이터베이스 파일 정보 삭제
	
	// 데이터베이스 조회
	String sname = null;
	try{
	//1단계 - JNDI 서비스 객체 생성
	Context initCtx = new InitialContext();
	Context ctx = (Context) initCtx.lookup("java:comp/env");
	
	//2단계 - 커넥션 풀에서 커넥션 객체 가져오기
	DataSource ds = (DataSource) ctx.lookup("jdbc/studydb"); //커넥션 풀 이름 
	Connection conn = ds.getConnection();
	
	//3단계 - SQL실행 객체 생성
	PreparedStatement psmt = conn.prepareStatement("select sname from filetest where no=?");
	psmt.setString(1, no);
	Statement stmt = conn.createStatement();
	
	//4단계 - SQL실행
	ResultSet rs = psmt.executeQuery();
	stmt.executeUpdate("delete from filetest where no ="+no);
	
	//5단계 - 결과처리
	if(rs.next()){
		sname = rs.getString(1);
	}
	//6단계 - 커넥션 반납
	stmt.close();
	conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 디렉터리 파일 정보 삭제
	
	// 파일 업로드 경로 구하기 (실제 경로 .metadata)
	String saveDirectory = application.getRealPath("/uploads");
	System.out.println("saveDirectory : " + saveDirectory);	
	
	File file = new File(saveDirectory + File.separator + s_name);
	file.delete();
	System.out.println("file sname: " + s_name);	
	
	//리다이렉트
	response.sendRedirect("../2.fileDownloadTest.jsp");
%>