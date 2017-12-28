<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="Model.*,java.util.*,java.text.*"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
	List<AccountDetailDTO> acDto = (List<AccountDetailDTO>) request.getAttribute("acDto");
	String budgeCode = request.getParameter("budgeCode");
	SimpleDateFormat o = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat n = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat dc = new DecimalFormat("###,###,###,###");
	int sum = 0;
	int fS = 0;
	int sS = 0;
	int gS = 0;
	int tS = 0;
	int hS = 0;
	int eS = 0;
	if (acDto != null) {
		for (int i = 0; i < acDto.size(); i++) {
			if (acDto.get(i).getAcountClassifiication().equals("식비")) {
				fS += Integer.parseInt(acDto.get(i).getAcountPrice());
			} else if (acDto.get(i).getAcountClassifiication().equals("쇼핑")) {
				sS += Integer.parseInt(acDto.get(i).getAcountPrice());
			} else if (acDto.get(i).getAcountClassifiication().equals("관광")) {
				gS += Integer.parseInt(acDto.get(i).getAcountPrice());
			} else if (acDto.get(i).getAcountClassifiication().equals("교통")) {
				tS += Integer.parseInt(acDto.get(i).getAcountPrice());
			} else if (acDto.get(i).getAcountClassifiication().equals("숙박")) {
				hS += Integer.parseInt(acDto.get(i).getAcountPrice());
			} else if (acDto.get(i).getAcountClassifiication().equals("기타")) {
				eS += Integer.parseInt(acDto.get(i).getAcountPrice());
			}
		}
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>MYPAGE</title>
<jsp:include page="../config.jsp" flush="false" />
<link href="./css/member.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([ [ '항목', '가격' ],
				[ '식비',
<%=fS%>
	], [ '쇼핑',
<%=sS%>
	], [ '관광',
<%=gS%>
	],
				[ '교통',
<%=tS%>
	], [ '숙박',
<%=hS%>
	], [ '기타',
<%=eS%>
	] ]);

		var options = {
			title : '예산 그래프',
			pieHole : 0.4,
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('donutchart'));
		chart.draw(data, options);
	}
</script>
</head>
<body>
	<div class="tbg"></div>
	<div class="tbgB">
		<h3>예산항목추가</h3>
		<form:form modelAttribute="budgetDD" action="budgetDD" method="POST"
			id="budgetDDFrm">
			<input type="hidden" name="budgetCode" value="<%=budgeCode%>">
			<table>
				<tr>
					<td>항목명</td>
					<td><input type="text" name="acountItemName"></td>
				</tr>
				<tr>
					<td>분류</td>
					<td><select name="acountClassifiication">
							<option>식비</option>
							<option>쇼핑</option>
							<option>관광</option>
							<option>교통</option>
							<option>숙박</option>
							<option>기타</option>
					</select></td>
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
			<button class="budgetABt1" id="budgetaddBt">추가</button>
			<div class="budgetCBt1">취소</div>
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

			<div id="donutchart" style="width: 700px; height: 700px; position: relative; left: -5%;"></div>
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
							<%
								if (acDto == null) {
							%>
							<tr>
								<td colspan="5">항목이 존재하지 않습니다.</td>
							</tr>
							<%
								} else {
									for (int i = 0; i < acDto.size(); i++) {
										sum += Integer.parseInt(acDto.get(i).getAcountPrice());
										Date od = o.parse(acDto.get(i).getAcountDate());
										String date = n.format(od);
							%>
							<tr>
								<td><%=acDto.get(i).getAcountItemName()%></td>
								<td><%=acDto.get(i).getAcountClassifiication()%></td>
								<td><%=acDto.get(i).getAcountContents()%></td>
								<td><%=dc.format(Integer.parseInt(acDto.get(i).getAcountPrice()))%>
									원</td>
								<td><%=date%></td>

							</tr>
							<%
								}
								}
							%>
						</tbody>
					</table>
				</div>
				<div style="position: relative; top: -150px; right: -120px;">
					<div id="budgetUse">
						총액 :
						<%=dc.format(sum)%>
						원
					</div>
					<div class="budgetABt" id="babt">추가</div>
					<div class="budgetCBt" id="">삭제</div>
				</div>

			</div>
		</div>
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>