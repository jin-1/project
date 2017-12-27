<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="Model.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
th, td {
	border-bottom: 1px solid #dddddd;
}

.container {
	position: absolute;
	top: 250px;
	left: 50%;
	transform: translate(-50%, -50%)
}

.paging {
	position: relative;
	left: 50%;
	margin-left: -200px;
	top: 150px;
}

.paging ul {
	list-style: none;
	margin: 0;
	padding: 0 5px;
}

.paging li {
	display: inline;
	float: left;
	padding: 4px;
	margin-right: 3px;
	width: 40px;
	color: #000;
	font: bold 13px tahoma;
	border: 1px solid #eee;
	text-align: center;
	text-decoration: none;
}

.noticeTable {
	table-layout: fixed;
	height: auto;
	position: relative;
	top: 150px;
}

.line td {
	height: 50px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BudgetList</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<link href="./css/train.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="./scripts/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="./scripts/script.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load('visualization', '1', {
		packages : [ 'corechart' ]
	});
</script>
<script type="text/javascript">
	function drawVisualization() {
		// Some raw data (not necessarily accurate)
		var data = google.visualization.arrayToDataTable([ [ 'Month', '금액' ],
				[ '교통비', 30 ], [ '식비', 30 ], [ '숙박비', 40 ], [ '쇼핑', 60 ],
				[ '관광', 70 ], [ '종합', 70 ] ]);
		var options = {
			vAxis : {},
			hAxis : {},
			seriesType : "bars",
			series : {
				5 : {
					type : "line"
				}
			}
		};
		var chart = new google.visualization.ComboChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
	google.setOnLoadCallback(drawVisualization);
</script>
</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">

		<h1 align="center">가족여행</h1>
		<hr>
		<table style="margin: 0px auto;">
			<tr>
				<td rowspan="2"><div id="chart_div"
						style="width: 700px; height: 300px;"></div></td>
				<td>자산금</td>
				<td>지출금</td>
				<td>남은금액</td>
			</tr>

			<tr>
				<td><input type="text"> -</td>
				<td><input type="text"> =</td>
				<td><input type="text"></td>
			</tr>

			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td><input type="button" value="목록"> <input
					type="button" value="추가"> <input type="button" value="삭제">
					<input type="button" value="공유"></td>
			</tr>
		</table>
		<br />
		<table class="noticeTable" style="text-align: center;" width="1500">
			<thead>
				<tr>
					<th height="50"
						style="background-color: #eeeeee; text-align: center;">분류</th>
					<th height="50"
						style="background-color: #eeeeee; text-align: center;">지역</th>
					<th height="50"
						style="background-color: #eeeeee; text-align: center;">내용</th>
					<th height="50"
						style="background-color: #eeeeee; text-align: center;">금액</th>
					<th height="50"
						style="background-color: #eeeeee; text-align: center;">날짜</th>
				</tr>
			</thead>
			<tr class="line">
			
			</tr>
		</table>
		<br /> <br />
		<div class="paging">
			<ul class="pagination">
				<li><a href="#">Prev</a></li>
				<li><a href="#"> 1</a></li>
				<li><a href="#"> 2</a></li>
				<li><a href="#"> 3</a></li>
				<li><a href="#"> 4</a></li>
				<li><a href="#"> 5</a></li>
				<li><a href="#">Next</a></li>
			</ul>
		</div>
	</div>

	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>

</body>
</html>