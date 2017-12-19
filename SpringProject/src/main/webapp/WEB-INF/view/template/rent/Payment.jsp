<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.*, java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=RENT";
	String img = "url(img/rentWallpaper.jpg)";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TRENVIAJES</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./scripts/script.js"></script>
<style>
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
li {
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
.pinmark {
	width: 20px;
	height: 20px;
	position: absolute;
	right: 3px;
	top: 10px;
}
</style>


</head>
<body>
	<div id="top">
			<jsp:include page="<%=menu%>" flush="false" />
			<div id="menuBg" style="background-image:<%=img%>;"></div>
	</div>
	<div id="mid">
		<div class="container">
			<div id="nav-critical">
				<div id="process">
					<span id="current_page">장 바 구 니</span>
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
				<form>
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
							<input type="text" id="inputDate" name="dateTrain">
						</label>
						
					</div>
				
				</form>
			</div>
		</div>
	</div>

</body>
</html>