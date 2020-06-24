<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- forEach 쓰려면 요걸 써줘야됨 import 느낌? -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- fmt날짜 포맷 써주려면 요걸 써줘야됨 import 느낌 -->
<html>
<head>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">   
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>마이페이지</title>

<!-- 페이징 가로 정렬 -->
<style>

a:link {text-decoration: none;}
a:hover {text-decoration: none;}
a:visited {text-decoration: none;}

.container{
   padding-top: 490px;
}
   

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

<!--버튼 -->
#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: red;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}

#myBtn:hover {
  background-color: #555;
  }


<!-- 상단바드롭다운 -->  
.dropdown-toggle::after {
   margin-left: 0em;
}
.nav-link {
    display: contents;
}
 
<!-- 사이드 -->

.border-right{
   border-right: 1px solid #402394!important;
}

.sidenav {
   text-align: center;
      height: 100%;
      width: 300px;
   position: fixed;
   z-index: 1;
   top: 0;
   left: 0;
   overflow-x: hidden;
   padding-top: 120px;
   

      background-image: url("images/overlay.png"), -moz-linear-gradient(45deg, #ed9aa3 15%, #907ccc 85%);
      background-image: url("images/overlay.png"), -webkit-linear-gradient(45deg, #ed9aa3 15%, #907ccc 85%);
      background-image: url("images/overlay.png"), -ms-linear-gradient(45deg, #ed9aa3 15%, #907ccc 85%);
      background-image: url("images/overlay.png"), -o-linear-gradient(45deg, #ed9aa3 15%, #907ccc 85%);
      background-image: url("images/overlay.png"), linear-gradient(45deg, #ed9aa3 15%, #907ccc 85%);
}

.sidenav .rounded-circle{
   border-radius:30% !important;
   width: 70%;
   display: block;
   margin-left:auto;
   margin-right: auto;
   }

.box{
   display: block;
   margin-left:auto;
   margin-right: auto;
   padding-top:18px;
   font-style:inherit;
   color:black;
   font-size:large;
}
.box .box2{
   color:green;
   }
.box .box3{
   color:yellow;
   }
   

.self_inro{
   color:white;
   margin-top: 13px;
   margin-bottom: 2rem;
   margin-left: auto;
   margin-right: auto;
   width: 230;
}

   

</style>
</head>
<body>


<!-- 여기 사이드 (정보불러오기)-->
<div class="sidenav border-right border-width">
   <div><img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
       <div class = "box">
          <span class="box1">김한솔</span>
           <span class="box2">여자</span>
           <span class="box3">26</span>
       </div>
    </div>
            
         
   <p class="self_inro">안녕하세요~ 저는 사진 찍는걸 좋아해요. 요즘 꽃피는 봄이 와서 즐거운 나날들을  보내고 있답니다.
            저와 취미가 같으신 분들 부담 없이 쪽지 남겨주시면 답장 드릴게요~ 같이 사진 찍으러 가요!!</p>
                 
    <button class="button button2" href="#">쪽지함</button>
    <button class="button button3" href="#">나의 이력</button> 
 </div>
 
 
 <!-- 여기 상단바 -->
 <nav class="navbar navbar-light bg-light border-bottom fixed-top">
   
   <b><a href="/main"><font size="6rem" color="white" face="나눔바른고딕">With ME?</font></a></b>
  
   
    <!-- Nav Item - User Information -->
    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          
           <c:if test="${member != null}">
              <p>${member.userId}님 안녕하세요.</p>
              <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
           </c:if>
            <c:if test="${member == null}">
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
        
        <c:if test="${member != null}">
           <div class="dropdown-divider">
               <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                   Logout
                </a>
             </div>
         </c:if>
         <c:if test="${member == null}">
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
          <a class="btn btn-primary" href="/member/logout">Logout</a>
        </div>
      </div>
    </div>
  </div>


<!-- 상단으로가는 버튼 -->
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>

<script>
//Get the button
var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>

</body>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</html>