<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true" pageEncoding="UTF-8"%>
<!-- isErrorPage="true" 해야 내장 exception 객체 사용가능  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버 장애</title>
</head>
<body>
	 <h3>일시적으로 서버에 문제가 생겼습니다.</h3>
	 
	 <p>
	 	계속 장애 발생시 고객센터로 문의하시기 바랍니다. <br>
	 	장애 종류 : <%=exception.getClass().getName()  %> <br>
	 	장애 내용 : <%=exception.getMessage()  %>> <br>
	 	
	 	<a href="../6.exception.jsp">뒤로가기</a> 
	 </p>
</body>
</html>