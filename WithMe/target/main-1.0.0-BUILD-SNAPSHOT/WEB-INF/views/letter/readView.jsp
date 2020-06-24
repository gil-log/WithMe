<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/party/party.css">
<title>Selected Party</title>
</head>
<body>

	<div id="root">
		<header>
			<h1>Selected Party</h1>
		</header>
		<hr />

		<nav>Party View</nav>
		<hr />

		<section id="container">
			<form role="form" method="post">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">/</th>
							<th scope="col">안 내</th>
						</tr>
					</thead>
					<tbody>
						<tr class="table-active">
							<th scope="row">제목</th>
							<td>${read.party_title}</td>
						</tr>
						<tr>
							<th scope="row">일자</th>
							<td>${read.p_date}</td>
						</tr>
						<tr class="table-primary">
							<th scope="row">지역</th>
							<td>${read.p_location}</td>
						</tr>
						<tr class="table-secondary">
							<th scope="row">위도</th>
							<td>${read.p_long}</td>
						</tr>
						<tr class="table-success">
							<th scope="row">경도</th>
							<td>${read.p_lati}</td>
						</tr>
						<tr class="table-danger">
							<th scope="row">인원제한</th>
							<td>${read.p_num}</td>
						</tr>
						<tr class="table-warning">
							<th scope="row">성별제한</th>
							<td>${read.p_gender}</td>
						</tr>
						<tr class="table-info">
							<th scope="row">예상비용</th>
							<td>${read.p_cost}</td>
						</tr>
						<tr class="table-light">
							<th scope="row">내용</th>
							<td>${read.p_note}</td>
						</tr>
						<tr class="table-dark">
							<th scope="row">해쉬태그</th>
							<td>${read.hashtag}</td>
						</tr>
					</tbody>
				</table>

			</form>
		</section>
		<hr />
	</div>
</body>
</html>