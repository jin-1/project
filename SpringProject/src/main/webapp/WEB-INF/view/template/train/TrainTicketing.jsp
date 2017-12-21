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
				<div style="background-color: #1a2440b0;">결제</div>
				<div>발권</div>
			</div>
			<hr>

		</div>
		<div> 발권되었습니다. </div>
		<div id="ticketingView">
			<table>
				<tr>
					<td>
					<h3>이용안내</h3>
					<ul>
						<li>홈티켓은 승차권에 표시된 승차자가 이용하여야 하며, 도착역을 벗어날 때까지 소지하셔야 합니다.</li>
						<li>직원이 본인 확인을 요구할 경우 신분증을 제시하셔야 합니다.</li>
					</ul>
					</td>
					<td><p>승차일 <%=new_date%></p>	
						<p><%=data[7] %> ▶ <%=data[8] %></p>
						<p><%=data[5]%><%=data[6]%></p>
						<p><%=data[10]%> <%=data[3]%> </p>
					
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