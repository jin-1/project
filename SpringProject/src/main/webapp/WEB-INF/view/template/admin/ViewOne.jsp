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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TRENVIAJES</title>
<jsp:include page="../config.jsp" flush="false" />
<link href="./css/train.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="./scripts/trainScript.js"></script>
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

	<div id="top" style="height: 100px;">
		<div id="menubgc"></div>
		<div id="menuBg"></div>
		<div id="header">
			<div id="logo">
				<a href="/SpringProject/main"><img src="img/3-2.png" /></a>
			</div>
			<div id="menu">
				<ul>
					<li><a href="adminIndex">회원/기업</a></li>
					<li><a href="adminTrain">기차</a></li>
					<li><a href="adminRent">대여</a></li>
					<li><a href="adminTour">여행지</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div id="mid1" style="display: inline-block; width: 85%; height: 700px; margin-left: 280px; overflow-y: auto;">
	<br>
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
	<!-- /mid -->
	<div id="left"
		style="width: 12%; min-height: 900px; height: 105%; top: 100px; position: absolute; background-color: #595959;">
		<ul>
			<li style="margin-bottom: 30px; margin-top: 30px;"><a href="adminTour">사업 요청 상태 보기</a></li>
			<li><a href="ViewAdd">사업 등록 하기</a></li>

		</ul>
	</div>
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>