<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
	<head>
		<title>WtihMe</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/assets/css/main.css" />
		<!-- 구글 웹 폰트 -->
   <link href="https://fonts.googleapis.com/css2?family=Righteous&display=swap" rel="stylesheet">
    <style>
    body {font-family: 'Righteous', cursive;}
    </style>
<!-- 웹 폰트 끝 -->

	</head>
	 <body class="is-preload">
	 			<!-- Header -->
				<header id="header" class="alt">
				
					<span class="login"><img src="${pageContext.request.contextPath}/resources/img/login.png" alt="" width="60" height="60" align="right"/>
					</span>
					<h1>With Me !</h1>
					<span class="logo">
					
					<form action="list">
					<button onclick="location.href='/board/list'"type="button">
					
					<img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="" width="520" height="760" >
					지도
					</button>
					</form>
					
					
					<form method="get" action="matching">
					<input type="text" name="id" />
					<button type="submit" value="전송" />
					</form>



					</span>
					<p>Just another free, fully responsive site template<br />
				</header>
		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.scrollex.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/main/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/main/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/main/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/main/assets/js/main.js"></script>
	</body>
</html>