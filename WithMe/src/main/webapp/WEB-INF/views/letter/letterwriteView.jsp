<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
	 	<title>letter</title>
	 	
	 	<script type="text/javascript">

	 	form {
		 	text-align: center;
			
		}

	 	</script>
	</head>
	<body>
	
		<div id="root">
			<header>
				<h1> 쪽지 작성하기 </h1>
			</header>
			<hr />
			 
			
			<section id="container">
			
				<form role="form" method="post" action="/letter/letterwrite">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="u_id">받는사람</label>
									<input type="text" id="u_id" name="u_id" size="48" required />
								</td>
							</tr>
							<tr>
								<td>
									<label for="l_title">제목</label> &nbsp &nbsp &nbsp
									<input type="text" id="l_title" name="l_title" size="48" />
								</td>
							</tr>						
						
							<tr>
								<td>
									<div style="display: flex">
										<label for="l_message">내용</label> &nbsp &nbsp &nbsp &nbsp
										<textarea id="l_message" name="l_message" cols="50" rows="10" autofocus>
										</textarea>
									</div>
								</td>
							</tr>
						
							<tr>
								<td style = "text-align:center; padding-top: 10px;">
									<input type="button" value="뒤로가기" onclick="history.back()" width="40" height="40"/>
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