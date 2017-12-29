<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="Model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TRENVIAJES</title>
<jsp:include page="../config.jsp" flush="false" />
<link href="./css/train.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="./scripts/trainScript.js"></script>

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
	</div>
	<!-- /mid -->
	<div id="left"
		style="width: 12%; min-height: 900px; height: 115%; top: 100px; position: absolute; background-color: #595959;">

		<ul>
			<li style="margin-bottom: 30px; margin-top: 30px;"><a href="MemberAll">회원 정보보기</a></li>
			<li style="margin-bottom: 30px;"><a href="CoperAll">기업 정보보기</a></li>
			<li style="margin-bottom: 30px;"><a href="noticeAdmin">공지사항 등록</a></li>
			<li style="margin-bottom: 30px;"><a href="mypageIndexAdmin">1:1문의 답변</a></li>

		</ul>
	</div>
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>