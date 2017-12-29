<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="Model.*,java.util.*,java.text.*"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
	List<InquiryDTO> list = (List<InquiryDTO>) request.getAttribute("page");
	PagingDTO pDto = (PagingDTO) request.getAttribute("page1");
	SimpleDateFormat o = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat o1 = new SimpleDateFormat("yyyy-MM-dd");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>MYPAGE</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<link href="./css/train.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="./scripts/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="./scripts/corporscript.js"
	charset="utf-8"></script>
<script type="text/javascript" src="./scripts/cornoticescripts.js"
charset="utf-8"></script>
<style>
#container {
	width: 80%;
	margin: auto;
	margin-top: 100px;
}

.mypage {
	list-style: none;
	width: 100%;
	margin: 0;
	padding: 0;
}

.mypage li {
	display: inline-block;
	width: 33%;
	margin: auto;
	margin-right: -5px;
	height: 250px;
	position: relative;
	background-color: #f7f7f7;
	border: #afacac 1px solid;
}

.mypage p {
	position: relative;
	top: 30px;
	width: 150px;
	display: inline-block;
	left: 170px;
	margin: 0;
	font-weight: bold;
	text-align: left;
	font-size: 25px;
}

.mypage li>ul {
	width: 207px;
	position: relative;
	top: 50px;
	left: 30px;
	font-size: 15px;
}

.mypage li>ul>li {
	height: 30px;
	width: 100px;
	border: none;
	display: block;
	border: none;
	cursor: pointer;
}

.mypage li>ul>li>a {
	text-decoration: none;
	color: black;
}

.mypage li>ul>li>a:focus {
	color: black;
}

.mypage li>ul>li>a:visited {
	color: black;
}

.mypage li>ul>li>a:hover {
	color: #4a4a4a;
}

.mypage img {
	width: 120px;
	position: absolute;
	top: 50px;
	left: 30px;
}

#oneOnone {
	padding-top: 80px;
}

.paging {
	left: 42%;
	margin-left: -200px;
	top: 50px;
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
}

.line td {
	height: 50px;
}

.row {
	padding-left: 1121px;
	padding-bottom: 0.5%;
}

.noticeTable {
	text-align: center;
	width: 1230px;
}

.noticeTable td {
	
}
.add{
top: -30px;
}
</style>
</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<div id="container">
			<h3>MYPAGE</h3>

			<div id="mypage">
				<ul class="mypage">
					<li><p>내정보관리</p> <img src="img/mypage.png">
						<ul>
							<li><a href="corPageCon?menu=MyPage">내정보수정</a></li>
							<li><a href="corPageCon2?menu=MyPage">회원탈퇴</a></li>

						</ul></li>
					<li class="add"><p>사업지등록</p> <img src="img/mypage.png">
						<ul>
							<li><a href="TourAdd?menu=MyPage">내 사업지 등록</a></li>
						</ul></li>
				</ul>
			</div>

			<div id="oneOnone">
				<h3>1:1문의</h3>
				<div class="row">
					<input type="button" class="inquiry_add"
						style="left-padding: 100px; width: 80pt; height: 20pt;"
						value="문의등록" />
				</div>
				<table class="noticeTable">
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
								style="background-color: #eeeeee; text-align: center;">답변여부</th>
						</tr>
					</thead>

					<%
						for (int i = 0; i < list.size(); i++) {

							Date to = o.parse(list.get(i).getInquiryDate());
							String n = o1.format(to);
					%>

					<tr class="line" id="<%=list.get(i).getInquiryNum()%>">

						<td><%=list.get(i).getInquiryNum()%></td>
						<td><%=list.get(i).getInquiryTitle()%></td>
						<td><%=n%></td>
						<td>
							<%
								if (list.get(i).getInquiryReplyNum() == 1) {
							%> 답변완료 <%
								} else {
							%> 답변대기<%
								}
							%>
						</td>

					</tr>

					<%
						}
					%>

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
						<li><a href="MyPage?menu=MyPage&img=mypageimg2&page=<%=i + 1%>"><%=i + 1%></a></li>

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
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>