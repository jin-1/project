<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.*, Model.*, java.util.*"  %>
<%
	request.setCharacterEncoding("UTF-8");
String menu = "../top.jsp?menu=Orders";
String img = "url(img/rent.jpg)";
	
	List<RentRegDTO> orderList = (List<RentRegDTO>)request.getAttribute("orderList");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./scripts/script.js"></script>
<jsp:include page="../config.jsp" flush="false"/> 
<style type="text/css">
#mid{
	width:80%;
	margin-left: 10%; 
	height: auto;
	postion:relative;
}
.orderTable{
	display: table;
	margin: 0 auto;
	width: 1200px;
}
</style>
</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
		<div id="menuBg" style="background-image:<%=img%>;"></div>
	</div>
	<div id="mid">
		<table class="orderTable" >
			<colgroup>
				<col width="26%">
				<col width="7%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="7%">
			</colgroup>
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">상품명</th>
					<th style="background-color: #eeeeee; text-align: center;">대여수</th>
					<th style="background-color: #eeeeee; text-align: center;">픽업역</th>
					<th style="background-color: #eeeeee; text-align: center;">픽업날짜</th>
					<th style="background-color: #eeeeee; text-align: center;">반납역</th>
					<th style="background-color: #eeeeee; text-align: center;">반납날짜</th>
					<th style="background-color: #eeeeee; text-align: center;">반납여부</th>
				</tr>
			</thead>
			<%
				if(orderList==null){
			%>
			<tr>
				<td colspan="7"><h1 align="center">대여하신 내역이 없습니다.</h1></td>
			</tr>
			<%
				} else {
					int num=1;
					for(int i=0; i<orderList.size(); i++){
			%>
			<tr align="center">
				<td><%= orderList.get(i).getPrdName() %></td>
				<td><%= orderList.get(i).getPickupQty() %></td>
				<td><%= orderList.get(i).getPickupStation() %></td>
				<td><%= orderList.get(i).getPickupDate() %></td>
				<td><%= orderList.get(i).getReturnStation() %></td>
				<td><%= orderList.get(i).getReturnDate() %></td>
				<td><%= orderList.get(i).getVerifyReturn() %></td>
			</tr>
			<%
					}
				}
			%>
		</table>
	</div>
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>