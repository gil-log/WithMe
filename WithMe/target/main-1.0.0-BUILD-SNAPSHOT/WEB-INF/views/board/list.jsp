<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- forEach 쓰려면 요걸 써줘야됨 import 느낌? -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- fmt날짜 포맷 써주려면 요걸 써줘야됨 import 느낌 -->
<html>
	<head>
	 	<title>게시판</title>
	</head>
	<body>
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<nav>
			  홈 - 글 작성
			</nav>
			<hr />
			
			<section id="container">
				<form role="form" method="post" action="/board/write">
					<table>
						<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
						<!-- forEach는 ${list}받는만큼 아래 행위를 반복해주겠다는 뜻임 자바 for문 생각하면 됨 받은 ${list}의 변수명을 "list"로 하겠다! 이런 느낌? -->
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.bno}" /></td>
								<td><c:out value="${list.title}" /></td>
								<td><c:out value="${list.writer}" /></td>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
						
					</table>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>