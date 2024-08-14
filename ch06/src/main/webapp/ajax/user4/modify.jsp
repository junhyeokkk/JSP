<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ajax::user1</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
		
		
		window.onload = function(){
			
			// 주소 파라미터 파싱(수정 아이디 추출하기)
			const params = location.href.split('?')[1];
			const value = params.split('=')[1];
			
			// 문서객체 생성
			const form = document.getElementsByTagName('form')[0];
			const btnSubmit = form.submit;
			
			// 수정하기 버튼 이벤트
			btnSubmit.onclick = (e) => {
				e.preventDefault();
				
				const jsonData = {
					"uid": form.uid.value,
					"name": form.name.value,
					"gender": form.gender.value,
					"age": form.age.value,
					"hp": form.hp.value,
					"addr": form.addr.value,
				
				};
				
				// POST 전송 --> jquery ajax()는 getparameter() 수신				
				$.ajax({
					method: 'POST',
					url: './proc/modifyProc.jsp',
					data: jsonData,
					success: function(data){
						console.log(data);
						
						if(data.result > 0){
							console.log(data.result);
							alert('수정 되었습니다.');
							location.href = './list.jsp';
						}
					}
				});
				
				
				/*
				fetch('./proc/modifyProc.jsp', {
						method: 'POST',
						headers: {'Content-Type': 'application/json'},
						body: JSON.stringify(jsonData)
					})
					.then(res => res.json())
					.then(data => {
						
						if(data.result > 0){
							alert('수정 되었습니다.');
							location.href = '../list.jsp';
						}
					})
					.catch(err => {
						console.log(err);
					});
				*/
			}
			
			// 수정 데이터 요청하기
			fetch('./proc/getUser.jsp?uid='+value)
				.then(resp => resp.json())
				.then(data => {
					console.log(data);
					
					// 수정 데이터 출력
					form.uid.value = data.uid;
					form.name.value = data.name;
					form.gender.value = data.gender;
					form.age.value = data.age;
					form.hp.value = data.hp;
					form.addr.value = data.addr;
				})
				.catch(err => {
					console.log(err);
				});

		}// onload end

	</script>
</head>
<body>
	<h3>user4 수정</h3>
	<a href="./list.jsp">목록이동</a>
	<form action="#" method="POST">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="text" name="gender"/></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age"/></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="hp"/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr"/></td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
					<input type="submit" name ="submit" values="수정하기"/>
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>