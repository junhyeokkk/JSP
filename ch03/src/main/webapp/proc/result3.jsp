<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송 데이터 수신
	String param = request.getQueryString();
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");	
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String[] hobby = request.getParameterValues("hobby");
	String addr = request.getParameter("addr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result3</title>
</head>
<body>
	<h3>POST 요청 데이터 수신</h3>
	<p>
		아이디 : <%=uid %> <br>
		비밀번호 : <%=pass %> <br>
		이름 : <%=name %> <br>
		생년월일 : <%=birth %> <br>
		성별 : <%=gender.equals("M") ? "남자" : "여자" %> <br>
		취미 : <% for(String a : hobby){
					out.print(a+", ");
			} %> <br>
		주소 : <%=addr %> <br>
	</p>
	<a href="../1.request.jsp">뒤로가기</a>
</body>
</html>