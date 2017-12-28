<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="Model.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
#container {
	width: 960px;
	margin: 0 auto;
}

#container #input-form {
	text-align: center;
}

#user-table {
	margin: 0 auto;
	text-align: center;
}

#input-form {
	margin-top: 10px;
	margin-bottom: 10px;
}

#user-table {
	border-collapse: collapse;
}

#user-table>thead>tr {
	background-color: #333;
	color: balck;
}

#user-table>thead>tr>th {
	padding: 8px;
	width: 150px;
}

#user-table>tbody>tr>td {
	border-bottom: 1px solid gray;
	padding: 8px;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<jsp:include page="../config.jsp" flush="false" />

</head>
<body>
		<div id="top" style="height: 100px;">
		<div id="menubgc"></div>
		<div id="menuBg"></div>
		<div id="header">
			<div id="logo">
				<a href="/SpringProject/main"><img src="img/3-2.png" /></a>
			</div>
			<div id="menu">
				<ul>
					<li><a href="adminIndex">회원/기업</a></li>
					<li><a href="adminTrain">기차</a></li>
					<li><a href="adminRent">대여</a></li>
					<li><a href="adminTour">여행지</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div id="mid1" style="display: inline-block; width: 85%; height: 700px; margin-left: 280px; overflow-y: auto;">

		<h2 align="center">회원 목록</h2>


		<table class="m_table" align="center" id="user-table" style=" width: 85%;text-align: left;">
			<thead>
				<tr style="background: #EAEAEA">
					<th>아이디</th>					
					<th>이름</th>
					<th>휴대폰</th>
					<th>주소</th>
					<th>이메일</th>
					<th>상세보기</th>
					<th>탈퇴</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">

					<tr id="list">
						<td>${list.memberId}</td>
						<td>${list.memberName}</td>
						<td>${list.memberPhone}</td>
						<td>${list.memberAddr}</td>
						<td>${list.memberEmail}</td>
						<form:form action="myPage" method="get">
							<input type="hidden" value="${list.memberId}" name="userId">
							<td><input type="submit" value="상세보기"></td>
						</form:form>
						
						<form:form action="MemberDelete" method="POST">
							<input type="hidden" value="${list.memberId}" name="userId">
							<td><input type="submit" value="삭제"></td>
						</form:form>

					</tr>
				</c:forEach>
			</tbody>
			<tfoot>

				<tr align="center">
					<td colspan="11"><br /> <select id="key" name="key">
							<option value="0">---선택---</option>
							<option value="1">아이디</option>
							<option value="2">이름</option>
							<option value="3">주소</option>
					</select><input type="text" id="keyword" /></td>
				</tr>
			</tfoot>
		</table>
		<script type="text/javascript">
			$('#keyword')
					.keyup(
							function() {
								console.log("dd");
								var k = $(this).val();
								var key = $('#key').val();
								if (key == "1") {
									$("#user-table > tbody > tr").hide();
									var temp = $("#user-table > tbody > tr > td:nth-child(9n+1):contains('"
											+ k + "')");
									$(temp).parent().show();
								} else if (key == "2") {
									$("#user-table > tbody > tr").hide();
									var temp = $("#user-table > tbody > tr > td:nth-child(9n+3):contains('"
											+ k + "')");
									$(temp).parent().show();
								} else if (key == "3") {
									$("#user-table > tbody > tr").hide();
									var temp = $("#user-table > tbody > tr > td:nth-child(9n+5):contains('"
											+ k + "')");
									$(temp).parent().show();
								}

							});
		</script>
	</div>
	<div id="left"
		style="width: 12%; min-height: 900px; height: 115%; top: 100px; position: absolute; background-color: #595959;">

		<ul>
			<li style="margin-bottom: 30px; margin-top: 30px;"><a href="MemberAll">회원 정보보기</a></li>
			<li style="margin-bottom: 30px;"><a href="CoperAll">기업 정보보기</a></li>
			<li style="margin-bottom: 30px;"><a href="noticeAdmin">공지사항 등록</a></li>
			<li style="margin-bottom: 30px;"><a href="#">블랙리스트</a></li>

		</ul>
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>