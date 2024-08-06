<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1.reqest</title>
	<!-- 
		날짜 : 2024/08/05
		이름 : 최준혁
		내용 : request 내장객체 실습하기
		
		request 내장객체
		- 클라이언트 요청 정보를 갖는 객체(header, body 구성)
		- 클라이언트 전송 데이터를 수신하는 기능(getParameter)
		
		GET 요청 
		- GET 요청방식은 HTTP 기본 요청방식
		- GET은 서버에 있는 자원을 요청하는 요청방식
		- GET요청으로 데이터를 전송할때는 Query String(Parameter)로 요청 주소에 노출되어 전송
		
		POST 요청
		- POST는 사용자가 입력한 값을 서버로 전송하기 위한 요청방식
		- 전송 데이터는 주소에 노출되지 않고 요청 메시지 바디에 삽입되어 전송 
		- GET방식에 비해 보안에 유리하고 대량의 데이터 전송에 적합
	 -->
</head>
<body>
	<h3>1.request 내장객체</h3>
	
	<h4>GET 요청 방식</h4>
	<form action="./proc/result1.jsp" method="get">
		<input type="text" name="uid">
		<input type="text" name="name">
		<input type="number" name="age">
		<input type="submit" value="전송"/>
	</form>
	
	<h4>POST 요청 방식</h4>
	<form action="./proc/result2.jsp" method="post">
		<input type="text" name="uid">
		<input type="text" name="name">
		<input type="number" name="age">
		<input type="submit" value="전송"/>
	</form>
	
	<h4>request 기타 정보</h4>
	<p>
		헤더 정보 : <%= request.getHeader("User-Agent") %> <br>
		프로토콜 : <%= request.getProtocol() %> <br>
		서버이름 : <%= request.getServerName() %> <br>
		요청주소 : <%= request.getRequestURL() %> <br>
		요청경로 : <%= request.getRequestURI() %> <br>
		IP주소 : <%= request.getRemoteAddr() %> <br>
	</p>
	</table>
 	 <h4>확인문제</h4>
   <form action="./proc/result3.jsp" method="post">
      <table border="1">
      <tr>
         <td>아이디</td>
         <td><input type="text" name="uid" placeholder="아이디 입력"/></td>
      </tr>
      <tr>
         <td>비밀번호</td>
         <td><input type="password" name="pass" placeholder="비밀번호 입력"/></td>
      </tr>
      <tr>
         <td>이름</td>
         <td><input type="text" name="name" placeholder="이름 입력"/></td>
      </tr>
      <tr>
         <td>생년월일</td>
         <td><input type="date" name="birth" placeholder="생년월일 선택"/></td>
      </tr>
      <tr>
         <td>성별</td>
         <td>
         <label><input type="radio" name="gender" value="M"/>남</label>
         <label><input type="radio" name="gender" value="F"/>여</label>
      	 </td>
      </tr>
      <tr>    
         <td>취미</td>
         <td>
         <label><input type="checkbox" name="hobby" value="등산"/>등산</label>
         <label><input type="checkbox" name="hobby" value="독서"/>독서</label>
         <label><input type="checkbox" name="hobby" value="영화"/>영화</label>
         <label><input type="checkbox" name="hobby" value="운동"/>운동</label>
         <label><input type="checkbox" name="hobby" value="음악"/>음악</label>
      </td>
      </tr>  
      <tr>
       	<td>주소</td>
       	<td>
       		<select name="addr">
       			<option>서울</option>
       			<option>대전</option>
       			<option>대구</option>
       			<option>부산</option>
       			<option>광주</option>
       		</select>
       	</td>
       	</tr>
       	<tr>
       		<td colspan="2" align="right">
       			<input type="submit" value="전송하기"> 
      		</td>
      	</tr>
      </table>
      </form>
</body>
</html>