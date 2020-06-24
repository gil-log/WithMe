              <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/party/party.css">
<title>Selected Party</title>
</head>
<body>

   <div id="root">

      <section id="container">
         <form role="form" method="post">
            <table class="table table-hover">
               <thead>
                  <tr>
                     <th scope="col">쪽지 상세보기</th>
                  </tr>
               </thead>
               <tbody>
                  <tr class="table-primary">
                     <th scope="row">제목</th>
                     <td>${readletter.l_title}</td>
                  </tr>
                  <tr class="table-secondary">
                     <th scope="row">내용</th>
                     <td>${readletter.l_message}</td>
                  </tr>
                  <tr class="table-success">
                     <th scope="row">날짜</th>
                     <td>${readletter.l_date}</td>
                  </tr>
               </tbody>
            </table>
         </form>
      </section>
      <!-- 답장 버튼 추가 -->
        <div style = "text-align:center;">
           <c:if test ="${readletter.send_flag==0 }">       
                <form method="get" action="/letter/letterwriteView" >
                   <input type="hidden" name = "sender_id" value = "${readletter.sender_id}"/>
                   <button type="submit" value = "답장하기" width="40" height="40">
                  </form>
               </c:if>
          </div>
      <hr />
   </div>
</body>
</html>