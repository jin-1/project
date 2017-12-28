<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="service.*, Model.*"  %>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu="+request.getParameter("menu");
	String target = "./template/menu/" + request.getParameter("target") + ".jsp";
	
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
		<center>
			<table border="1" width="900px">
				<colgroup>
					<col width="25%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2" style="background-color: #eeeeee; text-align: center;">사진</th>
						<th style="background-color: #eeeeee; text-align: center;">카테고리</th>
						<th style="background-color: #eeeeee; text-align: center;">종류</th>
						<th rowspan="2" style="background-color: #eeeeee; text-align: center;">가격</th>
						<th rowspan="2" style="background-color: #eeeeee; text-align: center;"></th>
					</tr>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">이름</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="view" items="${result}" varStatus="status">
					<tr>
						<td rowspan="2"><img height="200" width="200" src="/SpringProject/img/prd/${view.prdImg}"></td>
						<td>${view.prdCategory}</td>
						<td>${view.prdType}</td>
						<td rowspan="2">${view.prdPrice}</td>
						<td rowspan="2">
							<a href="AdminPrdModify?prdCode=${view.prdCode}">수정</a><br>
							<a class="deletePrdBtn">삭제</a>
						</td>
					</tr>
					<tr>
						<td colspan="2">${view.prdName}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</center>
	</div>
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>