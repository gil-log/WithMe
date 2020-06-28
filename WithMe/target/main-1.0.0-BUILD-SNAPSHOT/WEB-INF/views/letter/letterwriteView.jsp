<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
	 	<title>letter</title>
	</head>
	<body>
	
		<div id="root">
			<header>
				<h1> 쪽지 작성하기 </h1>
			</header>
			<hr />
			 
			<hr />
			
			<section id="container">
				<form role="form" method="post" action="/letter/letterwrite">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="u_id">받는 사람</label><input type="text" id="u_id" name="u_id" />
								</td>
							</tr>
							<tr>
								<td>
									<label for="l_title">제목</label><input type="text" id="l_title" name="l_title" />
								</td>
							</tr>						
						
							<tr>
								<td>
									<label for="l_message">내용</label><input type="text" id="l_message" name="l_message" />
								</td>
							</tr>
						
							<tr>
								<td>						
									<button onclick = "location.href='../letterlist';"> 취소</button> 
									<button type="submit">보내기</button>
								</td>
							</tr>
						</tbody>			
					</table>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>