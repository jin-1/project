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
	List<TrainRegistrationDTO> seat = (List<TrainRegistrationDTO>) request.getAttribute("seat");
	Map<Integer, List<Integer>> seatmap = new HashMap<Integer, List<Integer>>();
 	DecimalFormat dc = new DecimalFormat("###,###,###,###");
 	int sadult = 0;
 	int sold = 0;
 	int schild = 0;
 	
 	
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
				<div>예약</div>
				<div style="background-color: #1a2440b0;">결제</div>
				<div style="background-color: #1a2440b0;">발권</div>
			</div>
			<hr>

		</div>
		<div class="ReservationView">
			<div class="ReservationLeft">
				<div class="contextL">
					<p>예매/좌석</p>
					<div id="trainNumber">
						<div id="trainNumberView">
							<div id="screen">
								<ul>
									<li class="screenOff" id="screenFirst">1호차</li>
									<li class="screenOff">2호차</li>
									<li class="screenOff">3호차</li>
									<li class="screenOff">4호차</li>
									<li class="screenOff">5호차</li>
									<li class="screenOff">6호차</li>
									<li class="screenOff">7호차</li>
								</ul>
							</div>
						</div>
					</div>
					<div id="trainSeat">
						<div id="seatInfo">
							<p style="background-color: #7d424c;"></p>
							<span>선택</span>
							<p style="background-color: #406f5f;"></p>
							<span>선택가능</span>
							<p style="background-color: #8795a7;"></p>
							<span>선택불가능</span>
						</div>
						<%
							for (TrainRegistrationDTO s : seat) {

								List<Integer> seatList = new ArrayList<Integer>();
								String[] seatS = s.getSeatNum().split("_");
								int temp1=0;
								int temp2=1;
								
								for(int i = 0; i<seatS.length/2; i++)
								{	
									
									if (seatmap.containsKey(Integer.parseInt(seatS[temp1]))) {
										
											seatmap.get(Integer.parseInt(seatS[temp1])).add(Integer.parseInt(seatS[temp2]));
										
									} else {
										seatList.add(Integer.parseInt(seatS[temp2]));
										seatmap.put(Integer.parseInt(seatS[temp1]), seatList);
										System.out.println(seatmap);
									}
									temp1+=2;
									temp2+=2;
								}

							}

							for (int x = 0; x < 7; x++) {
						%>
						<div id="seatTable<%=x%>" class="seatTable">
							<table>
								<%
									int num = 1;
										int num1 = 2;
										for (int i = 0; i < 2; i++) {
								%>
								<tr>
									<%
										for (int z = 0; z < 12; z++) {

													if (i == 0) {
									%>
									<td><sapn class="SSeat" id="SSeat<%=x%>_<%=num%>"><%=num%></sapn></td>
									<%
										num += 2;
													} else {
									%>
									<td><sapn class="SSeat" id="SSeat<%=x%>_<%=num1%>"><%=num1%></sapn></td>
									<%
										num1 += 2;
													}

												}
									%>
								
								<tr>
									<%
										}
									%>
								
							</table>
							<table>
								<%
									for (int i = 0; i < 2; i++) {
								%>
								<tr>
									<%
										for (int z = 0; z < 12; z++) {

													if (i == 0) {
									%>
									<td><sapn class="SSeat" id="SSeat<%=x%>_<%=num%>"><%=num%></sapn></td>
									<%
										num += 2;
													} else {
									%>
									<td><sapn class="SSeat" id="SSeat<%=x%>_<%=num1%>"><%=num1%></sapn></td>
									<%
										num1 += 2;
													}

												}
									%>
								
								<tr>
									<%
										}
									%>
								
							</table>
						</div>
						<%
							}
						%>

					</div>
					<script type="text/javascript">
						
							<%for (int x = 0; x < 7; x++) {
				for (int i = 1; i < 48; i++) {
					if (seatmap.containsKey(x)) {
						for (int c = 0; c < seatmap.get(x).size(); c++) {
							if (seatmap.get(x).get(c).equals(i)) {%>
										$('#SSeat<%=x%>_<%=i%>').attr('class', 'NSeat');
					<%}
						}
					}
				}
			}%>
			var click=0;
			var list ="";
			$(".SSeat").on("click",function(){
				click++;
				var num = <%=Integer.parseInt(data[0])+Integer.parseInt(data[1])+Integer.parseInt(data[2])%>
				if(num<click){
					alert("인원수보다 더 클릭하면 안됩니다.");
					$('.YSeat').removeClass('YSeat').addClass('SSeat');
					click = 0;
					list ="";
				}else{
					$(this).removeClass('SSeat').addClass('YSeat');
					$(this).attr("id");
					list +=$(this).attr("id").substring(5)+"_";
					console.log(list);
				}
			});
					</script>
					<form:form action="trainPayment?menu=TRAIN&img=trainbg" method="POST">
					<div id="reservationBt">
						<input type="hidden" name="seat" id="seatNum">
						<input type="hidden" name="seat" value="<%=dc.format(sadult + sold + schild)%>">
						<p>선택좌석 예약하기</p>
					</div>
					</form:form>
			
				</div>
			</div>
			<div class="ReservationRight">
				<p style="color: white; font-size: 14px; font-weight: bold;"><%=data[3]%></p>
				<p style="color: white; font-size: 14px;">
					출발
					<%=data[4] + " " + data[5]%></p>
				<p style="color: white; font-size: 14px;">
					도착
					<%=data[4] + " " + data[6]%></p>
				<div class="seR"><%=data[7]%></div>
				<p style="color: white; margin: 3px;">▼</p>
				<div class="seR"><%=data[8]%></div>
				<div class="subResult">
					<p style="font-weight: bold;">운임내역</p>
					<span style="margin-bottom: 5px; display: inline-block;">인원</span><br>
					<span style="font-size: 13px; margin-top: 3px;">
					<% if (Integer.parseInt(data[0]) != 0) {
				 		sadult = Integer.parseInt(data[0]) * Integer.parseInt(data[9]);
				 		out.print("&nbsp;- 성인 " + data[0] + " \\"
				 				+ dc.format(Integer.parseInt(data[0]) * Integer.parseInt(data[9])) + " <br>");
				 	}
				 	if (Integer.parseInt(data[1]) != 0) {
				 		sold = (int) (Integer.parseInt(data[1]) * Integer.parseInt(data[9]) * 0.7);
				 		out.print("&nbsp;- 노인 " + data[1] + " \\"
				 				+ dc.format(Integer.parseInt(data[1]) * Integer.parseInt(data[9]) * 0.7) + " <br>");
				 	}

				 	if (Integer.parseInt(data[2]) != 0) {
				 		schild = (int) (Integer.parseInt(data[2]) * Integer.parseInt(data[9]) * 0.5);
				 		out.print(" - 어린이 " + data[2] + " \\"
				 				+ dc.format(Integer.parseInt(data[2]) * Integer.parseInt(data[9]) * 0.5) + " <br>");
				 	} %>
					</span>
					<div
						style="position: absolute; bottom: 20px; color: #0180a3; font-weight: bold; font-size: 15px; left: 10px;">
						가는편 총액 <span
							style="position: relative; left: 20px; font-size: 1.3vw;">\<%=dc.format(sadult + sold + schild)%></span>
					</div>

				</div>
				<div class="result">
					<div style="position: relative; top: 10px; left: -6px;">
						총액 <span style="position: relative; left: 20px; font-size: 1.5vw;">\<%=dc.format(sadult + sold + schild)%></span>
					</div>
				</div>
			</div>


		</div>
	</div>
	<!-- /mid -->
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>