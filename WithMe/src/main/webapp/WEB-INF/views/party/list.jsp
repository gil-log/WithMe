<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

	
		
		
		
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/travelix/styles/bootstrap4/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/travelix/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/travelix/styles/elements_styles.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/travelix/styles/elements_responsive.css">

<script src="${pageContext.request.contextPath}/resources/travelix/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/travelix/styles/bootstrap4/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/travelix/styles/bootstrap4/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/travelix/plugins/greensock/TweenMax.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/travelix/plugins/greensock/TimelineMax.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/travelix/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/travelix/plugins/greensock/animation.gsap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/travelix/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/travelix/plugins/progressbar/progressbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/travelix/plugins/jquery-circle-progress-1.2.2/circle-progress.js"></script>
<script src="${pageContext.request.contextPath}/resources/travelix/plugins/parallax-js-master/parallax.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/travelix/js/elements_custom.js"></script>





<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/party/party.css">





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
		
		
		
<title>Party Matching</title>

</head>
<body>
	<div id="root">
		<header>
			<h1>Party Matching</h1>
		</header>
		<hr />
		
			<div>
				<%@include file="nav.jsp" %>
			</div>
			
		<hr />
		
		


	
					<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">검색</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01">
  
  
  <div class="form-group">
    <select class="custom-select" name="searchType">
      <option value="n" selected <c:out value="${scri.searchType == null ? 'selected' : ''}"/>> Open this select menu</option>
      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>해쉬태그</option>
      <option value="e"<c:out value="${scri.searchType eq 'e' ? 'selected' : ''}"/>>지역</option>
    </select>
  </div>
    
    
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" name="keyword" id="keywordInput" value="${scri.keyword}" placeholder="Search"/>
      <button class="btn btn-secondary my-2 my-sm-0" id="searchBtn" type="button">검색</button>
    </form>
        <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
    
  </div>
</nav>
					

		


		
		
		
		
							<!-- Milestones -->
					<div class="milestones" style = "padding: 0px 0px 30px 0px;" >
						<!-- <div class="row">
							<div class="col-lg-12">
								<div class="elements_title">Milestones</div>
							</div>
						</div> -->
						<div class="row milestones_container">
							
							<!-- Milestone -->
							<div class="col-lg-2 milestone_col">
								<div class="milestone text-center">
									<div class="milestone_icon">
									 <a href="list?searchType=w&keyword=%EC%97%AC%ED%96%89">
									 <img src="${pageContext.request.contextPath}/resources/travelix/images/milestone_1.png" alt="">
									 </a>
									</div>
									<div class="milestone_counter" data-end-value="${travel}">0</div>
									<div class="milestone_text">#여행</div>
								</div>
							</div>

							<!-- Milestone -->
							<div class="col-lg-2 milestone_col">
								<div class="milestone text-center">
									<div class="milestone_icon">
									<a href="list?searchType=w&keyword=%EB%A8%B9%EB%B0%A9">
									<img id="hashtag_mukbang" src="${pageContext.request.contextPath}/resources/travelix/images/milestone_2.png" alt=""></div>
									</a>
									<div class="milestone_counter" data-end-value="${mukbang}">0</div>
									<div class="milestone_text">#먹방</div>
								</div>
							</div>

							<!-- Milestone -->
							<div class="col-lg-2 milestone_col">
								<div class="milestone text-center">
									<div class="milestone_icon">
									<a href="list?searchType=w&keyword=%EC%98%A4%EB%9D%BD">
									<img id="hashtag_ohrak" src="${pageContext.request.contextPath}/resources/travelix/images/acade.png" alt="">
									</a>
									</div>
									<div class="milestone_counter" data-end-value="${ohrak}">0</div>
									<div class="milestone_text">#오락</div>
								</div>
							</div>

							<!-- Milestone -->
							<div class="col-lg-2 milestone_col">
								<div class="milestone text-center">
									<div class="milestone_icon">
									<a href="list?searchType=w&keyword=%ED%9E%90%EB%A7%81">
									<img id="hashtag_healing" src="${pageContext.request.contextPath}/resources/travelix/images/milestone_4.png" alt="">
									</a>
									</div>
									<div class="milestone_counter" data-end-value="${healing}">0</div>
									<div class="milestone_text">#힐링</div>
								</div>
							</div>
							
														<!-- Milestone -->
							<div class="col-lg-2 milestone_col">
								<div class="milestone text-center">
									<div class="milestone_icon">
									<a href="list?searchType=w&keyword=%EC%82%AC%EC%A7%84">
									<img id="hashtag_photo" src="${pageContext.request.contextPath}/resources/travelix/images/photo.png" alt="">
									</a>
									</div>
									<div class="milestone_counter" data-end-value="${photo}">0</div>
									<div class="milestone_text">#사진</div>
								</div>
							</div>
							
														<!-- Milestone -->
							<div class="col-lg-2 milestone_col">
								<div class="milestone text-center">
									<div class="milestone_icon">
									<a href="list?searchType=w&keyword=%EB%B2%88%EA%B0%9C">
									<img id="hashtag_thunder" src="${pageContext.request.contextPath}/resources/travelix/images/thunder.png" alt="">
									</a>
									</div>
									<div class="milestone_counter" data-end-value="${thunder}">0</div>
									<div class="milestone_text">#번개</div>
								</div>
							</div>
						</div>
					</div>
					
			
	<form role="form" method="get">					
	<c:forEach items="${list}" var="list">
		<div class="card text-white bg-primary mb-5" style="max-width: 60rem; margin:auto;">
			<div class="card-header"></div>
			<div class="card-body">
				<h4 class="card-title">
					<a href="/party/readView?party_id=${list.party_id}" style="color:white;"><c:out value="${list.party_title}" /></a>
				</h4>
				<p class="card-text" style="color:white;">
					<fmt:formatDate value="${list.p_date}" pattern="yyyy-MM-dd" />
					<c:out value="${list.u_id}" />
				</p>
			</div>
		</div>
	</c:forEach>
	</form>		
			
			
			
			
			
				
<form role="form" method="get">					
	<c:forEach items="${list}" var="list">
		<div class="card text-white bg-primary mb-5" style="max-width: 60rem; margin:auto;">
			<div class="card-header"></div>
			<div class="card-body">
				<h4 class="card-title">
					<a href="/party/readView?party_id=${list.party_id}" style="color:white;"><c:out value="${list.party_title}" /></a>
				</h4>
				<p class="card-text" style="color:white;">
					<fmt:formatDate value="${list.p_date}" pattern="yyyy-MM-dd" />
					<c:out value="${list.u_id}" />
				</p>
			</div>
		</div>
	</c:forEach>
	</form>
	
	
	<div>
  <ul class="pagination">

<c:if test="${pageMaker.prev}">
    <li class="page-item">
      <a class="page-link" href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
    </li>
</c:if>
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    <li class="page-item">
      <a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a>
    </li>
	</c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    <li class="page-item">
      <a class="page-link" href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
    </li>
       </c:if>  
  </ul>
</div>
	
	
	
	
	
</body>
</html>