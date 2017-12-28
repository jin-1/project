<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.*, Model.*, java.util.*"  %>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu="+request.getParameter("menu");
	String target = "./template/menu/" + request.getParameter("target") + ".jsp";
	List<PurchaseDTO> result = (List<PurchaseDTO>)request.getAttribute("result");

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
</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<table class="viewOrderTable" width="1000">
			<colgroup>
					<col width="20%">
					<col width="10%">
					<col width="25%">
					<col width="25%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">결제 번호</th>
						<th style="background-color: #eeeeee; text-align: center;">아이디</th>
						<th style="background-color: #eeeeee; text-align: center;">결제 금액</th>
						<th style="background-color: #eeeeee; text-align: center;">결제 날짜</th>
						<th style="background-color: #eeeeee; text-align: center;">환불 여부</th>
						<th style="background-color: #eeeeee; text-align: center;">환불 신청</th>
					</tr>
				</thead>
			<tbody>
		<%
			int num=1;
			for(int i=0; i<result.size(); i++){
		%>
				<tr>
						<td><a href="AdminViewOrder?transCode=<%= result.get(i).getTransCode() %>"><%=result.get(i).getTransCode()%></a></td>
						<td><%= result.get(i).getMemberId() %></td>
						<td><%= result.get(i).getPayment()%></td>
						<td><%= result.get(i).getTransDate()%></td>
						<td><%= result.get(i).getRefundStatus()%></td>
						<td><a href="#">환불</a></td>
					</tr>
		<%
			}
		%>
			</tbody>
		</table>
		
	</div>
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>