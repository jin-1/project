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
#container {
	width: 80%;
	margin: auto;
	margin-top: 100px;
}

.mypage {
	list-style: none;
	width: 100%;
	margin: 0;
	padding: 0;
}

.mypage li {
	display: inline-block;
	width: 33%;
	margin: auto;
	margin-right: -5px;
	height: 250px;
	position: relative;
	background-color: #f7f7f7;
	border: #afacac 1px solid;
}

.mypage p {
	position: relative;
	top: 30px;
	width: 150px;
	display: inline-block;
	left: 170px;
	margin: 0;
	font-weight: bold;
	text-align: left;
	font-size: 25px;
}

.mypage li>ul {
	width: 207px;
	position: relative;
	top: 50px;
	left: 30px;
	font-size: 15px;
}

.mypage li>ul>li {
	height: 30px;
	width: 100px;
	border: none;
	display: block;
	border: none;
	cursor: pointer;
}

.mypage li>ul>li>a {
	text-decoration:none;
	color: black;
}

.mypage li>ul>li>a:focus {
	color: black;
}

.mypage li>ul>li>a:visited {
	color: black;
}
.mypage li>ul>li>a:hover {
	color: #4a4a4a;
}
.mypage img {
	width: 120px;
	position: absolute;
	top: 50px;
	left: 30px;
}

#oneOnone {
	padding-top: 80px;
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
	padding-bottom: 0.5%;
}

.noticeTable {
	text-align: center;
	width: 1230px;
}

.noticeTable td {
	
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
					<li><p>내정보관리</p> <img src="img/mypage.png">
						<ul>
							<li><a href="myPageCon?menu=MyPage">내정보수정</a></li>
							<li>회원탈퇴</li>

						</ul></li>
					<li><p>구입내역관리</p> <img src="img/mypage.png">
						<ul>
							<li>기차예매내역</li>
							<li>대여내역</li>
						</ul></li>
					<li style="top: -30px;"><p>예산</p> <img src="img/mypage.png">
						<ul>
							<li><a href="MyBudget?menu=MyBudget">예산 보기</a></li>
						</ul></li>
				</ul>
			</div>

			<div id="oneOnone">
				<h3>1:1문의</h3>
				<div class="row">
					<input type="button"
						style="left-padding: 100px; width: 80pt; height: 20pt;"
						value="문의등록" /> <input type="button"
						style="width: 80pt; height: 20pt;" value="문의삭제" />
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
						<td>1</td>
						<td>이거 대여 되나요?</td>
						<td>2017-10-19</td>
						<td>답변대기</td>
					</tr>
					<tr class="line">
						<td>2</td>
						<td>이거 대여 되나요?</td>
						<td>2017-10-19</td>
						<td>답변대기</td>
					</tr>
					<tr class="line">
						<td>3</td>
						<td>이거 대여 되나요?</td>
						<td>2017-10-19</td>
						<td>답변완료</td>
					</tr>
					<tr class="line">
						<td>4</td>
						<td>이거 대여 되나요?</td>
						<td>2017-10-19</td>
						<td>답변완료</td>
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