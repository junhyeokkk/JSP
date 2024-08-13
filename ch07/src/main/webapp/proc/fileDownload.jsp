<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="ch07.FiletestVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파일번호 수신
	String no = request.getParameter("no");
	// 데이터베이스 조회
	FiletestVO vo = null;
	try{
	//1단계 - JNDI 서비스 객체 생성
	Context initCtx = new InitialContext();
	Context ctx = (Context) initCtx.lookup("java:comp/env");
	
	//2단계 - 커넥션 풀에서 커넥션 객체 가져오기
	DataSource ds = (DataSource) ctx.lookup("jdbc/studydb"); //커넥션 풀 이름 
	Connection conn = ds.getConnection();
	//3단계 - SQL실행 객체 생성
	Statement stmt = conn.createStatement();
	//4단계 - SQL실행
	ResultSet rs = stmt.executeQuery("select * from filetest where `no` = "+ no);
	//5단계 - 결과처리
	if(rs.next()){
		vo = new FiletestVO();
		vo.setNo(Integer.parseInt(rs.getString(1)));
		vo.setUid(rs.getString(2));
		vo.setName(rs.getString(3));
		vo.setOname(rs.getString(4));
		vo.setSname(rs.getString(5));
		vo.setRdate(rs.getString(6));
	}
	//6단계 - 커넥션 반납
	rs.close();
	stmt.close();
	conn.close();
	
	}catch(Exception e){
		e.printStackTrace();
	}

	//response 헤더정보 수정
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(vo.getOname(), "utf-8"));
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private");
	
	// 파일 내용 스트림 처리 
	String path = application.getRealPath("/uploads");
	File file = new File(path + File.separator + vo.getSname());
	
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	
	while(true){
		int data = bis.read();
		if(data == -1){
			break;
		}
		
		bos.write(data);
	}
	bos.close();
	bis.close();
	
%>