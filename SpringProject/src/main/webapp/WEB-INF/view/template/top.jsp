<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.*"%>
<%@ page session="true"%>
<%
	request.setCharacterEncoding("UTF-8");
	String img = "url(img/" + request.getParameter("img") + ".jpg)";
%>
<div id="menubgc"></div>
<div id="menuBg" style="background-image:<%=img%>;"></div>
<div id="header">
	<div id="logo">
		<a href="/SpringProject/main"><img src="img/3-2.png" /></a>
	</div>
	<div id="menu">
		<ul>
			<li id="ABOUT"><a href="#">ABOUT</a></li>
			<li id="NOTICE"><a href="NoticeIndex?menu=NOTICE&img=notice">NOTICE</a></li>
			<li id="TOUR"><a href="TourMain?menu=TOUR&img=tour">TOUR</a></li>
			<li id="RENT"><a href="SearchProduct?menu=RENT&img=rent">RENT</a></li>
			<li id="TRAIN"><a href="TrainInfoKTX?menu=TRAIN&img=trainbg">TRAIN</a></li>
			<li id="EVENT"><a href="EventMain?menu=EVENT">EVENT</a></li>
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
				<li id="trainTicket"><a
					href="trainTicketHistory?menu=TRAIN&img=trainbg">발권변경</a></li>
		
			</ul>
		</div>
	</div>
	<%
		CorporDTO corporDTO;
		MemberDTO memberDTO;

		if (session.getAttribute("login") != null) {
			memberDTO = (MemberDTO) session.getAttribute("login");

			if (memberDTO.getAuthority() == 0) {
	%>
	<div id="menuLogin">
		<ul style="font-size: 8px;">
			<li><a href="MyPage?menu=MyPage&img=mypageimg2">MYPAGE</a></li>
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
			<li><a href="Register?menu=Register">REGISTER</a></li>
		</ul>
	</div>
	<%
		}
		} else if (session.getAttribute("corlogin") != null) {
			corporDTO = (CorporDTO) session.getAttribute("corlogin");
	%>
	<div id="menuLogin">
		<ul style="font-size: 8px;">
			<li><a href="MyPage?menu=MyPage&img=mypageimg2">MYPAGE</a></li>
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
			<li><a href="Register?menu=Register">REGISTER</a></li>
		</ul>
	</div>
	<%
		}
	%>
</div>
<div id="headerSub">
	<div id="logo">
		<img src="img/3-2.png" />
	</div>
	<div id="menuSub">
		<ul>
			<li id="ABOUTSub"><a href="#">ABOUT</a></li>
			<li id="NOTICESub"><a href="indexMenu.jsp?menu=NOTICE">NOTICE</a></li>
			<li id="TOURSub"><a href="TourMain?menu=TOUR&img=tour">TOUR</a></li>
			<li id="RENTSub"><a href="indexMenu.jsp?menu=RENT">RENT</a></li>
			<li id="TRAINSub"><a
				href="TrainInfoKTX.jsp?menu=TRAIN&img=trainbg">TRAIN</a></li>
			<li id="EVENTSub"><a href="indexMenu.jsp?menu=EVENT">EVENT</a></li>
		</ul>
		<div>
			<hr id="menuHrSub">
			<div id="menugSub"></div>
		</div>
		<div id="submenu">
			<ul id=trainSub>
				<li id="trainInfo"><a
					href="TrainInfoKTX.jsp?menu=TRAIN&img=trainbg">기차역 정보</a></li>
				<li id="trainTicket"><a
					href="TrainTicketMain.jsp?menu=TRAIN&img=trainbg">기차예매</a></li>
			</ul>
		</div>
	</div>
</div>

<div id="menuContent">
	<div id="menuName"><%=request.getParameter("menu")%></div>
</div>