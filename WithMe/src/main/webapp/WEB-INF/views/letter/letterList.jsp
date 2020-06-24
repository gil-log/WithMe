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
   <nav/>
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
         <ul>   
            <li>
               <h4>수신 쪽지 보관함</h4>
               <hr/>
               <c:forEach items="${receiveletterlist}" var="receiveletterlist">
                  <c:if test="${receiveletterlist.send_flag eq 0}">   
                  <div class="card text-white bg-primary mb-5" style="max-width: 20rem; margin:auto; ">
                     <div class="card-header"></div>
                     <div class="card-body">
                        <h4 class="card-title">
                        
                           <a href="/letter/letterreadView?l_id=${receiveletterlist.l_id}" style="color:white;">
                              <c:out value="${receiveletterlist.l_title}" />
                           </a>
                        </h4>
                        <p class="card-text" style="color:white;">
                           <c:out value="${receiveletterlist.l_date}"/>
                           <c:out value="${receiveletterlist.sender_id}" />
                        </p>
                     </div>
                  </div>
                  </c:if>
               </c:forEach>
         		
         		  <!-- 여기부터 페이징 추가 -->
                <div style = "text-align:center">
                	
                	<c:if test = "${receivePrev}">
                		 <a href="/letter/letterlist?receiveNum=${receiveStartPageNum - 1}">이전</a>
              		 </c:if>
              		  
                	<c:forEach begin="${receiveStartPageNum}" end="${receiveEndPageNum}" var ="receiveNum">
                		<span>
                			<c:if test="${receiveNow != receiveNum}">
                				<a href="/letter/letterlist?receiveNum=${receiveNum}"> ${receiveNum}</a>
                			</c:if>
                			
                			<c:if test="${receiveNow == receiveNum}">
                				<b>${receiveNum}</b>
                			</c:if>
                		</span>
                	</c:forEach>
               		
               		<c:if test = "${receiveNext}">
                		 <a href="/letter/letterlist?receiveNum=${receiveEndPageNum + 1}">다음</a>
            		</c:if>
            		 
         		</div>
         		<!-- 여기까지 페이징 부분 -->
         		
         		
         		
         		
         		
               <hr/>
            </li>
            <li>
               <div style = "display: flex;">
                  <h4>발신 쪽지 보관함</h4> &nbsp &nbsp
                  <button id="letterwriteBtn" style="background-color:transparent;  border-color:transparent;">
                        <img src="${pageContext.request.contextPath}/resources/img/letter.png"
                             style="background-color:transparent;  border-color:transparent; padding-bottom: 8;" width="30" height="28"/>
                   </button>
               </div>
               <hr/>
                  <c:forEach items="${sendletterlist}" var="sendletterlist">
                  <c:if test="${sendletterlist.send_flag eq 1}">   
                  <div class="card text-white bg-primary mb-5" style="max-width: 20rem; margin:auto;">
                     <div class="card-header"></div>
                     <div class="card-body">
                        <h4 class="card-title">
                            <a href="/letter/letterreadView?l_id=${sendletterlist.l_id}" style="color:white;">
                              <c:out value="${sendletterlist.l_title}" />
                           </a>
                        </h4>
                        <p class="card-text" style="color:white;">
                           <c:out value="${sendletterlist.l_date}"/>
                           <c:out value="${sendletterlist.u_id}" />
                        </p>
                     </div>
                  </div>
                  </c:if>
               </c:forEach>
               <!-- 여기부터 페이징 추가 -->
                <div style = "text-align:center">
                	
                	<c:if test = "${sendPrev}" >
                		 <a href="/letter/letterlist?sendNum=${sendStartPageNum - 1}">이전</a>
              		 </c:if>
              		  
                	<c:forEach begin="${sendStartPageNum}" end="${sendEndPageNum}" var ="sendNum">
                		<span>
                			<c:if test="${sendNow != sendNum}">
                				<a href="/letter/letterlist?sendNum=${sendNum}"> ${sendNum}</a>
                			</c:if>
                			
                			<c:if test="${sendNow == sendNum}">
                				<b>${sendNum}</b>
                			</c:if>
                		</span>
                	</c:forEach>
               		
               		<c:if test = "${sendNext}">
                		 <a href="/letter/letterlist?sendNum=${sendEndPageNum + 1}">다음</a>
            		</c:if>
            		 
         		</div>
         		<!-- 여기까지 페이징 부분 -->
            </li>
         </ul>
      </div>
      
   </body>
</html>