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
	String[] seat = request.getParameterValues("seat");
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
					<li>결제 방법은 신용카드, 계좌이체, 무통장 입금 3가지가 있습니다.</li>
					<li>결제내용을 한번더 확인해주세요.</li>
				</ul>
			</div>
			<div>
			<p>결제 정보</p>
				<table id="trainPaymentTable">
					<thead>
						<tr>
							<th style="border-top-left-radius: 15px; border: #0180a3 1px solid;">승차일자</th>
							<th>열차종류</th>
							<th>열차번호</th>
							<th>출발역</th>
							<th>도착역</th>
							<th>출발시각</th>
							<th>도착시각</th>
							<th>인원</th>
							<th style="border-top-right-radius: 15px; border: #0180a3 1px solid;">결제금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><%=data[4]%></td>
							<td><%=data[10]%></td>
							<td><%=data[3]%></td>
							<td><%=data[7]%></td>
							<td><%=data[8]%></td>
							<td><%=data[5]%></td>
							<td><%=data[6]%></td>
							<td><%=Integer.parseInt(data[0])+Integer.parseInt(data[1])+Integer.parseInt(data[2])%> 명</td>
							<td><%=seat[1]%> 원</td>
						</tr>
					</tbody>
				</table>
				
				<p>좌석 정보</p>
			  
			</div>
		</div>

	</div>
	<!-- /mid -->
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>