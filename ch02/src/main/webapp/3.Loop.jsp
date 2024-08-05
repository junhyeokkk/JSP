<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3.Loop</title>
	<!-- 
		날짜 : 2024/08/05
		이름 : 최준혁
		내용 : 반복문 실습하기
	 -->
</head>
<body>
	<h3>3.반복문</h3>
	
	<h4>for문</h4>
	<%
		for(int i=1; i<=3; i++){
			out.println("<p>i : "+i+" </p>");
		}
	%>
	
	<%
		for(int j=1; j<=3; j++){
	%>
		<p> j : <%= j %>
	<%
		}
	%>
	<h4>while문</h4>
	<%
		int k = 1;
		while(k <= 3) {
	%>
		<p>k : <%=k %> </p>
	<%
		k++;
	}
	%>
	<h4>구구단</h4>
	<table border="1">
	<%
		for(int z=2; z<=9; z++){
	%>
	
		<tr>
			<th scope="col"><%=z%>단</th>
		</tr>

	<% 
			for(int p=1; p<=9; p++){
	%>
		<tr>
			<td><%=z%> * <%=p%> = <%=z*p%></td>
		
	<%
			}
	%> </tr> 
	<%
		}
 %>
 </table>
</body>
</html>