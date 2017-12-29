<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="service.*, Model.*, java.util.*"  %>
<%
	request.setCharacterEncoding("UTF-8");
/* 	String menu = "../top.jsp?menu="+request.getParameter("menu"); */
	String menu = "../top.jsp?menu=Orders";
	String img = "url(img/rent.jpg)";
	
	List<PurchaseDTO> view = (List<PurchaseDTO>)request.getAttribute("view");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./scripts/script.js"></script>
<jsp:include page="../config.jsp" flush="false"/>
<script type="text/javascript">
function AlertIt() {
	 document.getElementById('frm4').submit();

</script>
<style>
table{
   margin-top: 50px;
}
table{
   text-align:center;
}
</style> 
</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
		<div id="menuBg" style="background-image:<%=img%>;"></div>
	</div>
	<div id="mid">
		<center>
			<form id="frm4" action="ViewOrderList" method="post">
			<table border="1" width="900px">
				<colgroup>
					<col width="20%">
					<col width="25%">
					<col width="25%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">결제 번호</th>
						<th style="background-color: #eeeeee; text-align: center;">결제 금액</th>
						<th style="background-color: #eeeeee; text-align: center;">결제 날짜</th>
						<th style="background-color: #eeeeee; text-align: center;">환불 여부</th>
						<th style="background-color: #eeeeee; text-align: center;">환불 신청</th>
					</tr>
				</thead>
				<tbody>
				<%
					if(view==null){
				%>
					<tr><td colspan="5"></td></tr>
				<% 
					}else{ 
						int num=1;
						for(int i=0; i<view.size(); i++){
				%>
					<tr>
						<td><a href="RentOrder?transCode=<%= view.get(i).getTransCode() %>"><%=view.get(i).getTransCode()%></a></td>
						<td><%= view.get(i).getPayment()%></td>
						<td><%= view.get(i).getTransDate()%></td>
						<td><%= view.get(i).getRefundStatus()%></td>
						<td><button name="refundBtn" onclick="javascript:AlertIt();" value="view.get(i).getTransCode()">신청</button></td>
					</tr>
				<%
					}
				}
			%>
				</tbody>
			</table>
		</form>
		</center>
	</div>
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>