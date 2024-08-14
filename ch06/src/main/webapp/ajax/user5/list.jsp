<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ajax::user2</title>
</head>
	<script>
		
		window.onload = function() {
			const table = document.getElementsByTagName('table')[0];
					
			// 사용자 데이터 요청
			fetch('./proc/getUsers.jsp')
				.then((response) => response.json())
				.then((data) => {
					console.log(data);
					
					for(const user of data){
						
						const row = `<tr>
										<td>\${user.seq}</td>
										<td>\${user.name}</td>
										<td>\${user.gender}</td>
										<td>\${user.age}</td>
										<td>\${user.addr}</td>
										<td>
										<a href='#' class='modify'>수정</a>
										<a href='#' class='delete'>삭제</a>
										</td>
									</tr>`;
						table.insertAdjacentHTML('beforeend',row);
					}
					
				})
				.catch(err => {
					console.log(err);
				})
			
			//삭제 클릭 이벤트(동적 이벤트 연결)
			document.body.addEventListener('click', function(e){
				//a태그 링크를 쓰지않고 클릭이벤트로 쓰기 때문에 preventDefault
				
				
				if(e.target.classList.contains('delete')){
					e.preventDefault();
					//alert('삭제!!');
					
					//버튼 이벤트가 발생한 지점에서 가장 가까운 tr
					const tr = e.target.closest('tr');
					tr.remove();
					
					const seq = tr.children[0].innerText;
					
					//삭제 요청 
					fetch('./proc/deleteProc.jsp?seq='+seq)
						.then(response => response.json())
						.then(data => {
							console.log(data);
							if(data.result > 0){
								alert('삭제 했습니다.');
								tr.remove();
							}
						})
						.catch(err => {
							console.log(err);
						})
				}
				
				if(e.target.classList.contains('modify')){
					
					//버튼 이벤트가 발생한 지점에서 가장 가까운 tr
					const tr = e.target.closest('tr');
					const seq = tr.children[0].innerText;
					
					location.href = './modify.jsp?seq='+seq;
				}
			});
		}
	
	</script>
<body>
	<h3>user2</h3>
	<a href="./register.jsp">등록하기</a>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>나이</th>		
			<th>주소</th>
			<th>관리</th>
		</tr>
	</table>
</body>
</html>