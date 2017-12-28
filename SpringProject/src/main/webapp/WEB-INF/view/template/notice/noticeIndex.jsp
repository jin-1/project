<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="Model.*,java.util.*,java.text.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
	List<NoticeDTO> list = (List<NoticeDTO>) request.getAttribute("page");
	PagingDTO pDto = (PagingDTO) request.getAttribute("page1");
	SimpleDateFormat o = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat o1 = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TRENVIAJES</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<link href="./css/train.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="./scripts/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="./scripts/noticescripts.js"></script>
<style>
th, td {
	border-bottom: 1px solid #dddddd;
}

.container {
	position: absolute;
	top: 250px;
	left: 50%;
	transform: translate(-50%, -50%)
}

.paging {
	position: relative;
	left: 50%;
	margin-left: -200px;
	top: 100px;
}

.paging ul {
	list-style: none;
	margin: 0;
	padding: 0 5px;
}

.paging li {
	display: inline;
	float: left;
	padding: 4px;
	margin-right: 3px;
	width: 40px;
	color: #000;
	font: bold 13px tahoma;
	border: 1px solid #eee;
	text-align: center;
	text-decoration: none;
}

.noticeTable {
	table-layout: fixed;
	height: auto;
	position: relative;
	top: 40px;
}

.detail_line td {
	height: 75px;
}
.row{
    padding-top: 110px;
        padding-left: 1158px;
}
#notice_add{
	cursor:pointer;
}
</style>

</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<div class="container">
			<table class="noticeTable" style="text-align: center;" width="1500">
					<colgroup>
						<col width="10%" />
						<col width="80%" />
						<col width="20%" />
						<col width="20%" />
					</colgroup>
				<thead>
					<tr>
						<th height="50"
							style="background-color: #eeeeee; text-align: center;">글번호</th>
						<th height="50"
							style="background-color: #eeeeee; text-align: center;">제목</th>
						<th height="50"
							style="background-color: #eeeeee; text-align: center;">등록일</th>
						<th height="50"
							style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<%
					for(int i=0; i<list.size();i++){
						
						Date to = o.parse(list.get(i).getNoticeDate());
						String n = o1.format(to);
				%>
				<tr class="detail_line"id="<%=list.get(i).getNoticeNum()%>">
					<td><%=list.get(i).getNoticeNum() %></td>
					<td><%=list.get(i).getNoticeTitle() %></td>
					<td><%=n%></td>
					<td><%=list.get(i).getNoticeCount() %></td>
				</tr>
				<%} %>
			</table>
			<div class="paging">
				<ul class="pagination">
				
						<%
							if (pDto.getFinalPageNo() > 1) {
								
						%>
						
						<li><a href="#"+>Prev</a></li>
						<%
							}
						%>
						<%
							for (int i = 0; i < pDto.getSizeOfPage(); i++) {
						%>
						<li><a href="NoticeIndex?menu=NOTICE&img=notice&page=<%=i + 1%>"><%=i + 1%></a></li>

						<%
							}
						%>
						<%
							if (pDto.getFinalPageNo() > 1) {
						%>
						<li><a href="#">Next</a></li>
						<%
							}
						%>
				</ul>
			</div>
		</div>
	</div>
		<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>