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
	TrainRegistrationDTO dto = (TrainRegistrationDTO) request.getAttribute("dto");
	List<TrainRegistrationDTO> seat = (List<TrainRegistrationDTO>) request.getAttribute("seat");
	System.out.println(seat);
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
				<li style="cursor: pointer;">이용내역</li>
			</ul>
		</div>
		<div id="trainChangeCon">
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
			<%String[] seat1 = dto.getTrainPassengers().split(",");%>
			$(".SSeat").on("click",function(){
				click++;
				
				var num = <%=Integer.parseInt(seat1[0])+Integer.parseInt(seat1[1])+Integer.parseInt(seat1[2])%>
				if(num<click){
					alert("인원수보다 더 클릭하면 안됩니다.");
					$('.YSeat').removeClass('YSeat').addClass('SSeat');
					click = 0;
					list ="";
				}else{
					$(this).removeClass('SSeat').addClass('YSeat');
					$(this).attr("id");
					list +=$(this).attr("id").substring(5)+"_";
					
				}
			});
					</script>
					<form:form action="trainSeatChange" method="POST" id="seatChangeForm">
						<input type="hidden" name="val" id="seatChange">
						<input type="hidden" name="val" value="<%=dto.getTrainPurchaseDTO().getTrainRegCode()%>">
					</form:form>
					<div id="seatChangeBt">
						
						<p>변경</p>
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