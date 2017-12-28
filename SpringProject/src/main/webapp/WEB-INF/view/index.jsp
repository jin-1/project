<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.*"%>
<%@ page session="true"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TRENVIAJES</title>
<link rel="stylesheet" type="text/css" href="./css/styles.css?ver=11">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="./scripts/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="./scripts/script.js"></script>
</head>
<body>
	<div id="bgc"></div>
	<div id="bg"></div>
	<div id="header">
		<div id="logo">
			<img src="./img/3-2.png" />
		</div>
		<div id="menu">
			<ul>
				<li id="ABOUT"><a href="#">ABOUT</a></li>
				<li id="NOTICE"><a href="NoticeIndex?menu=NOTICE">NOTICE</a></li>
				<li id="TOUR"><a href="TourMain?menu=TOUR&img=tour">TOUR</a></li>
				<li id="RENT"><a href="indexMenu.jsp?menu=RENT">RENT</a></li>
				<li id="TRAIN"><a href="TrainInfoKTX?menu=TRAIN&img=trainbg">TRAIN</a></li>
				<li id="EVENT"><a href="indexMenu.jsp?menu=EVENT">EVENT</a></li>

			</ul>
			<div>
				<hr id="menuHr">
				<div id="menug"></div>
			</div>

			<div id="submenu">
				<ul id=trainSub>
					<li id="trainInfo"><a
						href="TrainInfoKTX?menu=TRAIN&img=trainbg">기차역 정보</a></li>
					<li id="trainTicket"><a
						href="TrainTicketMain?menu=TRAIN&img=trainbg">기차예매</a></li>
				</ul>
			</div>
		</div>
		<%
			CorporDTO corporDTO;
			MemberDTO memberDTO;

			if (session.getAttribute("login") != null) {
				memberDTO = (MemberDTO) session.getAttribute("login");

				if (memberDTO.getAuthority() == 1) {
		%>
		<div id="menu">
			<ul>
				<li id="ABOUT"><a href="#">ABOUT</a></li>
				<li id="NOTICE"><a href="noticeAdmin?menu=NOTICE">NOTICE</a></li>
				<li id="TOUR"><a href="TourMain?menu=TOUR&img=tour">TOUR</a></li>
				<li id="RENT"><a href="indexMenu.jsp?menu=RENT">RENT</a></li>
				<li id="TRAIN"><a href="TrainInfoKTX?menu=TRAIN&img=trainbg">TRAIN</a></li>
				<li id="EVENT"><a href="indexMenu.jsp?menu=EVENT">EVENT</a></li>

			</ul>
			<div>
				<hr id="menuHr">
				<div id="menug"></div>
			</div>

			<div id="submenu">
				<ul id=trainSub>
					<li id="trainInfo"><a
						href="TrainInfoKTX?menu=TRAIN&img=trainbg">기차역 정보</a></li>
					<li id="trainTicket"><a
						href="TrainTicketMain?menu=TRAIN&img=trainbg">기차예매</a></li>
				</ul>
			</div>
		</div>
		<%}}

			if (session.getAttribute("login") != null) {
				memberDTO = (MemberDTO) session.getAttribute("login");

				if (memberDTO.getAuthority() == 0) {
		%>
		<div id="menuLogin">
			<ul style="font-size: 8px;">
				<li><a href="MyPage?menu=MyPage">MYPAGE</a></li>
				<li>|</li>
				<li><a href="Logout">LOGOUT</a></li>
			</ul>
		</div>
		<%	
				}else if(memberDTO.getAuthority() == 1){
		
		%>
			<div id="menuLogin">
			<ul style="font-size: 8px;">
				<li><a href="mypageIndexAdmin?menu=MyPage">MYPAGE</a></li>
				<li>|</li>
				<li><a href="Logout">LOGOUT</a></li>
			</ul>
		</div>
		<%
			} else {
		%>
		<div id="menuLogin">
			<ul style="font-size: 8px;">
				<li><a href="LoginForm?menu=LOGIN">LOGIN</a></li>
				<li>|</li>
				<li><a href="Register?menu=REGISTER">REGISTER</a></li>
			</ul>
		</div>



		<%
			}
			} else if (session.getAttribute("corlogin") != null) {
				corporDTO = (CorporDTO) session.getAttribute("corlogin");
		%>
		<div id="menuLogin">
			<ul style="font-size: 8px;">
				<li><a href="corpageIndex?menu=MyPage">MYPAGE</a></li>
				<li>|</li>
				<li><a href="Logout">LOGOUT</a></li>
			</ul>
		</div>
		<%
			}

			else {
		%>
		<div id="menuLogin">
			<ul style="font-size: 8px;">
				<li><a href="LoginForm?menu=LOGIN">LOGIN</a></li>
				<li>|</li>
				<li><a href="Register?menu=REGISTER">REGISTER</a></li>
			</ul>
		</div>
		<%
			}
		%>
	</div>
	<div id="contents" class="box">
		<div id="typography">
			<p>ASDSFASFAasdasdSF</p>
			<p>ASFASFASF</p>
			<p>ASFASF</p>
		</div>
	</div>
</body>
</html>
