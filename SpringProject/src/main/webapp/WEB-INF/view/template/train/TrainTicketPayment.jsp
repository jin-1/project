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
	String[] seat = request.getParameterValues("seat");
	MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
	DecimalFormat dc = new DecimalFormat("###,###,###,###");
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
				<div>결제</div>
				<div style="background-color: #1a2440b0;">발권</div>
			</div>
			<hr>

		</div>
		<div id="trainPayment">
			<div id="trainPaymentInfo">
				<ul>
					<li>결제 방법은 신용카드, 계좌이체, 무통장 입금 3가지가 있습니다.</li>
					<li>결제내용을 한번더 확인해주세요.</li>
				</ul>
			</div>
			<div>
			<p>결제 정보</p>
				<table class="trainPaymentTable">
					<thead>
						<tr>
							<th style="border-top-left-radius: 15px; border: #0180a3 1px solid;">승차일자</th>
							<th>열차종류</th>
							<th>열차번호</th>
							<th>출발역</th>
							<th>도착역</th>
							<th>출발시각</th>
							<th style="border-top-right-radius: 15px; border: #0180a3 1px solid;">도착시각</th>
							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><%=data[4]%></td>
							<td><%=data[10]%></td>
							<td><%=data[3]%></td>
							<td><%=data[7]%></td>
							<td><%=data[8]%></td>
							<td><%=data[5]%></td>
							<td><%=data[6]%></td>
							
							
						</tr>
					</tbody>
				</table>
				<div>
				<p>좌석 정보</p>
				
				<table class="trainPaymentTable">
					<thead>
						<tr>
							<th style="border-top-left-radius: 15px; border: #0180a3 1px solid;">열차번호</th>
							<th>좌석 정보</th>
							<th>승객 유형</th>
							<th>운임 요금</th>
							<th style="border-top-right-radius: 15px; border: #0180a3 1px solid;">할인 금액</th>
							
						</tr>
					</thead>
					<tbody>
					<%
					String s[] = seat[0].split("_");
					String trainPassengers="성인 "+data[0]+" 노인 "+data[1]+" 어린이 "+data[2];
					List<String> person = new ArrayList<String>();
					for(int i=0 ; i<Integer.parseInt(data[0]);i++){
						person.add("성인");
					}
					for(int i=0 ; i<Integer.parseInt(data[1]);i++){
						person.add("노인");
					}
					for(int i=0 ; i<Integer.parseInt(data[2]);i++){
						person.add("어린이");
					}
					int num=0;
					int num1=1;
					
					for(int i = 0 ; i < s.length/2 ; i++){%>
					<tr>
							<td><%=data[10]%></td>
							<td><%=(Integer.parseInt(s[num])+1)+"호차 "+Integer.parseInt(s[num1])%></td>
							<td><%=person.get(i)%></td>
							<td><%if(person.get(i).equals("성인")){
								out.print(dc.format(Integer.parseInt(data[9])));

							} else if(person.get(i).equals("노인")){
								out.print(dc.format((int)(Integer.parseInt(data[9])*0.7)));
								
							} else{
								out.print(dc.format((int)(Integer.parseInt(data[9])*0.5)));
							}
							%></td>	
							<td><%if(person.get(i).equals("성인")){
								out.print(0);
							} else if(person.get(i).equals("노인")){
								out.print(dc.format((int)(Integer.parseInt(data[9])*0.3)));
							} else{
								out.print(dc.format((int)(Integer.parseInt(data[9])*0.5)));
							}
							%></td>				
						</tr>
							
							
					<%
					num+=2;
					num1+=2;}	%>
			  
						
					</tbody>
				</table>
					
			  	</div>
			  	<div>
			  	<p>결제 방법</p>
			  	<div class="paymentTypeon" style="border-top-left-radius: 15px;">
			  		신용카드
			  	</div>
			  	<div class="paymentTypeoff">
			  		계좌이체
			  	</div>
			  	<div class="paymentTypeoff" style="border-top-right-radius: 15px;">
			  		무통장 입금
			  	</div>
			  	<div class="contextPayment">
			  		<table id="contextPaymentTable">
			  			<tr>
			  				<td>카드종류</td>
			  				<td><input type="radio" name="card">개인카드 
			  					<input type="radio" name="card">법인카드 
			  				</td>
			  			</tr>
			  			<tr>
			  				<td>카드번호</td>
			  				<td><input type="text" style="width: 90px;"> -
			  					<input type="text" style="width: 90px;"> -
			  					<input type="text" style="width: 90px;"> -
			  					<input type="text" style="width: 90px;">
			  				</td>
			  			</tr>
			  			<tr>
			  				<td>유효기간</td>
			  				<td>
								<select name="m" style="width: 65px; height: 25px;">
								    <option value="월">월</option>
								    <option value="01">01</option>
								    <option value="02">02</option>
								    <option value="03">03</option>
								    <option value="04">04</option>
								    <option value="05">05</option>
								    <option value="06">06</option>
								    <option value="07">07</option>
								    <option value="08">08</option>
								    <option value="09">09</option>
								    <option value="10">10</option>
								    <option value="11">11</option>
								    <option value="12">12</option>
								</select>
								<select name="m" style="width: 65px; height: 25px;">
								    <option value="년">년</option>
								    <option value="2017">2017</option>
								    <option value="2018">2018</option>
								    <option value="2019">2019</option>
								    <option value="2020">2020</option>
								    <option value="2021">2021</option>
								    <option value="2022">2022</option>
								    <option value="2023">2023</option>
								    <option value="2024">2024</option>
								    <option value="2025">2025</option>
								    <option value="2026">2026</option>
								    <option value="2027">2027</option>
								    <option value="2028">2028</option>
								    <option value="2029">2029</option>
								</select>
							</td>
			  			</tr>
			  			<tr>
			  				<td>할부개월</td>
			  				<td>
								<select name="m" style="width: 65px; height: 25px;">
								    <option value="일시불">일시불</option>
								    <option value="2개월">2개월</option>
								    <option value="3개월">3개월</option>
								    <option value="4개월">4개월</option>
								    <option value="5개월">5개월</option>
								    <option value="6개월">6개월</option>
								    <option value="12개월">12개월</option>
								    <option value="24개월">24개월</option>
								</select>
							</td>
			  			</tr>
			  			<tr>
			  				<td>비밀번호</td>
			  				<td><input type="text" style="width: 50px;"> **<span style="color:#d73a3a;"> 앞 2자리</span></td>
			  			</tr>
			  			<tr>
			  				<td>인증번호</td>
			  				<td><input type="text" style="width: 90px;"> (주민등록번호 앞 6자리)</td>
			  			</tr>
			  		</table>
			  	</div>
			 	 	<form:form method="post" action="trainTicketing?menu=TRAIN&img=trainbg" modelAttribute="trainPayment" id="frmTicket">
					  	<input type="hidden" name="trainCode" value="<%=data[3]%>">
					  	<input type="hidden" name="seatNum" value="<%=seat[0]%>">
					  	<input type="hidden" name="memberId" value="<%=memberDTO.getMemberId()%>">
					    <input type="hidden" name="arrivalStation" value="<%=data[8]%>">
					  	<input type="hidden" name="departingStation" value="<%=data[7]%>">
					  	<input type="hidden" name="trainDate" value="<%=data[4]%>">
					  	<input type="hidden" name="trainPassengers" value="<%=trainPassengers%>">
					</form:form>
				  	<div style="width: 250px; position: relative; margin: auto;">
					  	
				  	<div id="paymentBt">결제 하기</div>
			  	<div id="paymentCBt">취소</div>
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