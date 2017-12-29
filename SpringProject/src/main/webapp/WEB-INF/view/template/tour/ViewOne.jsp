<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="Model.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String menu = "../top.jsp?menu=TOUR info";
	String img = "url(img/tour.jpg)";
	TourDTO list = (TourDTO) request.getAttribute("result");
	String login = (String)request.getAttribute("login");
	String[] addr = list.getLocalAddr().split("/");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>TRENVIAJES</title>
<jsp:include page="../config.jsp" flush="false" />
<script>
	$(document).ready(function(){
		$('.viewModify').on('click',function(){
			var flag = true;
			
			var location1 = $('.wedo').val();
			var location2 = $('.kyungdo').val();
			
			if(location1 == '' | location1 == null){
				alert("위도를 입력하세요.");
				$('.wedo').focus();
				flag = false;
			} else if(location2 == '' | location2 == null){
				alert("경도를 입력하세요.");
				$('.kyungdo').focus();
				flag = false;
			} else if(flag == true){
				$('.location3').val($('.wedo').val() + "/" + $('.kyungdo').val());
				$('.form').submit();
			}
		});
	});
</script>
</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
		<div id="menuBg" style="background-image:<%=img%>;"></div>
	</div>

	<div id="mid">
		<input type="hidden" name="localCode" value="<%= request.getParameter("localCode") %>">
		<center>
			<form:form method="post" class="form" modelAttribute="viewOne" autocomplete="off">
				<table border=1>
					<tr>
						<td rowspan=4><img alt="사진1" width=400 height=400
							src="/SpringProject/img/tour/<%=list.getLocalImage()%>">
						</td>
						<td><%=list.getCorpId()%></td>
						<td>[<%=list.getLocalCategory()%>] <%=list.getLocalName()%></td>
					</tr>
					<tr>
						<td colspan=2><%=list.getLocalPhone()%></td>
					</tr>
					<tr>
						<td colspan=2>(<%= addr[0] %>) <%=addr[1] + " " + addr[2]%></td>
					</tr>
					<tr>
						<td colspan=2><%=list.getLocalContent()%></td>
					</tr>
				</table>
				<p></p>
<%
				if(list.getTravelCoord() != null){
					String[] location = list.getTravelCoord().split("/");
%>
					위도 <%= location[0] %> / 경도 <%= location[1] %><br>
<%
				} else{
%>
					등록된 위도, 경도가 없습니다.<br>
<%
				}
%>
				위도<input type="text" class="wedo" size=20 value="">&nbsp;&nbsp;&nbsp;경도<input type="text" class="kyungdo" size="20">
				<input type="hidden" name="travelCoord" class="location3"><br>
				요청상태
				<input type="radio" name="requestStatus" value="0">대기
				<input type="radio" name="requestStatus" value="1">수락
				<input type="radio" name="requestStatus" value="2">거절<br>
			</form:form>
			<br><br>
			<input type="button" value="수정" class="viewModify">&nbsp;&nbsp;<input type="button" value="취소" onclick="history.go(-1);">
		</center>
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>