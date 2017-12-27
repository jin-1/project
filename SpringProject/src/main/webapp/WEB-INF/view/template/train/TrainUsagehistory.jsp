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
	MemberDTO memberdto = (MemberDTO) session.getAttribute("login");
	Map<Integer, List<Integer>> seatmap = new HashMap<Integer, List<Integer>>();
	List<TrainRegistrationDTO> list = (List<TrainRegistrationDTO>) request.getAttribute("list");
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TRENVIAJES</title>
<jsp:include page="../config.jsp" flush="false" />
<link href="./css/train.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="./scripts/trainScript.js"></script>

</head>
<body>

	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<p class="location">
			<a href="#">Home</a>><a href="#">Mypage</a>><a href="#">TicketReservationChange</a>
		</p>
		<div id="trainName">
			<span>발권/취소/내역</span>
			<hr>
		</div>
		<div id="trainHistory">
			<ul>
				<a href="trainTicketHistory?menu=TRAIN&img=trainbg"><li
					style="cursor: pointer;">발권/취소(반환)</li></a>
				<a href="TicketReservationChange?menu=TRAIN&img=trainbg"><li
					style="cursor: pointer;">예약변경</li></a>
				<a href="TrainUsagehistory?menu=TRAIN&img=trainbg"><li
					style="background-color: #0180a3; color: white; cursor: pointer;">이용내역</li></a>
			</ul>
		</div>
		<div id="TrainUsagehistoryCon">
			<table>
				<tr>
					<td
						style="width: 20%; height: 50px; text-align: center; background-color: #f1f0f0; border: #bfbbbb 0.4px solid;">승차
						일자</td>
					<td style="border: #bfbbbb 0.4px solid;"><input type="date"
						id="useDate1" name="date1"
						style="height: 30px; margin-left: 30px;"> <span
						style="margin-left: 30px;">~</span> <input type="date"
						id="useDate2" name="date2"
						style="height: 30px; margin-left: 30px;"></td>
				</tr>
			</table>
			<div id="usSerch">검색</div>


			<table style="margin-top: 100px;">
				<thead>
					<tr>
						<th>승차일</th>
						<th>열차번호</th>
						<th>출발역</th>
						<th>도착역</th>
						<th>금액</th>
						<th>발권상태</th>
					</tr>
				<thead>
				<tbody id="useTr">
					<tr>
					</tr>
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