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
	String[] data = (String[]) session.getAttribute("trainTicket");
	TrainRegistrationDTO trd = (TrainRegistrationDTO) request.getAttribute("trDTO");
	MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
	DecimalFormat dc = new DecimalFormat("###,###,###,###");
	SimpleDateFormat o = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat n = new SimpleDateFormat("yyyy년 MM월 dd일 (E)");
	Date od = o.parse(data[4]);
	String new_date = n.format(od);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TRENVIAJES</title>
<jsp:include page="../config.jsp" flush="false" />
<script type="text/javascript" src="./scripts/trainScript.js"></script>
<link href="./css/train.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<p class="location">
			<a href="#">Home</a>><a href="#">Train</a>><a href="#">TrainTicket</a>
		</p>
		<div id="Name">
			<span>기차 예매</span>
			<div class="trainStep">
				<div style="background-color: #1a2440b0;">조회</div>
				<div style="background-color: #1a2440b0;">예약</div>
				<div style="background-color: #1a2440b0;">결제</div>
				<div>발권</div>
			</div>
			<hr>

		</div>
		<div
			style="text-align: center; width: 80%; height: 200px; margin: auto; display: table; text-align: center;">
			<div
				style="display: table-cell; vertical-align: middle; font-size: 20px;">
				<input type="image" src="img/ticket.png"
					style="width: 45px; height: 45px; position: relative; top: 18px;">
				승차권발급이 완료되었습니다.
			</div>
		</div>
		<div id="ticketingInfo">
			<table>
				<tr>
					<td
						style="width: 10%;  background-color: #f3f3f3; height: 53px; padding-left: 12px;">
						결제금액
					</td>
					<td style="width: 90%;padding-left: 12px;"><%=trd.getPrice()%></td>
				</tr>
				<tr>
					<td colspan="2" style="width: 30%;">
						<ul>
							<li>결제 완료 되었습니다.</li>
							<li>결제 된 후 하루 전에는 예매 변경이 불가능합니다.</li>
						</ul>

					</td>

				</tr>
			</table>

		</div>

	</div>
	<!-- /mid -->
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>