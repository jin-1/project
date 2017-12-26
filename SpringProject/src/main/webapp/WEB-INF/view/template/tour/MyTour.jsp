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
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
		<div id="menuBg" style="background-image:<%=img%>;"></div>
	</div>
	
	<div id="mid">
		<center>
			<c:if test="${ empty result }">
				아직 등록한 사업이 없습니다.
			</c:if>
			
			<table cellpadding=0 cellspacing=0 border=1>						
				<c:if test="${ not empty result }">					
					<c:forEach var="my" items="${result}" varStatus="status">
						<tr>
							<td rowspan=4>
								<img alt="여행지 이미지" width=150 height=150 src="/SpringProject/img/tour/${my.localImage}">
							</td>
							<td>[${my.localCategory}]</td>
							<td>${my.localName}</td>
							<td>${my.registrationNum}</td>
							<td rowspan=4>
								<c:if test="${my.requestStatus == 0 }">대기</c:if>
								<c:if test="${my.requestStatus == 1 }">수락</c:if>
								<c:if test="${my.requestStatus == 2 }">거절</c:if>
							</td>
							<td rowspan=4>
								<c:if test="${my.requestStatus == 0 || my.requestStatus == 1}">
									<a href="ModifyMyTour?localCode=${my.localCode}">수정</a><br>
								</c:if>
								<c:if test="${my.requestStatus == 2}">
									-
								</c:if>
							</td>
						</tr>
						
						<tr>
							<td colspan=3>${my.localPhone}</td>	
						</tr>
						
						<tr>
							<td colspan=3>${my.localAddr}</td>
						</tr>
						
						<tr>
							<td colspan=3>${my.localContent}</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</center>		
	</div>
</body>
</html>