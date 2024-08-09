<%@page import="sub1.User2VO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1001";
	String uid = request.getParameter("uid");
	User2VO vo = null;
	try {
		//1단계 - JDBC 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");	
		
		//2단계 - 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		//3단계 - SQL실행 객체 생성
		String sql = "select * from user2 where uid =?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uid);
		
		//4단계 - SQL실행
		ResultSet rs = pstmt.executeQuery();
		
		//5단계 - 결과 처리
		if(rs.next()){
			
			vo = new User2VO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setBirth(rs.getString(3));
			vo.setAddr(rs.getString(4));

		}
		
		
	} catch(Exception e){
		e.printStackTrace();
	}


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User2::register</title>
</head>
<body>
	<h3>User1 수정</h3>
	<a href="/ch06/1.JDBCTest.jsp">처음으로</a>
	<a href="/ch06/user2/list.jsp">목록</a>
	
	<form action="/ch06/user2/modifyProc.jsp" method="POST">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" value="<%=vo.getUid()%>" readonly/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=vo.getName()%>"/></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth" value="<%=vo.getBirth()%>"/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="<%=vo.getAddr()%>"/></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" values="등록하기"/>
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>