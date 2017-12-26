<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>MYPAGE</title>
<jsp:include page="../config.jsp" flush="false" />
<link href="./css/member.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<div style="width: 80%; margin: auto;">
			<p class="location">
				<a href="#">Home</a>><a href="#">MyPage</a>><a href="#">Budget</a>
			</p>
			<div id="Name">
				<span>예산</span>
				<hr>
			</div>
			<div id="travelName">
				
			</div>
		</div>
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>