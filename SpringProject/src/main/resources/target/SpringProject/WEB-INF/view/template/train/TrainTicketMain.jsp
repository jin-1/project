<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TRENVIAJES</title>
<link href="css/styles.css?ver=2" rel="stylesheet" type="text/css">
<jsp:include page="../config.jsp" flush="false" />
</head>
<body>
	<div class="tbg"></div>
	<div class="tbgw">
		<div></div>
	</div>

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
			<div class="oneWay">
				<label class="inputtext control--text"> <span
					class="inputtext__indicator">출발지</span> 
					<img id="startTrain" class="pinmark"
					src="http://download.seaicons.com/icons/paomedia/small-n-flat/1024/map-marker-icon.png">
					<input type="text" id="inputStrat" name="startTrain"></label> <label
					class="inputtext control--text"> <span
					class="inputtext__indicator">도착지</span> <input type="text"
					name="text"> <img id="endTrain" class="pinmark"
					src="http://download.seaicons.com/icons/paomedia/small-n-flat/1024/map-marker-icon.png">
				</label> <label class="inputtext control--text"> <span
					class="inputtext__indicator">출발일</span> <img class="pinmark" id="dateTrain"
					src="http://download.seaicons.com/icons/paomedia/small-n-flat/1024/calendar-icon.png">
					<input type="text" name="text">
				</label>
			</div>
			<div class="trainList">
				<ul>
					<li>dd</li>
					<li>dd</li>
					<li>dd</li>
					<li>dd</li>
					<li>dd</li>
					<li>dd</li>
					<li>dd</li>
				</ul>
			</div>
			<hr class="style3">
			<div>
				<label class="control control--checkbox">전체<input
					type="checkbox" />
					<div class="control__indicator"></div>
				</label> <label class="control control--checkbox">KTX <input
					type="checkbox" checked="checked" />
					<div class="control__indicator"></div>
				</label> <label class="control control--checkbox">새마을호 <input
					type="checkbox" />
					<div class="control__indicator"></div>
				</label> <label class="control control--checkbox">무궁화호 <input
					type="checkbox" />
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
							<button class="pm">-</button>
							<label for="m"><input class="inputpm" type="text"
								name="m" value="0"></label>
							<button class="pm">+</button>
						</dd>

					</dl>
				</div>
				<div class="child">
					<dl>
						<dt>
							<span>어린이</span>
						</dt>
						<dd>
							<button class="pm">-</button>
							<label for="m"><input class="inputpm" type="text"
								name="m" value="0"></label>
							<button class="pm">+</button>
						</dd>

					</dl>
				</div>
				<div class="old">
					<dl>
						<dt>
							<span>노인</span>
						</dt>
						<dd>
							<button class="pm">-</button>
							<label for="m"><input class="inputpm" type="text"
								name="m" value="0"></label>
							<button class="pm">+</button>
						</dd>

					</dl>
				</div>
			</div>
			<div style="text-align: center; margin-top: 30px;">
				<button class="trainSearch">검색</button>
			</div>
		</div>
	</div>
	<!-- /mid -->
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>