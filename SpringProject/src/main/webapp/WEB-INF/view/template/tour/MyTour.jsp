<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="Model.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("utf-8"); 
	String menu = "../top.jsp?menu=my TOUR";
	String img = "url(img/tour.jpg)";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>TRENVIAJES</title>
<jsp:include page="../config.jsp" flush="false" />
</head>
<style>
.viewTable{
	width: 80%;
	heigh: 80%;
}
.viewTable th{
	background-color: lightgrey;
}
</style>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
		<div id="menuBg" style="background-image:<%=img%>;"></div>
	</div>
	
	<div id="mid">
		<p></p>
		<br>
		<center>
			<c:if test="${ empty result }">
				아직 등록한 사업이 없습니다.
			</c:if>
			
			<c:if test="${ not empty result }">		
				<table cellpadding=0 cellspacing=0 border=1 class="viewTable">							
					<c:forEach var="my" items="${result}" varStatus="status">
						<tr>
							<td rowspan=4>
								<center>
									<b>[${my.localCategory}]</b><br><br>
									<img alt="여행지 이미지" width=150 height=150 src="/SpringProject/img/tour/${my.localImage}">
									<h4>${my.localName}</h4>
								</center>
							</td>
							<th>사업자등록번호</th>
							<td>${my.registrationNum}</td>
							<td rowspan=4>
								<center>
									<c:if test="${my.requestStatus == 0 }">대기</c:if>
									<c:if test="${my.requestStatus == 1 }">수락</c:if>
									<c:if test="${my.requestStatus == 2 }">거절</c:if>
								</center>
							</td>
							<td rowspan=4>
								<c:if test="${my.requestStatus == 0 || my.requestStatus == 1}">
									<center><a href="ModifyMyTour?localCode=${my.localCode}">수정</a></center>
								</c:if>
								<c:if test="${my.requestStatus == 2}">
									<center>-</center>
								</c:if>
							</td>
						</tr>
						
						<tr>
							<th>전화번호</th>
							<td>${my.localPhone}</td>	
						</tr>
						
						<tr>
							<th>주소</th>
							<td>${my.localAddr}</td>
						</tr>
						
						<tr>
							<th>내용</th>
							<td>${my.localContent}</td>
						</tr>
						<tr><td colspan=5><p></p></td></tr>
					</c:forEach>
				</table>
			</c:if>
		</center>		
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>