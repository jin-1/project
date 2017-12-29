<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="Model.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
	InquiryDTO inquiryDto = (InquiryDTO)request.getAttribute("inquiryDto");
	int num = Integer.parseInt(request.getParameter("num"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<link href="./css/train.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="./scripts/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="./scripts/memberscript.js"
	charset="utf-8"></script>
<script type="text/javascript" src="./scripts/cornoticescripts.js"
	charset="utf-8"></script>

<style type="text/css">
#container {
	padding-left: 220px;
	width: 1200px;
}

.content {
	width: 733px;
	height: 25px;
	background-color: #eff3f8;
	border: 1px solid #d6e0ed;
}

.m_table {
	border-bottom: 1px solid #dee5ed;
	border-top: 1px solid #dee5ed;
}

.con_label {
	text-align: center;
	border-bottom: 1px solid #dee5ed;
	padding: 5px 20px;
}

.con_input {
	border-bottom: 1px solid #dee5ed;
	padding: 5px 20px;
}

.tent_label {
	text-align: center;
	border-bottom: 1px solid #dee5ed;
	padding: 5px 20px;
}

.tent_input {
	border-bottom: 1px solid #dee5ed;
	padding: 5px 20px;
}

.tent {
	resize: none;
	width: 730px;
	height: 450px;
	background-color: #eff3f8;
	border: 1px solid #d6e0ed;
}
.ripple1 {
	resize: none;
	width: 730px;
	height: 450px;
	background-color: #eff3f8;
	border: 1px solid #d6e0ed;
}

.file_label {
	text-align: center;
	padding: 5px 20px;
}

.file_input {
	padding: 5px 20px;
}

.file {
	width: 500px;
	height: 25px;
	background-color: #eff3f8;
	border: 1px solid #d6e0ed;
	display: inline-block;
	padding: .5em .75em; /* label의 패딩값과 일치 */ 
	font-size: inherit; 
	font-family:inherit; 
	line-height: normal; 
	vertical-align: middle; 
	-webkit-appearance: none; 
	  /* 네이티브 외형 감추기 */
  	-moz-appearance: none; 
     appearance: none;

}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.filebox .upload-display { /* 이미지가 표시될 지역 */
	margin-bottom: 5px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */
	display: inline-block;
	width: 54px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img { /* 추가될 이미지 */
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
}
.index_list {
    width: 150px;
    height: 35px;
    background-color: #337ab7;
    padding-top: 13px;
    margin: auto;
    font-weight: bold;
    color: #FFFFFF;
    text-align: center;
    vertical-align: middle;
    display: inline-block;
    cursor: pointer;
}
.ripple_add1 {
    width: 150px;
    height: 35px;
    background-color: #337ab7;
    padding-top: 13px;
    margin: auto;
    font-weight: bold;
    color: #FFFFFF;
    text-align: center;
    vertical-align: middle;
    display: inline-block;
    cursor: pointer;
}
.bottom{
    padding-top: 80px;
    width: 100%;
    text-align: center;
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

	<div id="mid">
		<div id="container">
			<h2>1:1문의등록</h2>
			<br>
			<hr>
			<form:form modelAttribute="ripplye_conten1" id="ripply_frm1">
			<table class="m_table">
				<colgroup>
					<col span="1" width="20%" style="background: #f9fafc" />
					<col width="70%" />
				</colgroup>
				<tr>
					
					<td class="con_label"><span style="color: red">*</span> 문의제목
					
					</td>
					<td class="con_input"><input class="content" type="text"size="100px" name="inquiryTitle" value="<%=inquiryDto.getInquiryTitle()%>" disabled="disabled"/>
				</tr>
				<tr>
					<td class="tent_label"><span style="color: red">*</span> 문의내용</td>
					<td class="tent_input"><textarea class="tent" name="inquiryContent" disabled="disabled"><%=inquiryDto.getInquiryContent()%>
					</textarea>
					
				</tr>
				<tr>
					<td class="file_label">답변내용</td>
					<td class="file_input">
					<textarea class="ripple1" name="inquiryReply"></textarea>
					<input type="hidden" value="<%=num %>" name="peplyNum" />
					</td>
				</tr>
			</table>
			</form:form>
			<div class="bottom">
				<p class="ripple_add1">답변 등록</p>
				<p class="index_list">목 록</p>
			</div>
		</div>
	</div>
			<ul>
			<li style="margin-bottom: 30px; margin-top: 30px;"><a href="MemberAll">회원 정보보기</a></li>
			<li style="margin-bottom: 30px;"><a href="CoperAll">기업 정보보기</a></li>
			<li style="margin-bottom: 30px;"><a href="noticeAdmin">공지사항 등록</a></li>
			<li style="margin-bottom: 30px;"><a href="inquiryAdmin">1:1문의 답변(일반)</a></li>
			<li style="margin-bottom: 30px;"><a href="corInquiryAdmin">1:1문의 답변(기업)</a></li>
		</ul>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>