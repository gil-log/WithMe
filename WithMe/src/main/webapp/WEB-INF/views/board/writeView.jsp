<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	<!-- 작성 버튼 눌렀을때 벨리데이션(유효성 검사? 오류 창 뜨게 하는 느낌?) 체크 하기 위한 함수, chk 클래스 i번째가 공백이거나 null이면 알러트로 i번째 타이틀 출력해줌 -->
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	</script>
	
	
	<body>
	
		<div class="root">
		
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form name="writeForm" method="post" action="/board/write">
					<table>
						<tbody>
						
						<!-- 18강 로그인 -->
						<c:if test="${member.userId != null}">
						
						
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="title" class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="content" class="chk" title="내용을 입력하세요."></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자</label><input type="text" id="writer" name="writer" class="chk" title="작성자를 입력하세요."/>
								</td>
							<tr>
								<td>						
									<button type="submit" class= "write_btn">작성</button> <!-- clss, type순으로 하면 500오류 뜸,,,,요 class="이름" 요 이름이위에 jscript에서 이름이랑 연결되서 기능 구혀닝 된ㄷ-->
								</td>
							</tr>	
							
							<!-- 18강 로그인 -->
						</c:if>
							<c:if test="${member.userId == null}">
								<p>로그인 후에 작성하실 수 있습니다.</p>
							</c:if>
									
									
						</tbody>			
					</table>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>