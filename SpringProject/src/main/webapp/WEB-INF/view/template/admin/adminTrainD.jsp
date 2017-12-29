<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="Model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	List<TrainStationTimeDTO> time = null;
	String trainCode= request.getParameter("trainCode");
	if (request.getAttribute("time") != null) {
		time = (List<TrainStationTimeDTO>) request.getAttribute("time");
	}
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
	$(document).ready(
			function() {
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
				$('.trTrain').on("click", function() {
					$(location).attr('href', "")

				});

				$.ajax({
					url : "startTrain",
					dataType : "json",
					type : "post",
					data : $('#inputStrat').serializeArray(),
					success : function(data) {

						var trainLength = Object.keys(data).length;

						$.each(data,
								function(key, value) {
									$('.trainList ul').append(
											'<li>' + value + '</li>');

								});

					},
					error : function(request, status, error) {
						console.log("code:" + request.status + "\n" + "error:"
								+ error);
					}

				});
			});
</script>
</head>
<body>
	<div class="tbg"></div>
	<div class="tbgw">
		<h3 style="text-align: center;">시간 추가</h3>

		<form:form modelAttribute="timeAdd">
		<input type="hidden" name="trainCode" value="<%=trainCode%>">
			<table>
				<tr>
					<td>지역</td>
					<td><label class="inputtext control--text"> <span
							class="inputtext__indicator" id="stStation">출발지</span> <img
							id="startTrain" class="pinmark"
							src="http://download.seaicons.com/icons/paomedia/small-n-flat/1024/map-marker-icon.png">
							<input type="text" id="inputStrat" name="startTrain"> <span
							class="trainList" id="trainList1" style="display: none;">
								<ul>
								</ul>
						</span>
					</label></td>
				</tr>
				<tr>
					<td>시간</td>
					<td><input type="text" name="time"></td>
				</tr>
			</table>
			<button style="position: relative; left: 50%;">저장</button>
		</form:form>


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

					<th>시간</th>
					<th>역이름</th>

				</tr>
			</thead>
			<tbody>
				<%
					if (time != null) {
						for (int i = 0; i < time.size(); i++) {
				%>
				<tr class="trTrain" id="<%=time.get(i).getTrainCode()%>">
					<td><%=time.get(i).getTime()%></td>
					<td><%=time.get(i).getTrainStatinDTO().getStationName()%></td>

				</tr>

				<%
					}
					} else {
				%>
				<tr>
					<td colspan="2">값이 없습니다</td>

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