<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="Model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	List<TrainDTO> train = (List<TrainDTO>) request.getAttribute("train");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TRENVIAJES</title>
<jsp:include page="../config.jsp" flush="false" />
<link href="./css/train.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="./scripts/trainScript.js"></script>
<style type="text/css">
#mid1 table {
	width: 80%;
	text-align: center;
	margin-top: 30px;
}

#mid1 th {
	height: 30px;
	background: #d7d7d7;
}

#mid1 td {
	height: 30px;
	border-bottom: #b6b6b6 1px solid;
}

#mid1 button {
	position: relative;
	top: 20px;
	left: 73%;
	border: #acaaaa 1px solid;
	background-color: #0180a3;
	color: white;
	width: 80px;
	height: 35px;
	border-radius: 5px;
}

.tbg {
	position: fixed;
	z-index: 10;
	width: 100%;
	height: 100%;
	background-color: #0000008a;
	display: none;
}

.tbgw {
	width: 60%;
	height: 620px;
	position: fixed;
	background: white;
	z-index: 11;
	top: 10%;
	left: 20%;
	display: none;
	border-radius: 15px;
}

.tbgw table {
	width: 60%;
	margin: auto;
	text-align: center;
}

.tbgw td {
	height: 60px;
	cursor: pointer;
}

.tbgw input {
	width: 150px;
}

.tbgw input[type=checkbox] {
	width: 30px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#trainAddA').on("click", function() {
			$('.tbg').css("display", "inline");
			$('.tbgw').css("display", "inline");
			$('.addTrain').css("display", "inline");
		});
		$('.tbg').on("click", function() {
			$('.tbg').css("display", "none");
			$('.tbgw').css("display", "none");
			$('.addTrain').css("display", "none");
			$('.trainD').css("display", "none");
		});
		$('.trTrain').on("click",function(){
			
			
			$(location).attr('href',"adminTrainD?trainCode="+$(this).attr('id'));
			
		});
	});
</script>
</head>
<body>
	<div class="tbg"></div>
	<div class="tbgw">
		<div class="addTrain" style="display:none;">
		<h3 style="text-align: center;">기차추가</h3>
		<form:form modelAttribute="trainAdd">
			<table>
				<tr>
					<td>기차코드</td>
					<td><input type="text" name="trainCode"></td>
				</tr>
				<tr>
					<td>기차이름</td>
					<td><input type="text" name="trainName"></td>
				</tr>
				<tr>
					<td>출발역</td>
					<td><input type="text" name="departingStation"></td>
				</tr>
				<tr>
					<td>도착역</td>
					<td><input type="text" name="arrivalStation"></td>
				</tr>
				<tr>
					<td>출발날짜</td>
					<td><input type="checkbox" name="temp" value="일">일 <input
						type="checkbox" name="temp" value="월">월 <input
						type="checkbox" name="temp" value="화">화 <input
						type="checkbox" name="temp" value="수">수 <input
						type="checkbox" name="temp" value="목">목 <input
						type="checkbox" name="temp" value="금">금 <input
						type="checkbox" name="temp" value="토">토</td>
				</tr>
				<tr>
					<td>출발시간</td>
					<td><input type="text" name="startTime"></td>
				</tr>
				<tr>
					<td>도착시간</td>
					<td><input type="text" name="endTime"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="number" name="trainPrice"></td>
				</tr>
			</table>
			<button style="position: relative; left: 50%;">저장</button>
		</form:form>
		</div>
		<div class="trainD" style="display:none;">
		
		</div>
	</div>
	<div id="top" style="height: 100px;">
		<div id="menubgc"></div>
		<div id="menuBg"></div>
		<div id="header">
			<div id="logo">
				<a href="/SpringProject/main"><img src="img/3-2.png" /></a>
			</div>
			<div id="menu">
				<ul>
					<li><a href="adminIndex">회원/기업</a></li>
					<li><a href="adminTrain">기차</a></li>
					<li><a href="adminRent">대여</a></li>
					<li><a href="adminTour">여행지</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div id="mid1"
		style="display: inline-block; width: 85%; height: 700px; margin-left: 280px; overflow-y: auto;">
		<button id="trainAddA">기차 추가</button>
		<table>
			<thead>
				<tr>
					<th>열차코드</th>
					<th>열차</th>
					<th>출발역</th>
					<th>도착역</th>
					<th>출발시간</th>
					<th>도착시간</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < train.size(); i++) {
				%>
				<tr class="trTrain" id="<%=train.get(i).getTrainCode()%>">
					<td><%=train.get(i).getTrainCode()%></td>
					<td><%=train.get(i).getTrainName()%></td>
					<td><%=train.get(i).getDepartingStation()%></td>
					<td><%=train.get(i).getArrivalStation()%></td>
					<td><%=train.get(i).getStartTime()%></td>
					<td><%=train.get(i).getEndTime()%></td>
					<td><%=train.get(i).getTrainPrice()%></td>
				</tr>

				<%
					}
				%>
			</tbody>

		</table>

	</div>
	<!-- /mid -->
	<div id="left"
		style="width: 12%; min-height: 900px; height: 105%; top: 100px; position: absolute; background-color: #595959;">

		<ul>
			<li style="margin-bottom: 30px; margin-top: 30px;"><a
				href="adminTrain">기차 관리</a></li>



		</ul>
	</div>
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>