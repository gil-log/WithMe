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

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script type="text/javascript">

function location1 (){
	<% String loc1 = "서울";
	session.setAttribute("location", loc1); 
	%>
	alert("서울");
	location.href="";
	
	return false;
}


 function location2(){
	<% String loc2 = "경기";
	session.setAttribute("location", loc2); 
	%>
	location.href="";
	
	return false;
}
 function location3(){
	<% String loc3 = "강원";
	session.setAttribute("location", loc3); 
	%>
	location.href="";
	return false;
}
  function location4(){
	<% String loc4 = "충청";
	session.setAttribute("location", loc4); 
	%>
	location.href="";
	return false;
}
 function location5(){

	location.href="";
	return false;
}
 
 function location6(){
		location.href="";
		return false;
	}
 function location7(){
		location.href="";
		return false;
	}
 
			$(document).ready(function(){
				
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


<!-- 구글 웹 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Righteous&display=swap"
	rel="stylesheet">
<style>
.title {
	font-family: 'Righteous', cursive;
	font-size: xx-large;
	color: white;
}
</style>
<!-- 웹 폰트 끝 -->
</head>
<body class="is-preload">
	<!-- Header -->
	<header id="header" class="alt">
		<img id="loginPopup"
			src="${pageContext.request.contextPath}/resources/img/login.png"
			alt="" width="60" height="60" />

		<div class="title">
			<h1>With Me ?</h1>
		</div>
			<span class="logo"> <img
		src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""
		usemap="#logomap"> <map id="logomap" name="logomap">
		
			<area shape="poly" alt="" title=""
				coords="193,235,279,207,301,238,297,281,198,293,188,261"
				 href="/location?loc=1" target="" />
				<!--  /party/list?searchType=e&keyword=%EC%84%9C%EC%9A%B8&loc=1 -->
			<area shape="poly" alt="" title=""
				coords="181,206,261,111,338,158,343,193,342,242,382,269,377,325,302,369,236,373,224,304,308,293,310,234,281,195,184,226"
				 href="/location?loc=2"
				target="" />
				<!-- /party/list?page=1&perPageNum=10&searchType=e&keyword=%EA%B2%BD%EA%B8%B0&loc=2  -->
			<area shape="poly" alt="" title=""
				coords="303,93,374,205,405,305,648,334,490,51,410,93"
				 href="/location?loc=3" target="" />
				<!-- /party/list?searchType=e&keyword=%EA%B0%95%EC%9B%90&loc=3 -->
			<area shape="poly" alt="" title=""
				coords="167,382,211,569,274,534,419,554,390,445,519,353,415,331,292,381,226,378"
				href="/location?loc=4" target="" />
				<!-- /party/list?searchType=e&keyword=%EC%B6%A9%EC%B2%AD&loc=4 -->
			<area shape="poly" alt="" title=""
				coords="243,571,144,745,189,933,398,793,344,663,399,569"
				href="/location?loc=5" target="" />
				<!-- /party/list?searchType=e&keyword=%EC%A0%84%EB%9D%BC&loc=5 -->				
			<area shape="poly" alt="" title=""
				coords="538,361,410,455,435,578,375,678,410,788,648,746,690,580,654,341"
				 href="/location?loc=6" target="" />
				<!-- /party/list?searchType=e&keyword=%EA%B2%BD%EC%83%81&loc=6 -->
			<area shape="poly" alt="" title=""
				coords="136,1121,112,1151,145,1165,228,1148,245,1114,216,1097"
				 href="/location?loc=7" target="" />
				<!-- /party/list?searchType=e&keyword=%EC%A0%9C%EC%A3%BC&loc=7 -->
		</map>

		
	</span>
	</header>





</body>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/imageMapResizer.min.js"></script>
	
</html>