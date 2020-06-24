
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

		<section id="container">
			<form role="form" method="post">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">쪽지 상세보기</th>
						</tr>
					</thead>
					<tbody>
						<tr class="table-primary">
							<th scope="row">제목</th>
							<td>${readletter.l_title}</td>
						</tr>
						<tr class="table-secondary">
							<th scope="row">내용</th>
							<td>${readletter.l_message}</td>
						</tr>
						<tr class="table-success">
							<th scope="row">날짜</th>
							<td>${readletter.l_date}</td>
						</tr>
					</tbody>
				</table>
			</form>
		</section>

			<div style="display: flex;">
				<form>
					<input type="button" value="뒤로가기" onclick="history.back()" width="100" height="40" />
				</form>
				<!-- 시스템 메세지인 경우 -->
				<c:if test="${readletter.sender_id ne user.u_id }">
					<c:if test="${readletter.party_host eq 1 && readletter.join_flag eq 1}">
						<form method="get" action="/pick/joinaccept">
							<input type="hidden" name="u_id" value="${readletter.sender_id}" />
							<input type="hidden" name="party_id" value="${readletter.party_id}" />
							<input type="hidden" name="party_title" value="${readletter.party_title}" />
							<input type="submit" value="수락하기" width="40" height="40">
							
						</form>
						
						<form method="get" action="/pick/joinreject">
							<input type="hidden" name="u_id" value="${readletter.sender_id}" />
							<input type="hidden" name="party_id" value="${readletter.party_id}" />
							<input type="hidden" name="party_title" value="${readletter.party_title}" />
							<input type="submit" value="거절하기" width="40" height="40">
						</form>
					</c:if>
					
					<!-- 일반 메세지인 경우 -->
					<c:if test="${readletter.party_host eq '0'}">
						<form method="get" action="/letter/letterwriteView">
							<input type="hidden" name="sender_id" value="${readletter.sender_id}" />
							<input type="submit" value="답장하기" width="40" height="40">
						</form>
					</c:if>
	
				</c:if>
			</div>
		<hr />
	</div>
</body>
</html>