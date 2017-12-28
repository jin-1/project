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
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">

		<h2 align="center">회원 목록</h2>


		<table class="m_table" align="center" id="user-table">
			<thead>
				<tr style="background: #EAEAEA">
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>탈퇴</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">

					<tr id="list">
						<td>${list.corporId}</td>
						<td>${list.corporPw}</td>
						<td>${list.corporName}</td>
						<td>${list.corporEmail}</td>
						<td>${list.corporPhone}</td>
						<td>${list.corporAddr}</td>
						<form:form action="CoperDelete" method="POST">
							<input type="hidden" value="${list.corporId}" name="userId">
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
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>