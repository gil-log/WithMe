<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- forEach 쓰려면 요걸 써줘야됨 import 느낌? -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- fmt날짜 포맷 써주려면 요걸 써줘야됨 import 느낌 -->
<html>
   <head>
         
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/travelix/styles/bootstrap4/bootstrap.min.css">
   <link href="${pageContext.request.contextPath}/resources/travelix/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/travelix/styles/elements_styles.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/travelix/styles/elements_responsive.css">
   
   <script src="${pageContext.request.contextPath}/resources/travelix/js/jquery-3.2.1.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/travelix/styles/bootstrap4/popper.js"></script>
   <script src="${pageContext.request.contextPath}/resources/travelix/styles/bootstrap4/bootstrap.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/travelix/plugins/greensock/TweenMax.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/travelix/plugins/greensock/TimelineMax.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/travelix/plugins/scrollmagic/ScrollMagic.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/travelix/plugins/greensock/animation.gsap.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/travelix/plugins/greensock/ScrollToPlugin.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/travelix/plugins/progressbar/progressbar.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/travelix/plugins/jquery-circle-progress-1.2.2/circle-progress.js"></script>
   <script src="${pageContext.request.contextPath}/resources/travelix/plugins/parallax-js-master/parallax.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/travelix/js/elements_custom.js"></script>
   
   
   <link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/party/party.css">
   <hr />
      
         
      <hr />

       <script type="text/javascript">
      $(document).ready(function(){
           <!--letter작성으로 가는 버튼-->
            $("#letterwriteBtn").on("click", function(){
              location.href="../letter/letterwriteView";
               })
         
      });
      </script>
      
   </head>
   
   <body>
   <!-- 부트스트랩 -->
      <div>
         <ul style = "display: flex;">   
            <li>
            
               <h4>수신 쪽지 보관함</h4>
               <hr/>
               <c:forEach items="${letterlist}" var="letterlist">
                  <c:if test="${letterlist.send_flag eq 0}">   
                  <div class="card text-white bg-primary mb-5" style="max-width: 20rem; margin:auto; ">
                     <div class="card-header"></div>
                     <div class="card-body">
                        <h4 class="card-title">
                           <!-- 쪽지 내용을 확인할 수 있도록 나와야겠지? -->
                           <a href="/letter/letterreadView?l_id=${letterlist.l_id}" style="color:white;">
                              <c:out value="${letterlist.l_title}" />
                           </a>
                        </h4>
                        <p class="card-text" style="color:white;">
                           <c:out value="${letterlist.l_date}"/>
                           <c:out value="${letterlist.sender_id}" />
                        </p>
                     </div>
                  </div>
                  </c:if>
               </c:forEach>
               
            </li>
            <li>
               <div style = "display: flex;">
                  <h4>발신 쪽지 보관함</h4>
                  <button id="letterwriteBtn" style="background-color:transparent;  border-color:transparent;">
                        <img src="${pageContext.request.contextPath}/resources/img/letter.png"
                             style="background-color:transparent;  border-color:transparent;" width="30" height="25"/>
                    </button>
               </div>
               <hr/>
                  <c:forEach items="${letterlist}" var="letterlist">
                  <c:if test="${letterlist.send_flag eq 1}">   
                  <div class="card text-white bg-primary mb-5" style="max-width: 20rem; margin:auto;">
                     <div class="card-header"></div>
                     <div class="card-body">
                        <h4 class="card-title">
                           <!-- 쪽지 내용을 확인할 수 있도록 나와야겠지? -->
                           <a href="/letter/letterreadView?l_id=${letterlist.l_id}" style="color:white;">
                              <c:out value="${letterlist.l_title}" />
                           </a>
                        </h4>
                        <p class="card-text" style="color:white;">
                           <c:out value="${letterlist.l_date}"/>
                           <c:out value="${letterlist.u_id}" />
                        </p>
                     </div>
                  </div>
                  </c:if>
               </c:forEach>
            </li>
         </ul>
      </div>
      
   </body>
</html>