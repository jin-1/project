<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
	String[] data = (String[])session.getAttribute("trainTicket");
	List<TrainRegistrationDTO> seat = (List<TrainRegistrationDTO>) request.getAttribute("seat");
	Map<Integer, List<Integer>> seatmap = new HashMap<Integer, List<Integer>>();
 	DecimalFormat dc = new DecimalFormat("###,###,###,###");
 	int sadult = 0;
 	int sold = 0;
 	int schild = 0;
 	
 	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TRENVIAJES</title>
<jsp:include page="../config.jsp" flush="false" />

</head>
<body>

	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<p class="location">
			<a href="#">Home</a>><a href="#">Train</a>><a href="#">TrainTicket</a>
		</p>
		<div id="trainName">
			<span>기차 예매</span>
			<div class="trainStep">
				<div style="background-color: #1a2440b0;">조회</div>
				<div style="background-color: #1a2440b0;">예약</div>
				<div style="background-color: #1a2440b0;">결제</div>
				<div>발권</div>
			</div>
			<hr>

		</div>
		
	</div>
	<!-- /mid -->
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>