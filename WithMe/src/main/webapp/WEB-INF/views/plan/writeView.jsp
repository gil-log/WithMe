<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
	 	<title>게시판</title>
	</head>
	<body>
	
		<div id="root">
			<header>
				<h1> PlanMatching</h1>
			</header>
			<hr />
			 
			<nav>
			  홈
			</nav>
			<hr />
			
			<section id="container">
				<form role="form" method="post" action="/plan/write">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="plan_title" name="plan_title" />
								</td>
							</tr>						
						
							<tr>
								<td>
									<label for="content">도시</label><textarea id="city" name="city" ></textarea>
								</td>
							</tr>
							<tr>
								<td>						
									<button type="submit">작성</button>
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