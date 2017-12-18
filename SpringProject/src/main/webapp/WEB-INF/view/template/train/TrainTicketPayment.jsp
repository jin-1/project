<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
	String[] data = (String[])session.getAttribute("trainTicket");
	String seat = request.getParameter("seat");
	MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TRENVIAJES</title>
<jsp:include page="../config.jsp" flush="false" />

</head>
<body>

	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<p class="location">
			<a href="#">Home</a>><a href="#">Train</a>><a href="#">TrainTicket</a>
		</p>
		<div id="trainName">
			<span>기차 예매</span>
			<div class="trainStep">
				<div style="background-color: #1a2440b0;">조회</div>
				<div style="background-color: #1a2440b0;">예약</div>
				<div>결제</div>
				<div style="background-color: #1a2440b0;">발권</div>
			</div>
			<hr>

		</div>
		<div id="trainPayment">
			<div id="trainPaymentInfo">
				<ul>
					<li>결제 방법은 신용카드, 계좌이체, 핸드폰 결제 3가지가 있습니다.</li>
					<li>결제내용을 한번더 확인해주세요.</li>
				</ul>
			</div>
		
		</div>

	</div>
	<!-- /mid -->
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>