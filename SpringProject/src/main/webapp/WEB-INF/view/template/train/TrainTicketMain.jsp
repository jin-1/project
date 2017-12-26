<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TRENVIAJES</title>
<jsp:include page="../config.jsp" flush="false" />
<script type="text/javascript" src="./scripts/trainScript.js"></script>
<link href="./css/train.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./css/calendar-style.css" />
<link rel="stylesheet" type="text/css" href="./css/pignose.calendar.min.css" />
<script type="text/javascript"
	src="./scripts/pignose.calendar.full.min.js"></script>
	<script type="text/javascript">
	
	$.ajax({
		url : "startTrain",
		dataType : "json",
		type : "post",
		data : $('#inputStrat').serializeArray(),
		success : function(data) {

			var trainLength = Object.keys(data).length;

			$.each(data, function(key, value) {
				$('.trainList ul').append('<li>' + value + '</li>');

			});

		},
		error : function(request, status, error) {
			console.log("code:" + request.status + "\n" + "error:"
					+ error);
		}

	});
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
		<div class="datebg">
			<div style="text-align: center; margin-bottom: 35px;">
				<H2>날짜를 정해주세요</H2>
			</div>
			<div class="calendar"></div>

		</div>
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
		<div class="trainTicket">

			<div class="trainWay">
				<label class="control control--radio">편도 <input type="radio"
					name="radio" checked="checked" />
					<div class="control__indicator"></div></label> <label
					class="control control--radio">왕복 <input type="radio"
					name="radio" />
					<div class="control__indicator"></div></label>
			</div>
			<hr class="style11">
			<form:form modelAttribute="CustomerTicket" autocomplete="off" id="frmTicket"
				onkeydown="return captureReturnKey(event)">
				<div class="oneWay">
					<label class="inputtext control--text"> 
						<span class="inputtext__indicator" id="stStation">출발지</span> 
						<img id="startTrain" class="pinmark" src="http://download.seaicons.com/icons/paomedia/small-n-flat/1024/map-marker-icon.png">
						<input type="text" id="inputStrat" name="startTrain">
						<span class="trainList" id="trainList1" style="display: none;">
							<ul>
							</ul>
						</span>
					</label> 
					<label class="inputtext control--text"> 
						<span class="inputtext__indicator" id="edStation">도착지</span> 
						<input	type="text" id="inputEnd" name="endTrain"> 
						<img id="endTrain" class="pinmark" src="http://download.seaicons.com/icons/paomedia/small-n-flat/1024/map-marker-icon.png">
						<span class="trainList" id="trainList2" style="display: none;">
							<ul>
							</ul>
						</span>
					</label> 
					<label class="inputtext control--text"> 
					<span id="stDate" class="inputtext__indicator">출발일</span> 
					<img class="pinmark" id="dateTrain" src="http://download.seaicons.com/icons/paomedia/small-n-flat/1024/calendar-icon.png">
						<input type="text" id="inputDate" name="dateTrain">
					</label>
				</div>
				
				
				<hr class="style3">
				<div>
					<label class="control control--checkbox">전체<input
						type="checkbox" id="allCheck" />
						<div class="control__indicator"></div>
					</label> <label class="control control--checkbox">KTX <input
						type="checkbox" checked="checked" id="KTXcheck" name="trainType"
						value="KTX" />
						<div class="control__indicator"></div>
					</label> <label class="control control--checkbox">새마을호 <input
						type="checkbox" id="smcheck" name="trainType" value="새마을호" />
						<div class="control__indicator"></div>
					</label> <label class="control control--checkbox">무궁화호 <input
						type="checkbox" id="mgcheck" name="trainType" value="무궁화호" />
						<div class="control__indicator"></div>
					</label>
				</div>
				<hr class="style3">
				<div class="num">
					<div class="adults">
						<dl>
							<dt>
								<span>성인</span>
							</dt>
							<dd>
								<button type="button" class="pm" id="adultsMin">-</button>
								<label for="m"><input class="inputpm" id="adultsVal"
									type="text" name="adults" value="0"></label>
								<button type="button" class="pm" id="adultsAdd">+</button>
							</dd>

						</dl>
					</div>
					<div class="child">
						<dl>
							<dt>
								<span>어린이</span>
							</dt>
							<dd>
								<button type="button" class="pm" id="childMin">-</button>
								<label for="m"><input class="inputpm" id="childVal"
									type="text" name="child" value="0"></label>
								<button type="button" class="pm" id="childAdd">+</button>
							</dd>

						</dl>
					</div>
					<div class="old">
						<dl>
							<dt>
								<span>노인</span>
							</dt>
							<dd>
								<button type="button" class="pm" id="oldMin">-</button>
								<label for="m"><input class="inputpm" id="oldVal"
									type="text" name="old" value="0"></label>
								<button type="button" class="pm" id="oldAdd">+</button>
							</dd>

						</dl>
					</div>
				</div>
				<div style="text-align: center; margin-top: 30px;">
					<button type="button" class="trainSearch">조회</button>
				</div>
			</form:form>
		</div>
	</div>
	<!-- /mid -->
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>