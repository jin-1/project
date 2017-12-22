<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="Model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
	DecimalFormat dc = new DecimalFormat("###,###,###,###");
	SimpleDateFormat o = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat n = new SimpleDateFormat("yyyy년 MM월 dd일 (E)");
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
			<a href="#">Home</a>><a href="#">Mypage</a>><a href="#">TrainTicketing History</a>
		</p>
		<div id="trainName">
			<span>기차 발권 내역</span>
			<hr>
		</div>
				<div id="ticketingView">
			<table>
				<tr>
					<td style="border: #c1c0c0 1px solid;">
						<h3>이용안내</h3>
						<ul>
							<li style="vertical-align: top;">홈티켓은 승차권에 표시된 승차자가 이용하여야
								하며, 도착역을 벗어날 때까지 소지하셔야 합니다.</li>
							<li>직원이 본인 확인을 요구할 경우 신분증을 제시하셔야 합니다.</li>
						</ul>
						<div style="text-align: center;">
							<input type="image" src="img/qrCode.png">
						</div>
					</td>
					<td style="border: black 1px solid;">
						<p>
							승차일
							</p>
						<p>
							<span
								style="font-size: 25px; font-weight: bold; margin-right: 15px;">목적지 1</span>
							<span style="margin-right: 15px;">▶</span> <span
								style="font-size: 25px; font-weight: bold;">목적지 2</span>
						</p>
						<p style="margin-top: -10px;">
							<span
								style="background-color: black; margin-right: 63px; margin-left: 5px; color: white;">시간1</span>
							<span style="background-color: black; color: white;">시간2</span>
						</p>
						<p style="font-weight: bold;">
							<span>기차 종류</span> &nbsp&nbsp&nbsp <span>기차 코드 열차</span>
							<span></span>
						</p>

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