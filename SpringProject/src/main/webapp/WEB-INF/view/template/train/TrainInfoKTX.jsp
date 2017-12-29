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
<jsp:include page="../config.jsp" flush="false" />
<script type="text/javascript" src="./scripts/trainScript.js"></script>
<link href="./css/train.css" rel="stylesheet" type="text/css">
<title>TRENVIAJES</title>
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
						<div id="traingMenu1">
							<p>
								<a href="TrainInfoKTX?menu=TRAIN&img=trainbg">- KTX역</a>
							</p>
						</div>
						<div id="traingMenu2">
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
							<span>KTX 역</span>
							<hr>
						</div>
						<table id="trainInfoMenuTable" cellspacing="0">
							<tr style="height: 50px;">
								<th style="background: #f8f8f8;" id="gbbt">경부선</th>
								<th id="hnbt">호남선</th>
								<th id="gjbt">경전선</th>
								<th id="jrbt">전라선</th>

							</tr>
							<tr id="gb">
								<td style="width: 50%; padding-top: 20px;" colspan="2">
									<div style="width: 100%; height: 100%;">
										<img alt="" src="img/map1.PNG">
									</div>
								</td>
							
							</tr>
							<tr id="hn">
								<td style="width: 50%; padding-top: 20px;" colspan="2">
									<div style="width: 100%; height: 100%;">
										<img alt="" src="img/map2.PNG">
									</div>
								</td>
								
							</tr>
							<tr id="gj">
								<td style="width: 50%; padding-top: 20px;" colspan="2">
									<div style="width: 100%; height: 100%;">
										<img alt="" src="img/map3.PNG">
									</div>
								</td>
							
							</tr>
							<tr id="jr">
								<td style="width: 50%; padding-top: 20px;" colspan="2">
									<div style="width: 100%; height: 100%;">
										<img alt="" src="img/map4.PNG">
									</div>
								</td>
								
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>


	</div>
	<!-- /mid -->
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>