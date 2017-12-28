<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="Model.*,java.util.*,java.text.*"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");

	List<AccountDTO> list = (List<AccountDTO>) request.getAttribute("list");
	SimpleDateFormat o = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat n = new SimpleDateFormat("yyyy-MM-dd");


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
			<form action="budgetD?menu=MyBudget" method="GET" id="budgeFrm">
				<input type="hidden" name="budgeCode" id="budgeInput">
			</form>
			<div class="budgetView">
				<a href="travelAdd?menu=MyBudget"><div class="budgetAdd">+</div></a>
				<%
					if (list != null) {
						for (int i = 0; i < list.size(); i++) {
							Date od = o.parse(list.get(i).getTravelStartDate());
							String date = n.format(od);
							Date od1 = o.parse(list.get(i).getTravelEndDate());
							String date1 = n.format(od);
							
				%>
				<div class="budgetV" id="<%=list.get(i).getBudgetCode()%>">
					<p style="font-size: 45px; margin: 25px;"><%=list.get(i).getTravelName() %></p>
					<p style="font-size: 15px; margin: 25px;"><%=list.get(i).getTravelAre() %></p>
					<p style="font-size: 12px; margin: 0;"><%=date%> ~ <%=date1%></p>
				</div>

				<%
					}
					}
				%>
			</div>

		</div>
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>