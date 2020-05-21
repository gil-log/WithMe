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





<title>Party Matching</title>
</head>
<body>
	<div id="root">
		<header>
			<h1>Party Matching</h1>
		</header>
		<hr />
		<nav>홈 - 글 작성</nav>
		<hr />
		
		
							
					<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">검색</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">내용 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">지역</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">날짜</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">시간</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
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
									<div class="milestone_icon"><img src="${pageContext.request.contextPath}/resources/travelix/images/milestone_1.png" alt=""></div>
									<div class="milestone_counter" data-end-value="255">0</div>
									<div class="milestone_text">#여행</div>
								</div>
							</div>

							<!-- Milestone -->
							<div class="col-lg-2 milestone_col">
								<div class="milestone text-center">
									<div class="milestone_icon"><img src="${pageContext.request.contextPath}/resources/travelix/images/milestone_2.png" alt=""></div>
									<div class="milestone_counter" data-end-value="1176">0</div>
									<div class="milestone_text">#먹방</div>
								</div>
							</div>

							<!-- Milestone -->
							<div class="col-lg-2 milestone_col">
								<div class="milestone text-center">
									<div class="milestone_icon"><img src="${pageContext.request.contextPath}/resources/travelix/images/acade.png" alt=""></div>
									<div class="milestone_counter" data-end-value="439">0</div>
									<div class="milestone_text">#오락</div>
								</div>
							</div>

							<!-- Milestone -->
							<div class="col-lg-2 milestone_col">
								<div class="milestone text-center">
									<div class="milestone_icon"><img src="${pageContext.request.contextPath}/resources/travelix/images/milestone_4.png" alt=""></div>
									<div class="milestone_counter" data-end-value="227">0</div>
									<div class="milestone_text">#힐링</div>
								</div>
							</div>
							
														<!-- Milestone -->
							<div class="col-lg-2 milestone_col">
								<div class="milestone text-center">
									<div class="milestone_icon"><img src="${pageContext.request.contextPath}/resources/travelix/images/photo.png" alt=""></div>
									<div class="milestone_counter" data-end-value="27">0</div>
									<div class="milestone_text">#사진</div>
								</div>
							</div>
							
														<!-- Milestone -->
							<div class="col-lg-2 milestone_col">
								<div class="milestone text-center">
									<div class="milestone_icon"><img src="${pageContext.request.contextPath}/resources/travelix/images/thunder.png" alt=""></div>
									<div class="milestone_counter" data-end-value="12">0</div>
									<div class="milestone_text">#번개</div>
								</div>
							</div>
						</div>
					</div>
				
					
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
</body>
</html>