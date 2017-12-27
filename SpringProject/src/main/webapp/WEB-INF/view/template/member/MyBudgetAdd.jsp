<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>MYPAGE</title>
<jsp:include page="../config.jsp" flush="false" />
<link href="./css/member.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<div style="width: 80%; margin: auto;">
			<p class="location">
				<a href="#">Home</a>><a href="#">MyPage</a>><a href="#">Budget</a>
			</p>
			<div id="Name">
				<span>예산</span>
				<hr>
			</div>
			<div>
				<div id="travelName">
					<form:form modelAttribute="account">
					<table>
						<tr>
							<td>여행 이름</td><td><input type="text" name="travelName"></td>
						</tr>
						<tr>
							<td>여행 지역</td><td><input type="text" name="travelAre"></td>
						</tr>
						<tr>
							<td>금액</td><td><input type="number" name="expense"></td>
						</tr>
						<tr>
							<td>시작 날짜</td><td><input type="date" name="travelStartDate"></td>
						</tr>
						<tr>
							<td>종료 날짜</td><td><input type="date" name="travelEndDate"></td>
						</tr>
					</table>
					<button style="background: #375ea1;">등록</button><button style="background: #f35c5c;">취소</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>