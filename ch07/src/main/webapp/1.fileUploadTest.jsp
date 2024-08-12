<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1.fileUploadTest</title>
	<!-- 
		날짜 : 2024/08/12	
		이름 : 최준혁
		내용 : JSP 파일 업로드 실습하기
	 -->
</head>
<body>
	<h3>1.파일업로드</h3>
	<form action="./proc/fileUpload.jsp" method="post" enctype="multipart/form-data">
		<input type="text" name="uid" placeholder="아이디 입력"> <br>
		<input type="text" name="name" placeholder="이름 입력"> <br>
		<input type="file" name="fname" placeholder="파일 추가"> <br>
		<input type="submit" value="전송하기"> <br>
	</form>
</body>
</html>