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
	left: 55%;
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
	    top: 10px;
}

.no_line td {
	height: 50px;
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
		<div class="container">
		<div class="row">
			<input type="button" class="notice_add" style="width: 80pt; height: 20pt;" value="공지등록" />

		</div>
			<table class="noticeTable" style="text-align: center;  width: 100%;" >
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
				<tr class="no_line"id="<%=list.get(i).getNoticeNum()%>">
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
						<li><a href="noticeAdmin?menu=NOTICE&page=<%=i + 1%>"><%=i + 1%></a></li>

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
	<div id="left"
		style="width: 12%; min-height: 900px; height: 105%; top: 100px; position: absolute; background-color: #595959;">

		<ul>
			<li style="margin-bottom: 30px; margin-top: 30px;"><a href="MemberAll">회원 정보보기</a></li>
			<li style="margin-bottom: 30px;"><a href="CoperAll">기업 정보보기</a></li>
			<li style="margin-bottom: 30px;"><a href="noticeAdmin">공지사항 등록</a></li>
			<li style="margin-bottom: 30px;"><a href="inquiryAdmin">1:1문의 답변(일반)</a></li>
			<li style="margin-bottom: 30px;"><a href="corInquiryAdmin">1:1문의 답변(기업)</a></li>	
		</ul>
	</div>
		<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>