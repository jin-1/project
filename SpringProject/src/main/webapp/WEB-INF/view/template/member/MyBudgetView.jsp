<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="Model.*"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
	AccountDTO acDto = (AccountDTO) request.getAttribute("acDto");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>MYPAGE</title>
<jsp:include page="../config.jsp" flush="false" />
<link href="./css/member.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div class="tbg"></div>
	<div class="tbgB">
		<h3>예산항목추가</h3>
		<form:form modelAttribute="budgetDD" action="budgetDD" method="POST" id="budgetDDFrm">
		<input type="hidden" name="budgetCode" value="<%=acDto.getBudgetCode()%>">
		<table>
			<tr>
				<td>항목명</td>
				<td><input type="text" name="acountItemName"></td>
			</tr>
			<tr>
				<td>분류</td>
				<td> 
					<select name="acountClassifiication">
						<option>식비</option>
						<option>쇼핑</option>
						<option>관광</option>
						<option>교통</option>
						<option>숙박</option>
						<option>기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>지출내용</td>
				<td><input type="text" name="acountContents"></td>
			</tr>
			<tr>
				<td>금액</td>
				<td><input type="number" name="acountPrice"></td>
			</tr>
			<tr>
				<td>날짜</td>
				<td><input type="date" name="acountDate"></td>
			</tr>
		</table>
		<div class="budgetABt1" id="budgetaddBt">추가</div> <div class="budgetCBt1">취소</div>
		</form:form>
	</div>
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
					<div id="budgetDcon">
						<table>
							<thead>
								<tr>
									<th>항목명</th>
									<th>분류</th>
									<th>내용</th>
									<th>금액</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="5">항목이 존재하지 않습니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="budgetUse">
						총액 :
						<%=acDto.getExpense()%></div>
					<div class="budgetABt" id="babt">추가</div>
					<div class="budgetCBt" id="">삭제</div>
				</div>
			</div>
		</div>
		<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>