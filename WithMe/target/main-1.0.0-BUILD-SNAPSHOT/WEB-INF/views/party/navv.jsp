<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- forEach 쓰려면 요걸 써줘야됨 import 느낌? -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- fmt날짜 포맷 써주려면 요걸 써줘야됨 import 느낌 -->
<html>
   <head>
      <!-- 합쳐지고 최소화된 최신 CSS 
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
       부가적인 테마 
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">-->

      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">   
   
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <title>게시판</title>
       <!-- 페이징 가로 정렬 -->

<style>

a:link {text-decoration: none;}
a:hover {text-decoration: none;}
a:visited {text-decoration: none;}

<!--여기는 상단바 -->

.brand {
   font-size: 3rem;
}

.navbar {
   position: fixed;
   width: 100%;
   background-image: url("images/overlay.png"), -moz-linear-gradient(45deg, #907ccc 15%, #ed9aa3 85%);
   background-image: url("images/overlay.png"), -webkit-linear-gradient(45deg, #907ccc 15%, #ed9aa3 85%);
   background-image: url("images/overlay.png"), -ms-linear-gradient(45deg, #907ccc 15%, #ed9aa3 85%);
   background-image: url("images/overlay.png"), -o-linear-gradient(45deg, #907ccc 15%, #ed9aa3 85%);
   background-image: url("images/overlay.png"), linear-gradient(45deg, #907ccc 15%, #ed9aa3 85%);
}

.border-bottom {
   border-bottom: 1px solid #402394 !important;
}

.rounded-circle{
   border-radius:30% !important;
   width: 30%;
}

.dropdown-menu{
   right: 15px;
}

<!-- 상단바드롭다운 -->  
.dropdown-toggle::after {
   margin-left: 0em;
}
.nav-link {
    display: contents;
}

</style>
</head>
<body>


 <!-- 여기 상단바 -->
 <nav class="navbar navbar-light bg-light border-bottom fixed-top">
   
   <b><a href="/main"><font size="6rem" color="white" face="나눔바른고딕">With ME?</font></a></b>
  
   
    <!-- Nav Item - User Information -->
    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          
           <c:if test="${user != null}">
              <p>${user.u_id}님 안녕하세요.</p>
              <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
           </c:if>
            <c:if test="${user == null}">
            <i class="fas fa-cogs fa-sm fa-fw mr-150 text-gray-400"></i>로그인이 필요합니다.</c:if>
        
   </a>
   
    <!-- Dropdown - User Information -->
    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
       <a class="dropdown-item" href="/mypage">
           <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  MyPage
        </a>
        <a class="dropdown-item" href="#">
           <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Apply Record
        </a>
        <a class="dropdown-item" href="#">
           <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Letter
        </a>
        
        <c:if test="${user != null}">
           <div class="dropdown-divider">
               <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                   Logout
                </a>
             </div>
         </c:if>
         <c:if test="${user == null}">
            <div class="dropdown-divider">
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#loginModal">
                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Login
               </a>
            </div>
         </c:if>
      </div>
            
   </nav>
   
   
  <!-- Login Modal -->
   <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
       <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                   <h5 class="modal-title" id="exampleModalLabel">로그인 하시겠습니까?</h5>
                   <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span>
                   </button>
              </div>
           <div class="modal-body">일정에 참여하려면 아래에서 "로그인"을 선택하십시오.</div>
           <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="/main">Login</a>
           </div>
         </div>
       </div>
   </div>
 
  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">정말 로그아웃 하시겠습니까?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">현재 세션을 종료하려면 아래에서 "로그아웃"을 선택하십시오.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="/user/logout">Logout</a>
        </div>
      </div>
    </div>
  </div>

</body>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</html>