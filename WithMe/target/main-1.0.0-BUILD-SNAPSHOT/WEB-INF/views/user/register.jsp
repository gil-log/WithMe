<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/party/party.css">
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">

	
		$(document).ready(function(){
			// 취소
			$("#cancel").on("click", function(){
				window.close();
				})	
		
			$("#submit").on("click", function(){
				if($("#u_id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#u_Id").focus();
					return false;
				}
				if($("#password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
				if($("#name").val()==""){
					alert("성명을 입력해주세요.");
					$("#name").focus();
					return false;
				}
				
				// 2.암호체크
			    // var pwd = document.RegisterForm.txt.Password;
			    var pwd = document.getElementById("password");
			    if (pwd.value.length < 3 || pwd.value.length > 15) {
			        window.alert("암호는 3자 이상 및 15자 이하로 입력하세요.");
			        pwd.select();
			        return false;
			    }
					
			    // 암호와 암호확인가 같은지 체크
			    if (pwd.value != document.getElementById("passwordchk").value) {
			        window.alert("암호가 틀렸습니다.");
			        pwd.select();
			        document.getElementById("passwordchk").value = "";
			        return false;
			    }
			    
			    window.alert("회원가입에 성공 하였습니다!");
			    
				window.close();
			});
			
				
			
		})
		


		
	</script>
	<body>
		<section id="container">
		
		
		
		
		
		
		
		
		
		
<form action="/user/register" method="post">
  <fieldset>
    <legend>회원가입</legend>

    <div class="form-group">
      <label for="u_id">아이디</label>
      <input type="text" name="u_id" class="form-control" id="u_id" placeholder="아이디">
    </div>


    
    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" name="password" class="form-control" id="password" placeholder="Password">
      <br>
      <input type="password" id="passwordchk" class="form-control" placeholder="Password Check"/>

    </div>
    
    <div class="form-group">
      <label for="name">이름</label>
      <input type="text" name="name" class="form-control" id="name" placeholder="이름">
    </div>


    <div class="form-group">
      <label for="age">나이</label>
      <input type="number" name="age" class="form-control" id="age" placeholder="나이">
    </div>
    

<div class="form-group">
    <div class="custom-control custom-radio">
      <input type="radio" id="customRadio1" name="gender" value="M" class="custom-control-input" checked>
      <label class="custom-control-label" for="customRadio1">남성</label>
    </div>
    <div class="custom-control custom-radio">
      <input type="radio" id="customRadio2" name="gender" value="F" class="custom-control-input">
      <label class="custom-control-label" for="customRadio2">여성</label>
    </div>
  </div>
    
    
    
    
    <div class="form-group">
      <label for="phone_number">휴대전화</label>
      <input type="tel" name="phone_number" class="form-control" id="phone_number">
    </div>
    
    
    <div class="form-group">
      <label for="email">Email address</label>
      <input type="email" name="email_address" class="form-control" id="email" aria-describedby="emailHelp" placeholder="example@example.com">
      <small id="emailHelp" class="form-text text-muted">Example과 같이 입력해 주세요.</small>
    </div>
    
    <div class="form-group">
    <label for="intro" style="font-weight: bold;">자기소개</label>
    <textarea id="intro" name="intro" ></textarea>
    </div>
    
    
    <button type="submit" name = "submit" id = "submit" class="btn btn-primary">회원가입</button>
    &nbsp;
	<button type="button" id = "cancel" class="btn btn-danger">취소</button>
  </fieldset>
  
</form>
		

			
			
		</section>
		
	</body>
	
</html>