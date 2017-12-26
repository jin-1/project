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
<script type="text/javascript">
	$(document).ready(
			function() {
				$('.ticketingBt').on(
						"click",
						function() {
							$('.tbg').css("display", "inline");
							$('.tbgB').css("display", "inline");

							$.ajax({
								url : "selectTicketing",
								dataType : "json",
								type : "post",
								data : {
									"TrainRegCode" : $(this).attr("id")
								},
								success : function(data) {

									console.log(data);

								},
								error : function(request, status, error) {
									console.log("code:" + request.status + "\n"
											+ "error:" + error);
								}

							});
						});
			});
</script>
</head>
<body>
	<div class="tbg"></div>
	<div class="tbgB">
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
						<p>승차일</p>
						<p>
							<span
								style="font-size: 25px; font-weight: bold; margin-right: 15px;">
								<%
									
								%>
							</span> <span style="margin-right: 15px;">▶</span> <span
								style="font-size: 25px; font-weight: bold;">목적지 2</span>
						</p>
						<p style="margin-top: -10px;">
							<span
								style="background-color: black; margin-right: 63px; margin-left: 5px; color: white;">시간1</span>
							<span style="background-color: black; color: white;">시간2</span>
						</p>
						<p style="font-weight: bold;">
							<span>기차 종류</span> &nbsp&nbsp&nbsp <span>기차 코드 열차</span> <span></span>
						</p>

					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="tbgC"></div>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<p class="location">
			<a href="#">Home</a>><a href="#">Mypage</a>><a href="#">TrainTicketing
				History</a>
		</p>
		<div id="trainName">
			<span>발권/취소/내역</span>
			<hr>
		</div>
		<div id="trainHistory">
			<ul>
				<li style="background-color: #0180a3; color: white;">발권/취소(반환)</li>
				<li>예약변경</li>
				<li>이용내역</li>
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
					<td>결제</td>
					<td>발권</td>
					<td>취소/반환</td>
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
					<td><%=list.get(i).getDepartingStation()%></td>
					<td><%=list.get(i).getArrivalStation()%></td>
					<td><%=list.get(i).getTrainPurchaseDTO().getInvoice()%></td>
					<td style="border-right: black 1px solid; font-size: 12px;"><%=list.get(i).getTrainPassengers()%>
					</td>
					<td>O</td>
					<td><button class="ticketingBt"
							id="<%=list.get(i).getTrainRegCode()%>"
							style="border: white 1px solid; background-color: #0180a3; color: white;">발권</button></td>
					<td><button
							style="border: white 1px solid; background-color: #e95454; color: white;">취소</button></td>
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