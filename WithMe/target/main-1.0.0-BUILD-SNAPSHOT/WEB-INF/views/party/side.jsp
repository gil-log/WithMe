<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- forEach 쓰려면 요걸 써줘야됨 import 느낌? -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- fmt날짜 포맷 써주려면 요걸 써줘야됨 import 느낌 -->
<html>
<head>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">   
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 페이징 가로 정렬 -->

<script type="text/javascript">
$(document).ready(function(){
          
               <!--picklist 가는 버튼-->
               $("#pickListBtn").on("click", function(){
                  var popupWidth = 500;
               var popupHeight = 800;
               
               var popupX = (window.screen.width / 2) - (popupWidth / 2);
               // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
               
               var popupY= (window.screen.height / 2) - (popupHeight / 2);
               // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
               
               window.open('../pick/picklist','windowpopup', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
            

                    // location.href="../pick/picklist";
                })
                
               <!--popup으로 letterlist 가는 버튼-->
            
               $("#letterListBtn").on("click", function(){
                  var popupWidth = 500;
               var popupHeight = 800;
               
               var popupX = (window.screen.width / 2) - (popupWidth / 2);
               // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
               
               var popupY= (window.screen.height / 2) - (popupHeight / 2);
               // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
               
               window.open('../letter/letterlist','windowpopup', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
            

                    //location.href="../letter/letterlist";
                })


         });
</script>

<style>

a:link {text-decoration: none;}
a:hover {text-decoration: none;}
a:visited {text-decoration: none;}


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
   <div>
       <div class = "box">
          <span class="box1">${userInfo.u_id}</span>
           <span class="box2">${userInfo.gender}</span>
           <span class="box3">${userInfo.age}</span>
       </div>
    </div>
            
         
   <p class="self_inro">${userInfo.intro}</p>
                 
      <div>
          <c:if test="${user != null}">
          <button id="pickListBtn" style="background-color:transparent;  border-color:transparent;">
               <img src="${pageContext.request.contextPath}/resources/img/cart.png"
                   style="background-color:transparent;  border-color:transparent;" width="30" height="30"/>
            </button>
            <button id="letterListBtn" style="background-color:transparent;  border-color:transparent;">
               <img src="${pageContext.request.contextPath}/resources/img/letter.png"
                   style="background-color:transparent;  border-color:transparent;" width="30" height="25"/>
            </button>
         </c:if>
         <c:if test="${user == null}">
             <button id="needLoginPickListBtn" style="background-color:transparent;  border-color:transparent;">
               <img src="${pageContext.request.contextPath}/resources/img/cart.png"
                style="background-color:transparent;  border-color:transparent;" width="30" height="30"/>
            </button>
            <button id="needLoginLetterListBtn" style="background-color:transparent;  border-color:transparent;">
               <img src="${pageContext.request.contextPath}/resources/img/letter.png"
                   style="background-color:transparent;  border-color:transparent;" width="30" height="25"/>
            </button>
         </c:if>
      
      </div>
 </div>

</body>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</html>