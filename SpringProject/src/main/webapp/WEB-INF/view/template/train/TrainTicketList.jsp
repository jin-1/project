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
	CustomerTicketDTO custom = (CustomerTicketDTO) request.getAttribute("custom");
	List<TrainDTO> list = (List) request.getAttribute("listTrain");

	SimpleDateFormat t = new SimpleDateFormat("yyyy-MM-dd");

	Date selectday = t.parse(custom.getDateTrain());
	Calendar cal = new GregorianCalendar(Locale.KOREA);
	cal.setTime(selectday);
	cal.add(Calendar.DAY_OF_YEAR, -3);
	String day1 = t.format(cal.getTime());
	cal.setTime(selectday);
	cal.add(Calendar.DAY_OF_YEAR, -2);
	String day2 = t.format(cal.getTime());
	cal.setTime(selectday);
	cal.add(Calendar.DAY_OF_YEAR, -1);
	String day3 = t.format(cal.getTime());
	cal.setTime(selectday);
	cal.add(Calendar.DAY_OF_YEAR, 1);
	String day4 = t.format(cal.getTime());
	cal.setTime(selectday);
	cal.add(Calendar.DAY_OF_YEAR, 2);
	String day5 = t.format(cal.getTime());
	cal.setTime(selectday);
	cal.add(Calendar.DAY_OF_YEAR, 3);
	String day6 = t.format(cal.getTime());
	
	
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

	<div class="tbgt">

		<h4><%=custom.getStartTrain()%>
			→
			<%=custom.getEndTrain()%>행 열차
			<%=custom.getAdults() + " " + custom.getChild() + " " + custom.getOld()%>
		</h4>
		<hr class="style11">
		<table>
			<thead>
				<tr>
					<th>일반</th>
					<th>어른</th>
					<th>어린이</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="adult_pay"></td>
					<td id="old_pay"></td>
					<td id="child_pay"></td>
				</tr>
			</tbody>
		</table>
	</div>
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
				<div>조회</div>
				<div style="background-color: #1a2440b0;">예약</div>
				<div style="background-color: #1a2440b0;">결제</div>
				<div style="background-color: #1a2440b0;">발권</div>
			</div>
			<hr>
		</div>
		<%String[] s; %>
		<div id="calendar">
			<div id="" class="day">
			<%s = day1.split("-");%> 
			<span class="daySpan1">
			<%=s[1]%></span>
			<span class="daySpan2">
			/</span>
			<span class="daySpan3">
			<%=s[2]%></span>
			</div>
			<div id="" class="day">
			<%s = day2.split("-");%> 
			<span class="daySpan1">
			<%=s[1]%></span>
			<span class="daySpan2">
			/</span>
			<span class="daySpan3">
			<%=s[2]%></span>
			</div>
			<div id="" class="day">
			<%s = day3.split("-");%> 
			<span class="daySpan1">
			<%=s[1]%></span>
			<span class="daySpan2">
			/</span>
			<span class="daySpan3">
			<%=s[2]%></span>
			</div>
			<div id="" class="selectday">
				<span id="selectSpan1">
				<%s = custom.getDateTrain().split("-"); 
				out.print(s[1]);%>
				</span>
				<span id="selectSpan2">
					/
				</span>
				<span id="selectSpan3"><%=s[2] %></span>
			</div>
			<div id="" class="day">
				<%s = day4.split("-");%> 
				<span class="daySpan1">
				<%=s[1]%></span>
				<span class="daySpan2">
				/</span>
				<span class="daySpan3">
				<%=s[2]%></span>
			</div>
			<div id="" class="day">
			<%s = day5.split("-");%> 
			<span class="daySpan1">
			<%=s[1]%></span>
			<span class="daySpan2">
			/</span>
			<span class="daySpan3">
			<%=s[2]%></span>
			</div>
			<div id="" class="day">
			<%s = day6.split("-");%> 
			<span class="daySpan1">
			<%=s[1]%></span>
			<span class="daySpan2">
			/</span>
			<span class="daySpan3">
			<%=s[2]%></span>
			</div>
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
						if (list.size() != 0) {
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
						<td><form:form action="Ticketing?menu=TRAIN&img=trainbg"
								method="POST" class="frm">
								<input type="hidden" value="<%=custom.getAdults()%>"
									name="data">
								<input type="hidden" value="<%=custom.getOld()%>" name="data">
								<input type="hidden" value="<%=custom.getChild()%>" name="data">
								<input type="hidden" value="<%=list.get(i).getTrainCode()%>"
									name="data">
								<input type="hidden" value="<%=custom.getDateTrain()%>"
									name="data">
								<input type="hidden" value="<%=time[0]%>" name="data">
								<input type="hidden" value="<%=time[1]%>" name="data">
								<input type="hidden" value="<%=custom.getStartTrain()%>" name="data">
								<input type="hidden" value="<%=custom.getEndTrain()%>" name="data">
								<input type="hidden" value="<%=list.get(i).getTrainPrice()%>" name="data">
								<input type="hidden" value="<%=list.get(i).getTrainName()%>" name="data">
								<input type="hidden" value="0" name="data">
								<div class="ticketing">예매</div>
							</form:form></td>
						<td><div class="inquire"
								name="<%=list.get(i).getTrainPrice()%>">조회</div></td>

					</tr>

					<%
						}
						} else {
					%>
					<tr>
						<td colspan="7">조회한 결과 값이 없습니다.</td>
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