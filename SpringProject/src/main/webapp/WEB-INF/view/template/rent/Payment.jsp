<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.*, java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=RENT";
	String img = "url(img/rent.jpg)";
%>
<%
	ArrayList<CartDTO> cartList = (ArrayList<CartDTO>)session.getAttribute("cartList");
	int totalMoney = (Integer)request.getAttribute("totalMoney");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TRENVIAJES</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./scripts/script.js"></script>
<jsp:include page="../config.jsp" flush="false" />
<style>
#mid {
	width:60%;
	height: auto;
	postion:relative;
	margin-left: 20%;
}
div {
	display: block;
} 
#nav-critical {
	padding-top: 90px;
	display: table;
	margin: 0 auto;
}
#process{
	height: 100px;
	width:900px;
	border-radius:5px;
	position: relative;
	border-bottom: 4px solid #444;
}
#current_page {
	float:left;
	width:200px;
	font-size: 35px;
}
#step_list{
	float: right;
	padding-right: 10px; 
}
#step_list li {
	display:list-item;
	list-style: none;
	float:left;
	width: 160px;
	padding-left:10px;
	text-align: center;
	height: 100px;
	font-size: 18px;
}
#circle {
	position:relative;
	float:left;
	background-color: #C3DDD6;
	margin:3px auto;
	width: 40px;
	height: 40px;
	border-radius: 20px;
}
#current_circle {
	float:left;
	position:relative;
	background-color: #5BA1B0;
	margin:3px auto;
	width: 40px;
	height: 40px;
	border-radius: 20px;
}
#circle_level {
	position: absolute;
	top:50%;
	left:50%;
	transform: translate(-50%, -50%);
	color: #fff;	
}
#step_list span {
	width:95px;
	height: 32px;
	display: inline-block;
	vertical-align:top;
}

#calcTotalField {
	margin-top: 120px;
	position: relative;
	border-top: 2px solid #92ced9;
	border-bottom: 2px solid #92ced9;
	background: #f9fdfe;
	color: #666;
	border-collapse: collapse;
	height: 120px;
	width: 900px;
}

#calcPriceArea {
	width: 180px;
	padding-left: 40px;
	display: inline;
	float: left;
	text-align: left;
}

#priceLabel, #eventLabel, #fixedPriceLabel  {
	display: block;
	height: 30px;
	margin-top: 38px;
}

#calcPrice{
	display: block;
	color: black;
	line-height: 17px;
	margin-bottom: 38px;
	font-size: .8em;
	vertical-align: top;
}

em #getTotal {		
	font-size: 18px;
	vertical-align: top;
	font-weight: bold;
}

#subSymbolField, #equalSymbolField{
	display: inline;
	float: left;
	width: 50px;
	text-align: left;
}

#minusSymbol, #equalSymbol  {
	width: 25px;
	height: 4px;
	margin-top: 56px;
	vertical-align: top;
	font-size: 40px;
	display:inline-block;
}

#applyEventArea {
	display: inline;
	float: left;
	width: 180px;
	text-align: left;
}


#getDiscount {
	display: block;
	color: #00aac4;
	line-height: 17px;
	margin-bottom: 38px;
	font-size: .8em;
	vertical-align: top;
	font-size: 18px;
	font-weight: bold;
}

#fixedPriceArea {
	width: 180px;
	padding-right: 40px;
	display: inline;
	float: right;
	text-align: left;
}

#fixedPrice {
	display: block;
	color: #f14f4f;
	line-height: 17px;
	margin-bottom: 38px;
	font-size: .8em;
	vertical-align: top;
}

em #fixedTotal {
	font-size: 36px;
	vertical-align: top;
	font-weight: bold;
}


#trainList1 {
	min-height: 50px;
	max-height: 150px;
	width: 252px;
	top: 40px;
	position: absolute;
	background-color: white;
	z-index: 9;
	box-shadow: 0px 3px 8px #888888;
	overflow-x: hidden;
	overflow-y: auto;
}

#trainList2 {
	min-height: 50px;
	max-height: 150px;
	width: 252px;
	top: 40px;
	position: absolute;
	background-color: white;
	z-index: 9;
	box-shadow: 0px 3px 8px #888888;
	overflow-x: hidden;
	overflow-y: auto;
}
.inputtext {
	position: relative;
	display: inline-block;
	cursor: pointer;
	width: 250px;
	height: 40px;
	border: #b3b3b3 1px solid;
	padding: 0;
	margin: 0;
}

.inputtext input {
	position: absolute;
	z-index: -1;
	opacity: 0;
	top: 5px;
	left: 3px;
	width: 210px;
	height: 25px;
}

.inputtext__indicator {
	position: absolute;
	top: 10px;
	font-size: 15px;
	font-weight: bold;
	left: 5px;
	color: #333537d6;
}

