<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
	 	<title>게시판</title>
	</head>
	<body>
	
		<div id="root">
			<header>
				<h1> PlanMatching</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form role="form" method="post" action="/party/write">
					<table>
						<tbody>
						<c:if test="${user.u_id != null}">
				
							<tr>
							
							
								<td>
									<label for="party_title">제목</label><input type="text" id="party_title" name="party_title" />
								</td>
							</tr>						
						
							<tr>
								<td>
									<label for="p_date">날짜</label><input type="date" id="p_date" name="p_date" />
								</td>
							</tr>
						
							<tr>
								<td>
									<label for="p_location">지역</label><textarea id="p_location" name="p_location" ></textarea>
								</td>
							</tr>
							
						
							<tr>
								<td>
									<label for="p_long">위도</label><input type="text" id="p_long" name="p_long" />
								</td>
							</tr>
							
						
							<tr>
								<td>
									<label for="p_lati">경도</label><input type="text" id="p_lati" name="p_lati" />
								</td>
							</tr>
							
						
							<tr>
								<td>
									<label for="p_num">인원수</label><input type="number" id="p_num" name="p_num" />
								</td>
							</tr>
							
						
							<tr>
								<td>
									<label for="p_gender">성별제한</label>
									<select name = "p_gender">
									<option selected>N</option>
									<option>M</option>
									<option>W</option>
									</select>
								</td>
							</tr>
							
						
							<tr>
								<td>
									<label for="p_cost">예상비용</label><input type="number" id="p_cost" name="p_cost" />
								</td>
							</tr>
							
						
							<tr>
								<td>
									<label for="p_note">파티내용</label><textarea id="p_note" name="p_note" ></textarea>
								</td>
							</tr>
							
						
							<tr>
								<td>
									<label for="hashtag">해시태그</label>
									<select name = "hashtag">
									<option selected>#먹방</option>
									<option>#여행</option>
									<option>#탐험</option>
									<option>#번개</option>
									<option>#힐링</option>
									<option>#사진</option>
									<option>#오락</option>
									<option>#간술</option>
									</select>
								</td>
							</tr>
							
							
							
							<tr>
								<td>						
									<button type="submit">작성</button>
								</td>
							</tr>
							</c:if>
							<c:if test="${user.u_id == null}">
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