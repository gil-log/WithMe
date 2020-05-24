<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>WtihMe</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/assets/css/main.css" />


<!-- login 18강 -->

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script type="text/javascript">
			$(document).ready(function(){
				$("#logoutBtn").on("click", function(){
					location.href="member/logout";
					})
				
				$("#registerBtn").on("click", function(){
					location.href="member/register";
					})
		
		
				$("#memberUpdateBtn").on("click", function(){
					location.href="member/memberUpdateView";
					})	
					
					
				$("#loginPopup").on("click", function(){
					//팝업 가운데 띄우기
					var popupWidth = 500;
					var popupHeight = 800;
					
					var popupX = (window.screen.width / 2) - (popupWidth / 2);
					// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
					
					var popupY= (window.screen.height / 2) - (popupHeight / 2);
					// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
					
					window.open('/user/loginform','windowpopup', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
				});
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


									
<img id="loginPopup" src="${pageContext.request.contextPath}/resources/img/login.png" alt="" width="60" height="60" />

						

		<h1>With Me ?</h1>

		<span class="logo">

<a href="/party/list">
					<img src="${pageContext.request.contextPath}/resources/img/logo.png"
						alt="" width="520" height="760">
</a>

		</span>
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