.inputtext input:focus {
	z-index: 1;
	opacity: 100;
}
.pinmark {
	width: 20px;
	height: 20px;
	position: absolute;
	right: 3px;
	top: 10px;
}
</style>
<script type="text/javascript">
$(function() {
	function onClickHandler(date, obj) {
		var calendar = obj.calendar;
		var text = '';

		if (date[0] !== null) {
			var now = new Date();
			var select = new Date(date[0]);
			console.log(select);
			if (now.getTime() < select.getTime()) {
				text += date[0].format('YYYY-MM-DD');
				$('#stDate').text(text);
				$('#inputDate').val(text);
				$('.tbg').css("display", "none");
				$('.tbgw').css("display", "none");
			} else {
				alert("오늘보다 이전날을 고를 수 없습니다.");
			}
		}
		if (date[0] !== null && date[1] !== null) {
			text += ' ~ ';
		} else if (date[0] === null && date[1] == null) {
			text += 'nothing';
		}
		if (date[1] !== null) {
			text += date[1].format('YYYY-MM-DD');
		}
	}
	function onClickHandler_1(date, obj) {
		var calendar = obj.calendar;
		var text = '';

		if (date[0] !== null) {
			var now = new Date();
			var select = new Date(date[0]);
			console.log(select);
			if (now.getTime() < select.getTime()) {
				text += date[0].format('YYYY-MM-DD');
				$('#stDate_1').text(text);
				$('#inputDate_1').val(text);
				$('.tbg').css("display", "none");
				$('.tbgw').css("display", "none");
			} else {
				alert("오늘보다 이전날을 고를 수 없습니다.");
			}
		}

		if (date[0] !== null && date[1] !== null) {
			text += ' ~ ';
		} else if (date[0] === null && date[1] == null) {
			text += 'nothing';
		}

		if (date[1] !== null) {
			text += date[1].format('YYYY-MM-DD');
		}
	}
	// Default Calendar
	$('.calendar').pignoseCalendar({
		select : onClickHandler
	});
	$('.calendar_1').pignoseCalendar({
		select : onClickHandler_1
	});
});


$(document).ready(
		$('.tbg').click(function() {
			$('.tbg').css('display', 'none');
			$('.tbgw').css('display', 'none');
			$('.stbg').css('display', 'none');
			$('.edbg').css('display', 'none');
			$('.datebg').css('display', 'none');
			$('.datebg_1').css('display', 'none');
		});
		$('#startTrain').click(function() {
			$('.tbg').css('display', 'inline');
			$('.tbgw').css('display', 'inline');
			$('.stbg').css('display', 'inline');
			$('.edbg').css('display', 'none');
			$('.datebg').css('display', 'none');
			$('.datebg_1').css('display', 'none');
		});
		$('#endTrain').click(function() {
			$('.tbg').css('display', 'inline');
			$('.tbgw').css('display', 'inline');
			$('.stbg').css('display', 'none');
			$('.edbg').css('display', 'inline');
			$('.datebg').css('display', 'none');
			$('.datebg_1').css('display', 'none');
		});
		$('#dateTrain').click(function() {
			$('.tbg').css('display', 'inline');
			$('.tbgw').css('display', 'inline');
			$('.stbg').css('display', 'none');
			$('.edbg').css('display', 'none');
			$('.datebg').css('display', 'inline');
			$('.datebg_1').css('display', 'none');
		});
		$('#dateTrain_1').click(function() {
			$('.tbg').css('display', 'inline');
			$('.tbgw').css('display', 'inline');
			$('.stbg').css('display', 'none');
			$('.edbg').css('display', 'none');
			$('.datebg').css('display', 'none');
			$('.datebg_1').css('display', 'inline');
		});		
)

</script>
<script type="text/javascript">
	function placeOrder(){
	 	document.getElementById('frm').submit(); 
	}
	
