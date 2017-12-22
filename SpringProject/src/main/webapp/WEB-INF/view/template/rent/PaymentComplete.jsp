<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.*, java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=RENT";
	String img = "url(img/rent.jpg)";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="top">
			<jsp:include page="<%=menu%>" flush="false" />
			<div id="menuBg" style="background-image:<%=img%>;"></div>
	</div>
	<div id="mid">
		<div class="container">
			<div id="nav-critical">
				<div id="process">
					<span id="current_page">주문/결제</span>
					<ul id="step_list">
						<li>
							<div id="circle">
								<div id="circle_level">1</div>
							</div>
							<span>장바구니</span>
						</li>
						<li>
							<div id="current_circle">
								<div id="circle_level">2</div>
							</div>
							<span>주문/결제</span>
						</li>
						<li>
							<div id="circle">
								<div id="circle_level">3</div>
							</div>
							<span>결제완료</span>
						</li>
					</ul>
				</div>
				
				
				
				결제완료다!굿 잡!
			</div>
	</div>
</body>
</html>