<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>MYPAGE</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<link href="./css/train.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="./scripts/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="./scripts/memberscript.js"
	charset="utf-8"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
#container{
	width:100%;
	padding-left:10%;
	padding-top:3%;
}
#container ul {
	display: inline;
}

#container li {
	margin-left: auto;
	margin-right: auto;
}

.mypage {
	list-style: none;
	width: 255px;
	height: 200px;
	float: left;
	margin-right: 10px;
	background-color: #EAEAEA;
}

.mypage li {
	text-align: center;
	padding-right: 16%;
	padding-top: 3%;
}

.mypage span {
	font-weight: bold;
}

.train {
	list-style: none;
	width: 255px;
	height: 200px;
	float: left;
	margin-right: 10px;
	background-color: #EAEAEA;
}

.train li {
	text-align: center;
	padding-right: 16%;
	padding-top: 3%;
}

.train span {
	font-weight: bold;
}

.rent {
	list-style: none;
	width: 255px;
	height: 200px;
	float: left;
	margin-right: 10px;
	background-color: #EAEAEA;
}

.rent li {
	text-align: center;
	padding-right: 16%;
	padding-top: 3%;
}

.rent span {
	font-weight: bold;
}

.corpor {
	list-style: none;
	width: 255px;
	height: 200px;
	float: left;
	margin-right: 10px;
	background-color: #EAEAEA;
}

.corpor li {
	text-align: center;
	padding-right: 16%;
	padding-top: 3%;
}

.corpor span {
	font-weight: bold;
}

#oneOnone {
	padding-top: 20%;
}

.paging {
	left: 42%;
	margin-left: -200px;
	top: 50px;
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
}

.line td {
	height: 50px;
}

.row {
	padding-left: 66%;
	padding-bottom:0.5%;
}
.noticeTable{
		text-align: center;
		width:1230px; 
		
}
.noticeTable td{
	
}
</style>
</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<div id="container">
			<h3>MYPAGE</h3>

			<div id="mypage">
				<ul class="mypage">
					<li><img src="./img/mypageicon.jpg" style="width: 200px; height: 150px;" /></a></li>
					<li class="mypageText"><span>내 정보 수정</span></li>
				</ul>
			</div>
			<div id="train">
				<ul class="train">
					<li><img src="./img/trainicon.jpg"
						style="width: 200px; height: 150px;" /></li>
					<li class="trainText"><span>기차 예매 내역</span></li>
				</ul>
			</div>
			<div id="rent">
				<ul class=rent>
					<li><img src="./img/renticon.jpg"
						style="width: 200px; height: 150px;" /></li>
					<li class="rentText"><span>대여 내역</span></li>
				</ul>
			</div>
			<div id="corpor">
				<ul class="corpor">
					<li><img src="./img/corporicon.jpg"
						style="width: 200px; height: 150px;" /></li>
					<li class="corporText"><span>사업지 등록</span></li>
				</ul>
			</div>
			<div id="oneOnone">
				<h3>1:1문의</h3>
				<div class="row">
					<input type="button" class="inquiry_add" style="left-padding: 100px; width: 80pt; height: 20pt;" value="문의등록" /> 
				</div>
				<table class="noticeTable">
				<colgroup>
				<col width="10%" />
				<col width="80%" />
				<col width="20%" />
				<col width="20%" />
				</colgroup>
					<thead>
						<tr>
							<th height="50"
								style="background-color: #eeeeee; text-align: center;">글번호</th>
							<th height="50"
								style="background-color: #eeeeee; text-align: center;">제목</th>
							<th height="50"
								style="background-color: #eeeeee; text-align: center;">등록일</th>
							<th height="50"
								style="background-color: #eeeeee; text-align: center;">답변여부</th>
						</tr>
					</thead>
					<tr class="line">
						<td >1</td>
						<td >이거 대여 되나요?</td>
						<td >2017-10-19</td>
						<td >답변대기</td>
					</tr>
					<tr class="line">
						<td >2</td>
						<td >이거 대여 되나요?</td>
						<td >2017-10-19</td>
						<td >답변대기</td>
					</tr>
					<tr class="line">
						<td >3</td>
						<td >이거 대여 되나요?</td>
						<td >2017-10-19</td>
						<td >답변완료</td>
					</tr>
					<tr class="line">
						<td >4</td>
						<td >이거 대여 되나요?</td>
						<td >2017-10-19</td>
						<td >답변완료</td>
					</tr>

				</table>
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
		</div>
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>