</script>
</head>
<body>
	<div class="tbg"></div>
	<div class="tbgw">
		<div class="stbg">
			<div style="text-align: center;">
				<H2>도시를 지정해주세요</H2>
			</div>
			<div class="stbg_1">
				<ul>
					<li>전체</li>
					<li>가</li>
					<li>나</li>
					<li>다</li>
					<li>라</li>
					<li>마</li>
					<li>바</li>
					<li>사</li>
					<li>아</li>
					<li>자</li>
					<li>차</li>
					<li>카</li>
					<li>타</li>
					<li>파</li>
					<li>하</li>
				</ul>
			</div>
			<div class="trainList" id="trainList3">
				<ul>
				</ul>
			</div>
		</div>
		<div class="datebg">
			<div style="text-align: center; margin-bottom: 35px;">
				<H2>날짜를 정해주세요</H2>
			</div>
			<div class="calendar"></div>

		</div>

		<div class="edbg">
			<div style="text-align: center;">
				<H2>도시를 지정해주세요</H2>
			</div>
			<div class="stbg_1">
				<ul>
					<li>전체</li>
					<li>가</li>
					<li>나</li>
					<li>다</li>
					<li>라</li>
					<li>마</li>
					<li>바</li>
					<li>사</li>
					<li>아</li>
					<li>자</li>
					<li>차</li>
					<li>카</li>
					<li>타</li>
					<li>파</li>
					<li>하</li>
				</ul>
			</div>
			<div class="trainList" id="trainList4">
				<ul>
				</ul>
			</div>
		</div>
				<div class="datebg_1">
		<div style="text-align: center; margin-bottom: 35px;">
				<H2>날짜를 정해주세요</H2>
			</div>
			<div class="calendar_1"></div>

		</div>
		
	</div>
	
	<div id="top">
			<jsp:include page="<%=menu%>" flush="false" />
			<div id="menuBg" style="background-image:<%=img%>;"></div>
	</div>
	<div id="mid">
		<div class="container">
			<div id="nav-critical">
				<div id="process">
					<span id="current_page">주문/결제</span>
					<ul id="step_list">
						<li>
							<div id="circle">
								<div id="circle_level">1</div>
							</div>
							<span>장바구니</span>
						</li>
						<li>
							<div id="current_circle">
								<div id="circle_level">2</div>
							</div>
							<span>주문/결제</span>
						</li>
						<li>
							<div id="circle">
								<div id="circle_level">3</div>
							</div>
							<span>결제완료</span>
						</li>
					</ul>
				</div>
				
				<div id="calcTotalField">
					<p id="calcPriceArea">
						<span id="priceLabel">총 주문 금액</span>
						<span id="calcPrice"><em id="getTotal"><%= totalMoney %></em>원</span>
					</p>
					<span id="subSymbolField">
						<span id="minusSymbol">-</span>
					</span>
					<p id="applyEventArea">
						<span id="eventLabel">할인 적용가</span>
						<span id="getDiscount">aa</span>
					</p>
					<span id="equalSymbolField">
						<span id="equalSymbol">=</span>
					</span>
					<p id="fixedPriceArea">
						<span id="fixedPriceLabel">최종 결제 금액</span>
						<span id="fixedPrice"><em id="fixedTotal"><%= totalMoney %></em>원</span>
					</p>
				</div>
<br/>
				<form action="PaymentComplete" name="frm" method="post" id="frm">
					<div id="pickup_field">
						<label>픽업 역</label>
						<label class="inputtext control--text"> 
							<span class="inputtext__indicator" id="stStation">출발지</span> 
							<img id="startTrain" class="pinmark" src="http://download.seaicons.com/icons/paomedia/small-n-flat/1024/map-marker-icon.png">
							<input type="text" id="inputStrat" name="startTrain">
							<span class="trainList" id="trainList1" style="display: none;">
								<ul>
								</ul>
							</span>
						</label> 
						<br/>
						<label>픽업 날짜</label>
						<label class="inputtext control--text"> 
							<span id="stDate" class="inputtext__indicator">출발일</span> 
							<img class="pinmark" id="dateTrain" src="http://download.seaicons.com/icons/paomedia/small-n-flat/1024/calendar-icon.png">
							<input type="text" id="inputDate" name="dateTrain_2">
						</label>
						
					</div>
	
				<%
					int num=1;
					String prdCode = "";
					for(int i=0; i<cartList.size(); i++){
						prdCode += cartList.get(i).getPrdCode();
					}
					if(prdCode.indexOf("B") != -1){
				%>					
					<div id="return_field">
						<label>반납 역</label>
						<label class="inputtext control--text"> 
							<span class="inputtext__indicator" id="edStation">도착지</span> 
							<input	type="text" id="inputEnd" name="endTrain"> 
							<img id="endTrain" class="pinmark" src="http://download.seaicons.com/icons/paomedia/small-n-flat/1024/map-marker-icon.png">
							<span class="trainList" id="trainList2" style="display: none;">
								<ul>
								</ul>
							</span>
						</label> 
						<br/>
						<label>반납 날짜</label>
						<label class="inputtext control--text"> 
							<span id="stDate_1" class="inputtext__indicator">출발일</span> 
							<img class="pinmark" id="dateTrain_1" src="http://download.seaicons.com/icons/paomedia/small-n-flat/1024/calendar-icon.png">
							<input type="text" id="inputDate_1" name="dateTrain_1">
						</label>
						
					</div>
					
				<%
					}
				%>
					
						



					

				
			
		
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
                       <td><input type="text" name="cardO" style="width: 90px;"> -
                          <input type="text" name="cardS" style="width: 90px;"> -
                          <input type="text" name="cardT" style="width: 90px;"> -
                          <input type="text" name="cardF" style="width: 90px;">
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
                          <div style="width: 250px; position: relative; margin: auto;">
                    
                 <div id="paymentBt">결제 하기</div>
              <div id="paymentCBt">취소</div>
              </div>
              
         </div>
         </div>
        <div id="payment">
        	<input type="hidden" name="fixedTotal1" value="<%= totalMoney %>">
								<button id="btnPayment" onclick="javascript:placeOrder()">결제완료</button>
								<button id="goBack" onclick="window.history.go(-1); return false;">뒤로</button>
							
						</div>
					</form>
         </div>
	
	</div>

</body>
</html>