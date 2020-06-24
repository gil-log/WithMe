<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/party/party.css">
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>로그인</title>
	</head>
	
	
<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="/user/logout";
		})
		
		$("#regitserBtn").on("click", function(){
			location.href="/user/register";
		})
		
		$("#submit").on("click", function(){
			location.href="/user/login";
		})
		
		
		
		
	})
</script>



<body>

<form name='homeForm' method="post" action="/user/login">
  <fieldset>
  
  
  
  		<c:if test="${user == null}">
    <div class="form-group">
      <label for="u_id">아이디</label>
      <input type="text" name="u_id" class="form-control" id="u_id" placeholder="아이디">
    </div>

    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" name="password" class="form-control" id="password" placeholder="Password">
    </div>

    <div>
    <button type="submit" name = "submit" id = "submit" class="btn btn-primary">로그인</button>
    &nbsp;
	<button type="button" id = "regitserBtn" class="btn btn-danger">회원가입</button>
	</div>
	
		</c:if>
		<c:if test="${user != null }">
			<div>
				<p>${user.u_id}님 환영 합니다.</p>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>

  


    </fieldset>
</form>


</body>
</html>