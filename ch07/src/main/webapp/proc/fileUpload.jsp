<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파일 업로드 경로 구하기 (실제 경로 .metadata)
	String saveDirectory = application.getRealPath("/uploads");
	System.out.println("saveDirectory : " + saveDirectory);	

	// 파일 업로드 정보 구하기(전송될 파일 객체 Part)
	Part part = request.getPart("fname");
	String partHeader =	part.getHeader("content-disposition");
	System.out.println("partHeader : "+ partHeader);
	
	// 파일명 추출
	String[] partHeaders = partHeader.split("filename=");	
	String originalFname = partHeaders[1].trim().replace("\"", ""); //파일명 ""들어간것 제거
	
	// 파일 저장
	if(!originalFname.isEmpty()){
		part.write(saveDirectory + File.separator + originalFname);
	}

	// 중복될 수 없는 파일명으로 수정
	int idx = originalFname.lastIndexOf(".");
	String ext = originalFname.substring(idx); //확장자 추출
	
	String savedFname = UUID.randomUUID().toString()+ext;
	System.out.println("savedFname : "+savedFname);
	
	// 파일명 수정
	File oFile = new File(saveDirectory + File.separator + originalFname);
	File sFile = new File(saveDirectory + File.separator + savedFname);
	oFile.renameTo(sFile);
	
	// 폼 데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	
	// 데이터베이스 처리
	try {
		//1단계
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
		//2단계
		Connection conn = ds.getConnection();
		
		//3단계
		String sql = "insert into `fileTest` set `uid`=?, `name`=?, `oname`=?, `sname`=?, rdate=now()";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, originalFname);
		psmt.setString(4, savedFname);
		
		//4단계
		psmt.executeUpdate();
		
		
		//5단계
		
		
		//6단계
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 리다이렉트
	response.sendRedirect("../1.fileUploadTest.jsp");
%>