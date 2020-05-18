<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>	
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 <title>WtihMe</title>
		<meta charset="utf-8" />
		<meta name="viewport"
			content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/main/assets/css/main.css" />
			
			
		<!-- login 18강 -->	
			
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<script type="text/javascript">
			$(document).ready(function(){
				$("#logoutBtn").on("click", function(){
					location.href="member/logout";
				})
			})
		</script>
		
		<!-- login 18강 -->	
			
		
		<!-- 구글 웹 폰트 -->
		<link
			href="https://fonts.googleapis.com/css2?family=Righteous&display=swap"
			rel="stylesheet">
		<style>
		body {
			font-family: 'Righteous', cursive;
		}
		</style>
<!-- 웹 폰트 끝 -->

	</head>
	<body class="is-preload">
		<!-- Header -->
		<header id="header" class="alt">
	
	<!-- 18강 로그인 -->
	
		<form name='homeForm' method="post" action="/member/login">
		<c:if test="${member == null}">
			<div>
				<label for="userId"></label>
				<input type="text" id="userId" name="userId">
			</div>
			<div>
				<label for="userPass"></label>
				<input type="password" id="userPass" name="userPass">
			</div>
			<div>
				<button type="submit">로그인</button>
				<button type="button">회원가입</button>
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.userId}님 환영 합니다.</p>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>

	<!-- 18강 로그인 -->
	
			<span class="login">
			
				<button type ="button" id = 'loginPopup' align="right"
						onClick = "window.open('http://www.naver.com','windowpopup', 'width=500, height=600')" class = "login_btn">
					<img src="${pageContext.request.contextPath}/resources/img/login.png" alt="" width="60" height="60" /> 
				</button>
				<h1>With Me ?</h1>
			</span>
			<span class="logo">
	
				<form action="list">
					<button onclick="location.href='/board/list'" type="button">
	
						<img
							src="${pageContext.request.contextPath}/resources/img/logo.png"
							alt="" width="520" height="760"> 지도
					</button>

				</form>
	
				<form method="get" action="matching">
					<input type="text" name="id" />
					<button type="submit" value="전송" />
				</form>
	
			</span>
			<p>
				개인 패키지 여행 매칭 사이트<br/>
		</header>

		<!-- Scripts -->
	
		<script
			src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.scrollex.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.scrolly.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/main/assets/js/browser.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/main/assets/js/breakpoints.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/main/assets/js/util.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/main/assets/js/main.js"></script>
	</body>
</html>