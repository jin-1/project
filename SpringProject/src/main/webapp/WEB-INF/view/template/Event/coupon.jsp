<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ page import="Model.*,java.util.*" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
	List<EventDTO> list = (List<EventDTO>)request.getAttribute("list");
	String point = request.getParameter("point");
	System.out.print(point);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<jsp:include page="../config.jsp" flush="false" />
<style>
.title {
	position: relative;
	padding-top: 40px;
	padding-bottom: 16px;
	margin-top: 10px;
	margin-bottom: 30px;
	border-bottom: 1px solid #bdbcbc;
}

.name.couponSection1 {
	width: 131px;
	height: 19px;
	background: no-repeat center center;
}

.buttonWrap {
	position: absolute;
	right: 0;
	top: 35px;
	padding: 0;
	text-align: center;
}

.button.borg {
	font-size: 13px;
	color: #fff;
	height: 36px;
	line-height: 36px;
	padding: 0 25px;
	margin-right: 4px;
	font-weight: 400;
	background-color: #ff6600;
	border: 1px solid #ff6600;
}

.chargeCapa {
	height: 84px;
	padding-top: 26px;
	text-align: center;
	border: 3px solid #ff7e00;
	font-size: 20px;
	font-weight: 400;
	color: #666;
	margin-bottom: 40px;
	letter-spacing: -1px;
	transition: all 0.3s ease;
}

.subWrap .content .searchOption {
	text-align: right;
	padding: 0 0 15px 0;
	margin-top: 15px;
}

.listType1 {
	width: 100%;
	font-size: 13px;
	border-top: 2px solid #bdbcbc;
	outline: none;
}

table {
	display: table;
	border-collapse: collapse;
	border-spacing: 0;
	border-color: grey;
}

thead {
	display: table-header-group;
	vertical-align: middle;
	border-color: inherit;
}

tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

td, th {
	display: table-cell;
	vertical-align: inherit;
}

.listType1 thead th {
	padding: 16px 0;
	border-bottom: 1px solid #bdbcbc;
	background-color: #f5f6f8;
	color: #333;
	font-weight: 100;
	line-height: 1.4;
	text-align: center;
	width: 300px;
}

.colgroup {
	display: table-column-group;
}

col {
	display: table-column;
	width: 238px;
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

.listType1 tbody td.coupon {
	text-align: left;
	padding-left: 15px;
	padding-right: 13px;
}

.listType1 tbody td {
	border-bottom: 1px solid #e4e4e4;
	text-align: center;
	padding: 18px 0;
	color: #666;
	line-height: 1.4;
}

mid2 {
	position: relative;
	width: 60%;
	height: auto;
	margin-left: 10%;
	min-height: 300px;
}

.container {
	margin-right: auto;
	margin-left: auto;
	padding-left: 400px;
	padding-right: 400px;
}

.row {
	margin-left: -15px;
	margin-right: -15px;
}
</style>
</head>
<body>



	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div class="container">
		<div class="row">
			<div id="mid2">
				<h2 class="title">
					<span class="name couponSection1">사용가능한 쿠폰</span>
					<div class="buttonWrap">
						<sapn class="button borg" id="registerCoupon">쿠폰등록</sapn>
					</div>
				</h2>
				<!--사용 가능한 쿠폰 -->
				<div class="chargeCapa">
					<span class="coupon">Trenviajes 쿠폰함 <a href=""></a>
					</span>
				</div>
			</div>
			<table class="listType1">
				<colgroup>
					<col width="238">
					<col width="*">
					<col width="120">
					<col width="110">
				</colgroup>
				<thead>
					<tr>
						<th>고유번호</th>
						<th>쿠폰명</th>
						<th>이벤트명</th>
						<th>유효기간</th>
						<th>사용자</th>
						
					</tr>
				</thead>
				
				<tbody>
					<%for(int i = 0 ; i <list.size(); i++){ %>
					<tr id="list">
						<td><%=list.get(i).getElectedCode() %></td>
						<td><%=list.get(i).getEventCategory() %></td>
						<td><%=list.get(i).getEventName()%></td>
						<td><%=list.get(i).getExpriyDate()%></td>
						<td><%=list.get(i).getMemberId()%></td>
						
					</tr>
					<%} %>
				</tbody>
			</table>
		</div>
	</div>


	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>