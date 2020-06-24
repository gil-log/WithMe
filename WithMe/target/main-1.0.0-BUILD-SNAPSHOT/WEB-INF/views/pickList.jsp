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
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/party/party.css">

      
   </head>
   
   <body>
   <!-- 부트스트랩 -->
      <div>
         <ul>   
            <li>
               <h4>관심 목록 </h4>
               <hr/>
               <c:forEach items="${picklist}" var="picklist">
                  <c:if test="${picklist.pick_flag == 1}">
                  <div class="card text-white bg-primary mb-5" style="width: 20rem; margin:auto; display: flex;">
                     <div class="card-header"></div>
                     <div class="card-body">
                        <h4 class="card-title">
                           <a href="/party/readView?party_id=${picklist.party_id}" style="color:white;">
                              <c:out value="${picklist.party_title}" />
                           </a>
                        </h4>
                        <p class="card-text" style="color:white;">
                           <fmt:formatDate value="${picklist.p_date}" pattern="yyyy-MM-dd" />
                        </p>
                        
                        <div style = "display: flex; justify-content: flex-end;">
	            
                           <form method="get" action="/pick/pickdelete" >
                              <input type="hidden" name = "party_id" value = "${picklist.party_id}"/>
                              <button type="submit" style="background-color:transparent;  border:0px transparent solid;">
                                 <img src="${pageContext.request.contextPath}/resources/img/fullheart.png" width="30" height="30"/>
                              </button>
                           </form>
              
                        </div>
                     </div>
                  </div>
                  </c:if>
               </c:forEach>
            </li>
            <li>
               <h4> 매칭 신청 이력 </h4>
               <hr/>
               <c:forEach items="${picklist}" var="picklist">
                  <c:if test="${picklist.join_flag == 1}">
                  <div class="card text-white bg-primary mb-5" style="width: 20rem; margin:auto; display: flex;">
                     <div class="card-header"></div>
                     <div class="card-body">
                        <h4 class="card-title">
                           <a href="/party/readView?party_id=${picklist.party_id}" style="color:white;">
                              <c:out value="${picklist.party_title}" />
                           </a>
                        </h4>
                        <p class="card-text" style="color:white;">
                           <fmt:formatDate value="${picklist.p_date}" pattern="yyyy-MM-dd" />
                        </p>
                     </div>
                  </div>
                  </c:if>
               </c:forEach>
            </li>
            <li>
               <h4> 매칭 이력 </h4>
               <hr/>
               <c:forEach items="${picklist}" var="picklist">
                  <c:if test="${picklist.join_flag == 2}">
                  <div class="card text-white bg-primary mb-5" style="width: 20rem; margin:auto; display: flex;">
                     <div class="card-header"></div>
                     <div class="card-body">
                        <h4 class="card-title">
                           <a href="/party/readView?party_id=${picklist.party_id}" style="color:white;">
                              <c:out value="${picklist.party_title}" />
                           </a>
                        </h4>
                        <p class="card-text" style="color:white;">
                           <fmt:formatDate value="${picklist.p_date}" pattern="yyyy-MM-dd" />
                           <c:out value="${picklist.u_id}" />
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