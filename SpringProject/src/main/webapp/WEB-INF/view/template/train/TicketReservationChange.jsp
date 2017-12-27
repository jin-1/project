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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
				<a href="trainTicketHistory?menu=TRAIN&img=trainbg"><li style="cursor: pointer;">발권/취소(반환)</li></a>
				<a href="TicketReservationChange?menu=TRAIN&img=trainbg"><li style="background-color: #0180a3; color: white; cursor: pointer;">예약변경</li></a>
				<a href="TrainUsagehistory?menu=TRAIN&img=trainbg"><li style="cursor: pointer;">이용내역</li></a>
			</ul>
		</div>
		<div id="trainHistroyCon">
			<table>
				<tr>
					<td colspan="6" style="border-right: black 1px solid;">승차권
						예약현황</td>
					<td colspan="3">승차권 구매현황</td>
				</tr>
				<tr>
					<td>승차일</td>
					<td>열차번호</td>
					<td>출발역</td>
					<td>도착역</td>
					<td>금액</td>
					<td style="border-right: black 1px solid;">인원</td>
					<td>좌석변경</td>

				</tr>

				<%
					if (list.size() != 0) {
						for (int i = 0; i < list.size(); i++) {

							Date od = o.parse(list.get(i).getTrainDate());
							String new_date = n.format(od);
				%>
				<tr>
					<td style="font-size: 12px;"><%=new_date%></td>
					<td><%=list.get(i).getTrainCode()%></td>
					<td id="d<%=i%>"><%=list.get(i).getDepartingStation()%></td>
					<td id="a<%=i%>"><%=list.get(i).getArrivalStation()%></td>
					<td><%=list.get(i).getTrainPurchaseDTO().getInvoice()%></td>
					<td style="border-right: black 1px solid; font-size: 12px;"><%=list.get(i).getTrainPassengers()%>
					</td>
					
					<td>
					<form>
					<button  type="button" class="ticketingChangeBt"
							name="<%=list.get(i).getTrainRegCode()%>"
							style="border: white 1px solid; background-color: #0180a3; color: white; cursor: pointer;">변경</button>
				
					</form>
					</td>
				
				</tr>

				<%
					}
					} else {
				%>
				<tr>
					<td colspan="9">조회된 값이 없습니다.</td>
				</tr>

				<%
					}
				%>
			</table>
		</div>
	</div>
	<!-- /mid -->
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>