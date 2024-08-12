<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ch07.FiletestVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<FiletestVO> files = new ArrayList();
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
	ResultSet rs = stmt.executeQuery("select * from filetest");
	
	//5단계 - 결과처리
	while(rs.next()){
		FiletestVO vo = new FiletestVO();
		vo.setNo(Integer.parseInt(rs.getString(1)));
		vo.setUid(rs.getString(2));
		vo.setName(rs.getString(3));
		vo.setOname(rs.getString(4));
		vo.setSname(rs.getString(5));
		vo.setRdate(rs.getString(6));
		files.add(vo);
	}
	
	//6단계 - 커넥션 반납
	rs.close();
	stmt.close();
	conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2.fileDownloadTest</title>
	<!-- 
		날짜 : 2024/08/12	
		이름 : 최준혁
		내용 : JSP 파일 다운로드 실습하기
	 -->
</head>
<body>
	<h3>2.파일 다운로드</h3>
	
	<table border ="1">
		<tr>
			<th>파일번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>원본파일명</th>
			<th>저장파일명</th>
			<th>등록일</th>
			<th>다운로드</th>
		</tr>
	
		<%for(int i=0; i<files.size(); i++) { %>
		<tr>
			<td><%=files.get(i).getNo()%></td>
			<td><%=files.get(i).getUid()%></td>
			<td><%=files.get(i).getName()%></td>
			<td><%=files.get(i).getOname()%></td>
			<td><%=files.get(i).getSname()%></td>
			<td><%=files.get(i).getRdate().substring(0, 10) %></td>
			<td>
				<a href="./proc/deleteProc.jsp?no=<%=files.get(i).getNo()%>&sname=<%=files.get(i).getSname()%>">삭제</a>
				<a href="./proc/fileDownload.jsp?no=<%=files.get(i).getNo()%>">다운로드</a>
			</td>
		</tr>
		<% } %>
	</table>
	
</body>
</html>