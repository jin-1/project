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
<jsp:include page="../config.jsp" flush="false" />
<script type="text/javascript" src="./scripts/trainScript.js"></script>
<link href="./css/train.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<table style="width: 100%; height: 100%;">
			<tr>
				<td style="width: 205px; vertical-align: top;">
					<div id="sideMenu">
						<div id="trainTitle">
							<p>기차역정보</p>
						</div>
						<div id="traingMenu">
							<p>기차역 안내</p>
						</div>
						<div id="traingMenu1" style="color: black; font-weight: bold;">
							<p>
								<a href="TrainInfoKTX?menu=TRAIN&img=trainbg">- KTX역</a>
							</p>
						</div>
						<div id="traingMenu2" style="color: #1155cc; font-weight: bold;">
							<p>
								<a href="TrainInfoMain?menu=TRAIN&img=trainbg">- 일반철도</a>
							</p>
						</div>
					</div>
				</td>
				<td style="padding-left: 20px; vertical-align: top;">
					<div id="tarinInfoMain">
						<p class="location">
							<a href="#">Home</a>><a href="#">Train</a>><a href="#">TrainInfo</a>

						</p>
						<div id="Name">
							<span>일반 철도</span>
							<hr>
						</div>
						<table id="trainInfoMenuTable" cellspacing="0">
							<thead>
								<tr style="height: 50px;">
									<th style="background: #b3b3b3;" id="sudobt">수도권</th>
									<th id="ccbt">충청권</th>
									<th id="gwbt">강원권</th>
									<th id="gsbt">경상권</th>
									<th id="jrabt">전라권</th>
								</tr>
							</thead>
						</table>
						<table style="width: 100%; height: 600px; text-align: center;">
							<tr id="sudo">
								<td style="width: 50%; padding-top: 20px;">
									<div style="width: 100%; height: 100%;">
										<img alt="" src="img/map5.PNG">
									</div>
								</td>
								<td style="width: 50%; padding-top: 20px; vertical-align: top;"
									colspan="2">
									<table id="trainInfoMenuTableR" cellspacing="0">
										<thead>
											<tr>
												<th style="width: 10%;">번호</th>
												<th style="width: 20%;">역명</th>
												<th style="width: 70%;">주소</th>
											</tr>
										</thead>
										<tbody
											style="display: table-row-group; vertical-align: middle;">
											<tr>
												<td>dd</td>
												<td>dd</td>
												<td>dd</td>
											</tr>
											<tr>
												<td>dd</td>
												<td>dd</td>
												<td>dd</td>
											</tr>
										</tbody>
									</table>
									<div class="paging">
										<ul class="pagination">
											<li><a href="#">Prev</a></li>
											<li><a href="#"> 1</a></li>
											<li><a href="#"> 2</a></li>
											<li><a href="#">Next</a></li>
										</ul>
									</div>
								</td>
							</tr>
							<tr id="cc">
								<td style="width: 50%; padding-top: 20px;">
									<div style="width: 100%; height: 100%;">
										<img alt="" src="img/map6.PNG">
									</div>
								</td>
								<td style="width: 50%; padding-top: 20px; vertical-align: top;"
									colspan="2">
									<table id="trainInfoMenuTableR" cellspacing="0">
										<thead>
											<tr>
												<th style="width: 10%;">번호</th>
												<th style="width: 20%;">역명</th>
												<th style="width: 70%;">주소</th>
											</tr>
										</thead>
										<tbody
											style="display: table-row-group; vertical-align: middle;">
											<tr>
												<td>dd</td>
												<td>dd</td>
												<td>dd</td>
											</tr>
											<tr>
												<td>dd</td>
												<td>dd</td>
												<td>dd</td>
											</tr>
										</tbody>
									</table>
									<div class="paging">
										<ul class="pagination">
											<li><a href="#">Prev</a></li>
											<li><a href="#"> 1</a></li>
											<li><a href="#"> 2</a></li>
											<li><a href="#">Next</a></li>
										</ul>
									</div>
								</td>
							</tr>
							<tr id="gw">
								<td style="width: 50%; padding-top: 20px;">
									<div style="width: 100%; height: 100%;">
										<img alt="" src="img/map7.PNG">
									</div>
								</td>
								<td style="width: 50%; padding-top: 20px; vertical-align: top;"
									colspan="2">
									<table id="trainInfoMenuTableR" cellspacing="0">
										<thead>
											<tr>
												<th style="width: 10%;">번호</th>
												<th style="width: 20%;">역명</th>
												<th style="width: 70%;">주소</th>
											</tr>
										</thead>
										<tbody
											style="display: table-row-group; vertical-align: middle;">
											<tr>
												<td>dd</td>
												<td>dd</td>
												<td>dd</td>
											</tr>
											<tr>
												<td>dd</td>
												<td>dd</td>
												<td>dd</td>
											</tr>
										</tbody>
									</table>
									<div class="paging">
										<ul class="pagination">
											<li><a href="#">Prev</a></li>
											<li><a href="#"> 1</a></li>
											<li><a href="#"> 2</a></li>
											<li><a href="#">Next</a></li>
										</ul>
									</div>
								</td>
							</tr>
							<tr id="gs">
								<td style="width: 50%; padding-top: 20px;">
									<div style="width: 100%; height: 100%;">
										<img alt="" src="img/map8.PNG">
									</div>
								</td>
								<td style="width: 50%; padding-top: 20px; vertical-align: top;"
									colspan="2">
									<table id="trainInfoMenuTableR" cellspacing="0">
										<thead>
											<tr>
												<th style="width: 10%;">번호</th>
												<th style="width: 20%;">역명</th>
												<th style="width: 70%;">주소</th>
											</tr>
										</thead>
										<tbody
											style="display: table-row-group; vertical-align: middle;">
											<tr>
												<td>dd</td>
												<td>dd</td>
												<td>dd</td>
											</tr>
											<tr>
												<td>dd</td>
												<td>dd</td>
												<td>dd</td>
											</tr>
									</table>
									<div class="paging">
										<ul class="pagination">
											<li><a href="#">Prev</a></li>
											<li><a href="#"> 1</a></li>
											<li><a href="#"> 2</a></li>
											<li><a href="#">Next</a></li>
										</ul>
									</div>
								</td>
							</tr>
							<tr id="jra">
								<td style="width: 50%; padding-top: 20px;">
									<div style="width: 100%; height: 100%;">
										<img alt="" src="img/map9.PNG">
									</div>
								</td>
								<td style="width: 50%; padding-top: 20px; vertical-align: top;"
									colspan="2">
									<table id="trainInfoMenuTableR" cellspacing="0">
										<thead>
											<tr>
												<th style="width: 10%;">번호</th>
												<th style="width: 20%;">역명</th>
												<th style="width: 70%;">주소</th>
											</tr>
										</thead>
										<tbody
											style="display: table-row-group; vertical-align: middle;">
											<tr>
												<td>dd</td>
												<td>dd</td>
												<td>dd</td>
											</tr>
											<tr>
												<td>dd</td>
												<td>dd</td>
												<td>dd</td>
											</tr>
										</tbody>
									</table>
									<div class="paging">
										<ul class="pagination">
											<li><a href="#">Prev</a></li>
											<li><a href="#"> 1</a></li>
											<li><a href="#"> 2</a></li>
											<li><a href="#">Next</a></li>
										</ul>
									</div>
								</td>
							</tr>
						</table>
					</div>
		</table>

	</div>
	<!-- /mid -->
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>