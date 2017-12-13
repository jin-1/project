<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="Model.*"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
	CustomerTicketDTO custom = (CustomerTicketDTO) request.getAttribute("custom");
	List<TrainDTO> list = (List) request.getAttribute("listTrain");
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
				<div>조회</div>
				<div style="background-color: #1a2440b0;">예약</div>
				<div style="background-color: #1a2440b0;">결제</div>
				<div style="background-color: #1a2440b0;">발권</div>
			</div>
			<hr>
		</div>
		<div id="trainList">
			<table class="ListTable">
				<thead>
					<tr>
						<th>구분</th>
						<th>열차번호</th>
						<th>열차종류</th>
						<th>출발</th>
						<th>도착</th>
						<th>예매/좌석</th>
						<th>운임요금</th>
					</tr>
				</thead>

				<tbody>
					<%
						for (int i = 0; i < list.size(); i++) {
							String time[] = list.get(i).getTime().split(",");
					%>
					<tr bgcolor="#FFFFFF"
						onMouseOver="this.style.backgroundColor='#EEF1F6'"
						onMouseOut="this.style.backgroundColor='#FFFFFF'">
						<td>직통</td>
						<td><%=list.get(i).getTrainCode()%></td>
						<td><%=list.get(i).getTrainName()%></td>
						<td><%=custom.getStartTrain()%><br><%=time[0]%></td>
						<td><%=custom.getEndTrain()%><br><%=time[1]%></td>
						<td><div class="ticketing">예매</div></td>
						<td><div class="inquire">조회</div></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>

		</div>
	</div>
	<!-- /mid -->
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>