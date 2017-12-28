<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="Model.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
	MemberDTO memberdto = (MemberDTO) session.getAttribute("login");
	String memId = memberdto.getMemberId();
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
<script type="text/javascript" src="./scripts/noticescripts.js"
	charset="utf-8"></script>
<style type="text/css">
#container {
	padding-left: 220px;
	width: 1200px;
}

.notice_title {
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

.notice_content {
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
	font-family: inherit;
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

.add {
	width: 150px;
	height: 35px;
	background-color: #337ab7;
	padding-top: 12px;
	font-weight: bold;
	color: #FFFFFF;
	text-align: center;
	vertical-align: middle;
	display: inline-block;
	cursor: pointer;
}

.cancel {
	width: 150px;
	height: 35px;
	background-color: #686868;
	padding-top: 12px;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
	color: #FFFFFF;
	display: inline-block;
}

.bottom {
	padding-top: 80px;
	padding-left: 420px;
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
					<li><a href="#">기차</a></li>
					<li><a href="#">대여</a></li>
					<li><a href="#">여행지</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div id="mid1"
		style="display: inline-block; width: 85%; min-height: 700px; margin-left: 280px;">
		<div id="container">
			<h2>공지사항등록</h2>
			<br>
			<p>
				<span style="color: red">*</span> 표시는 필수사항이므로 반드시 입력해주시기 바랍니다.
			<hr>
			<form:form modelAttribute="notice" id="notice_frm">
				<table class="m_table">
					<colgroup>
						<col span="1" width="20%" style="background: #f9fafc" />
						<col width="70%" />
					</colgroup>
					<tr>

						<td class="con_label"><span style="color: red">*</span> 공지제목
							<input type="hidden" value="<%=memId%>" name="memberId" /></td>
						<td class="con_input"><input class="notice_title" type="text"
							size="100px" name="noticeTitle" />
					</tr>
					<tr>
						<td class="tent_label"><span style="color: red">*</span> 공지내용</td>
						<td class="tent_input"><textarea class="notice_content"
								name="noticeContent"></textarea>
					</tr>
					<tr>
						<td class="file_label">첨부파일</td>
						<td class="file_input">

							<div class="filebox preview-image">
								<input class="file" disabled="disabled" /> <label
									for="ex_filename">업로드</label> <input type="file"
									id="ex_filename" class="upload-hidden" />
							</div>
					</tr>
				</table>
			</form:form>
			<div class="bottom">
				<p class="add">등 록</p>
				<p class="cancel">취 소</p>
			</div>
		</div>
	</div>
	<div id="left"
		style="width: 12%; min-height: 100%; top: 100px; position: absolute; background-color: #595959;">

		<ul>
			<li style="margin-bottom: 30px; margin-top: 30px;"><a href="#">회원
					정보보기</a></li>
			<li style="margin-bottom: 30px;"><a href="#">기업 정보보기</a></li>
			<li style="margin-bottom: 30px;"><a href="noticeAdmin">공지사항
					등록</a></li>
			<li style="margin-bottom: 30px;"><a href="#">블랙리스트</a></li>

		</ul>
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>