<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>


<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/travelix/styles/bootstrap4/bootstrap.min.css">
<link
   href="${pageContext.request.contextPath}/resources/travelix/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
   rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/travelix/styles/elements_styles.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/travelix/styles/elements_responsive.css">

<script
   src="${pageContext.request.contextPath}/resources/travelix/js/jquery-3.2.1.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/travelix/styles/bootstrap4/popper.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/travelix/styles/bootstrap4/bootstrap.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/travelix/plugins/greensock/TweenMax.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/travelix/plugins/greensock/TimelineMax.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/travelix/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/travelix/plugins/greensock/animation.gsap.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/travelix/plugins/greensock/ScrollToPlugin.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/travelix/plugins/progressbar/progressbar.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/travelix/plugins/jquery-circle-progress-1.2.2/circle-progress.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/travelix/plugins/parallax-js-master/parallax.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/travelix/js/elements_custom.js"></script>

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/party/party.css">


<script type="text/javascript">
         $(document).ready(function(){
            $("#logoutBtn").on("click", function(){
               location.href="../user/logout";
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

<!-- 페이징 가로 정렬 -->
<style>
a:link {
   text-decoration: none;
}

a:hover {
   text-decoration: none;
}

a:visited {
   text-decoration: none;
}

<!--
여기는 상단바 -->.brand {
   font-size: 3rem;
}

.navbar {
   position: fixed;
   width: 100%;
   background-image: url("images/overlay.png"),
      -moz-linear-gradient(45deg, #907ccc 15%, #ed9aa3 85%);
   background-image: url("images/overlay.png"),
      -webkit-linear-gradient(45deg, #907ccc 15%, #ed9aa3 85%);
   background-image: url("images/overlay.png"),
      -ms-linear-gradient(45deg, #907ccc 15%, #ed9aa3 85%);
   background-image: url("images/overlay.png"),
      -o-linear-gradient(45deg, #907ccc 15%, #ed9aa3 85%);
   background-image: url("images/overlay.png"),
      linear-gradient(45deg, #907ccc 15%, #ed9aa3 85%);
}

.btn-primary:hover{
background-color: transparent;
border-color: transparent; 
}

.btn-primary{
background-color: transparent;
border-color: transparent; 
}

.border-bottom {
   border-bottom: 1px solid #402394 !important;
}

.rounded-circle {
   border-radius: 30% !important;
   width: 30%;
}

.dropdown{
   color: black;
}

.dropdown-menu {
   right: 15px;
}

<!--상단바드롭다운 -->
.dropdown-toggle::after {
   margin-left: 0em;
}

.btn-primary.dropdown-toggle{
  background-color: transparent;
   border-color: transparent; 
}
.btn-primary:not(:disabled):not(.disabled):active, .btn-primary:not(:disabled):not(.disabled).active, .show > .btn-primary.dropdown-toggle {
    color: #fff;
    background-color: transparent;
    border-color: transparent;
}

.nav-link {
   display: contents;
}

.bg-hot{
  background-color: #EA0000 !important;	
}

.bg-insa{
  background-color: #EAC300 !important;	
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

.container{
   padding-top: 100px}






/* ++ 토글바 css */
/* The switch - the box around the slider */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

/* Hide default HTML checkbox */
.switch input {
  opacity: 0;
  width: 0;
  height: 0;
}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
/* ++ 토글바 css 끝 */







</style>


</head>
<body>

<!-- 여기 상단바 -->
<nav class="navbar navbar-light bg-light border-bottom fixed-top">
   <b><a href="/main"><font size="6rem" color="white" face= "NanumSquare">With ME?</font></a></b>





<!-- ++ 지도 list, 카드 list 토글 -->
<label class="switch">
  <input type="checkbox" checked>
  <span class="slider round"></span>
</label>








   <!-- Nav Item - User Information -->
   <div class="btn-group">
       <button class="btn btn-primary dropdown-toggle" id="userDropdown" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <c:if test="${user != null}">
            <p>${user.u_id}님 안녕하세요.</p>
         </c:if>
         <c:if test="${user == null}">
            <i class="fas fa-cogs fa-sm fa-fw mr-150 text-gray-400"></i>로그인이 필요합니다.</c:if>
          
       </button>
   
      <div class="dropdown-menu">
         <a class="dropdown-item" href="../mypage">MyPage</a>
         <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="../party/writeView">Write Party</a>
        <div class="dropdown-divider"></div>
         <a class="dropdown-item" href="../pick/picklist">Apply Record</a>
         <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="../letter/letterlist">Letter</a>
        <div class="dropdown-divider"></div>
       
        <c:if test="${user != null}">
           <a href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                   Logout
            </a>
        </c:if>
        <c:if test="${user == null}">
            <a href="#" data-toggle="modal" data-target="#loginModal">
                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Login
            </a>
        </c:if>
   
    </div>
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
                <a class="btn btn-primary" href="../user/login">Login</a>
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
          <button class="btn btn-secondary" type="button" data-dismiss="modal" id="logoutBtn">Logout</button>
        </div>
      </div>
    </div>
  </div>

      <header>
         <h1>Party Matching</h1>
      </header>

      <div class="container">
         <form class="form-inline my-2 my-lg-0">









<div style= "left: 30%;float:left;">
<input type="hidden" name="keyword" value="#keyInput" readonly="readonly"/>
               <input class="form-control mr-sm-2" type="text" name="keywordInput"
                  id="keywordInput"  placeholder="Search" />
                  
               <button class="btn btn-secondary my-2 my-sm-0" id="searchBtn"
                  type="button">검색</button>
</div>
         </form>
         
<!-- + $("select option:selected").val() -->
         <script>

      $(function(){
        $('#searchBtn').click(function() {
          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=tce" + "&keyword=" + encodeURIComponent($('#keywordInput').val())
        });
      });   
    </script>









         <!-- Milestones -->
         <div class="milestones" style="padding: 0px 0px 30px 0px;">
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
                        <a href="list?searchType=we&keyword=%EC%97%AC%ED%96%89"> <img
                           src="${pageContext.request.contextPath}/resources/img/travel.png"
                           alt="">
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
                        <a href="list?searchType=we&keyword=%EB%A8%B9%EB%B0%A9"> <img
                           id="hashtag_mukbang"
                           src="${pageContext.request.contextPath}/resources/img/mukbang.png"
                           alt="">
                     </div>
                     </a>
                     <div class="milestone_counter" data-end-value="${mukbang}">0</div>
                     <div class="milestone_text">#먹방</div>
                  </div>
               </div>

               <!-- Milestone -->
               <div class="col-lg-2 milestone_col">
                  <div class="milestone text-center">
                     <div class="milestone_icon">
                        <a href="list?searchType=we&keyword=%EC%98%A4%EB%9D%BD"> <img
                           id="hashtag_ohrak"
                           src="${pageContext.request.contextPath}/resources/img/acade.png"
                           alt="">
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
                        <a href="list?searchType=we&keyword=%ED%9E%90%EB%A7%81"> <img
                           id="hashtag_healing"
                           src="${pageContext.request.contextPath}/resources/img/healing.png"
                           alt="">
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
                        <a href="list?searchType=we&keyword=%EC%82%AC%EC%A7%84"> <img
                           id="hashtag_photo"
                           src="${pageContext.request.contextPath}/resources/img/photo.png"
                           alt="">
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
                        <a href="list?searchType=we&keyword=%EB%B2%88%EA%B0%9C"> <img
                           id="hashtag_thunder"
                           src="${pageContext.request.contextPath}/resources/img/thunder.png"
                           alt="">
                        </a>
                     </div>
                     <div class="milestone_counter" data-end-value="${thunder}">0</div>
                     <div class="milestone_text">#번개</div>
                  </div>
               </div>
            </div>
         </div>


         <form role="form" method="get">



<c:set var="hot_id" value="${partyHot.party_id}"/>   
<c:set var="insa_id" value="${partyInsa.party_id}"/>
<!-- 오늘의 핫플 -->
<c:if test="${partyHot != null}">
               <div class="cards text-red bg-hot mb-5"
                  style="max-width: 50rem; margin: auto;">
                  <div class="card-header"></div>
               
                  <div class="card-body">
                     <h2 class="card-title">
                     Hot Place!!
                     <br>
                        <a href="/party/readView?party_id=${partyHot.party_id}"
                           style="color: white;"> <c:out value="${partyHot.party_title}" />
                        </a>
                     </h2>

                     <table>
                     <br>
                        <tr>
                           <td>
                           <td>
                              <p class="card-text" style="color: white;">

                                 <fmt:formatDate value="${partyHot.p_date}" pattern="yyyy-MM-dd" />
                                 <c:out value="${partyHot.u_id}" />
                              </p>
                           </td>
                           <td>
                           
<!-- 자기가 만든파티에 pick하면 무결성 위배 -->
            <div style = "display: flex; justify-content: flex-end;">
                     
                     <form method="get" action="/pick/pickinsert" >
                      <input type="hidden" name = "party_id" value = "${partyHot.party_id}"  />
                      <button type="submit" style="background-color:transparent;  border:0px transparent solid; text-align: center;" width="25" height="40">
                          
                          <c:set var="party_id" value = "${partyHot.party_id}"/>
                            <c:set var="png_chk" value = ""/>
                              
                          <c:forEach items="${pickjoinlist}" var="pickjoinlist">
                               <c:if test = "${party_id eq pickjoinlist}">
                                 <img src="${pageContext.request.contextPath}/resources/img/fullheart.png" width="25" height="25"/>
                                 <c:set var="png_chk" value = "픽이 되었다."/>
                              </c:if>
                           </c:forEach>
                           
                           <c:if test = "${png_chk eq ''}">
                              <img src="${pageContext.request.contextPath}/resources/img/heart.png" width="25" height="25"/>
                           </c:if>
                           
                        </button>
                     </form>
                 </div>

                           </td>

                        </tr>
                     </table>

                  </div>
               </div>
</c:if >

<c:if test="${partyHot == null}">

<div style="margin:auto; left:30%; "><h1> 검색 결과가 없어용 :( </h1></div>

</c:if>
<!-- 오늘의 인싸 -->

<c:if test="${partyInsa != null}">
<c:choose>
<c:when test = "${hot_id == insa_id}">
</c:when>

<c:otherwise>

               <div class="cards text-red bg-insa mb-5"
                  style="max-width: 50rem; margin: auto;">
                  <div class="card-header"></div>
               
                  <div class="card-body">
                     <h2 class="card-title">
                     Social King!!
                     <br>
                        <a href="/party/readView?party_id=${partyInsa.party_id}"
                           style="color: white;"> <c:out value="${partyInsa.party_title}"/>

                        </a>
                     </h2>

                     <table>
                     <br>
                        <tr>
                     
                           <td>
                              <p class="card-text" style="color: white;">

                                 <fmt:formatDate value="${partyInsa.p_date}" pattern="yyyy-MM-dd" />
                                 <c:out value="${partyInsa.u_id}" />
                              </p>
                           </td>
                           <td>
<!-- 자기가 만든파티에 pick하면 무결성 위배 -->
            <div style = "display: flex; justify-content: flex-end;">
                     
                     <form method="get" action="/pick/pickinsert" >
                      <input type="hidden" name = "party_id" value = "${partyInsa.party_id}"  />
                      <button type="submit" style="background-color:transparent;  border:0px transparent solid; text-align: center;" width="25" height="40">
                          
                          <c:set var="party_id" value = "${partyInsa.party_id}"/>
                            <c:set var="png_chk" value = ""/>
                              
                          <c:forEach items="${pickjoinlist}" var="pickjoinlist">
                               <c:if test = "${party_id eq pickjoinlist}">
                                 <img src="${pageContext.request.contextPath}/resources/img/fullheart.png" width="25" height="25"/>
                                 <c:set var="png_chk" value = "픽이 되었다."/>
                              </c:if>
                           </c:forEach>
                           
                           <c:if test = "${png_chk eq ''}">
                              <img src="${pageContext.request.contextPath}/resources/img/heart.png" width="25" height="25"/>
                           </c:if>
                           
                        </button>
                     </form>
                 </div>

                           </td>

                        </tr>
                     </table>

                  </div>
               </div>


</c:otherwise>

</c:choose>   

</c:if>














<c:forEach items="${list}" var="list">
   
<c:set var="party_id" value="${list.party_id}"/>
            
<c:choose>
<c:when test = "${party_id == hot_id}">
</c:when>
<c:when test = "${party_id == insa_id}">
</c:when>
<c:otherwise>




            
               <div class="cards text-white bg-primary mb-5"
                  style="max-width: 50rem; margin: auto;">
                  <div class="card-header"></div>
                  
                  
                  
                  <div class="card-body">
                     <h2 class="card-title">
                     <br>
                        <a href="/party/readView?party_id=${list.party_id}"
                           style="color: white;"> <c:out value="${list.party_title}" />
                        </a>
                     </h2>

                     <table>
                     <br>
                        <tr>
                           
                           <td>
                              <p class="card-text" style="color: white;">


                                 <fmt:formatDate value="${list.p_date}" pattern="yyyy-MM-dd" />
                                 <c:out value="${list.u_id}" />


                              </p>
                           </td>
                           <td>
                              <div style="float: left;">
<!-- 자기가 만든파티에 pick하면 무결성 위배 -->
            <div style = "display: flex; justify-content: flex-end;">
                     
                     <form method="get" action="/pick/pickinsert">
                      <input type="hidden" name = "party_id" value = "${list.party_id}"  />
                      <button type="submit" style="background-color:transparent;  border:0px transparent solid; text-align: center;" width="25" height="40">
                          
                          <c:set var="party_id" value = "${list.party_id}"/>
                            <c:set var="png_chk" value = ""/>
                              
                          <c:forEach items="${pickjoinlist}" var="pickjoinlist">
                               <c:if test = "${party_id eq pickjoinlist}">
                                 <img src="${pageContext.request.contextPath}/resources/img/fullheart.png" width="30" height="30"/>
                                 <c:set var="png_chk" value = "픽이 되었다."/>
                              </c:if>
                           </c:forEach>
                           
                           <c:if test = "${png_chk eq ''}">
                              <img src="${pageContext.request.contextPath}/resources/img/heart.png" width="30" height="30"/>
                           </c:if>
                           
                        </button>
                     </form>
                 </div>

                           </td>
                        </tr>
                     </table>
                  </div>
               </div>

</c:otherwise>

</c:choose>                  
               
            </c:forEach>
         </form>

         <div style="left: 50%;">

            <ul class="pagination">

               <c:if test="${pageMaker.prev}">
                  <li class="page-item"><a class="page-link"
                     href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
                  </li>
               </c:if>
               <c:forEach begin="${pageMaker.startPage}"
                  end="${pageMaker.endPage}" var="idx">
                  <li class="page-item"><a class="page-link"
                     href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
               </c:forEach>
               <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                  <li class="page-item"><a class="page-link"
                     href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
                  </li>
               </c:if>
            </ul>
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
</html>