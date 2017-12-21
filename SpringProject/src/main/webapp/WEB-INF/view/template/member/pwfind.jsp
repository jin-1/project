<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
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
<script type="text/javascript" src="./scripts/memberscript.js" charset="utf-8"></script>
<style type="text/css">
.container {
	left: 60%;
	display: block;
}

.id_pwFind {
	padding-top: 5%;
	padding-left: 30%;
	width: 80%;
	height: 100px;
}

.id_pwFind ul {
	list-style: none;
	margin: 0;
	padding: 0 5px;
	display: inline;
}

.idfind {
	float: left;
	padding: 4px;
	margin-right: 3px;
	width: 300px;
	height: 40px;
	font: bold 13px tahoma;
	border: 1px solid #eee;
	text-align: center;
	text-decoration: none;
	font-size: 20px;
	padding-top: 20px;
	background-color: white;
}

.pwfind {
	float: left;
	padding: 4px;
	margin-right: 3px;
	width: 300px;
	height: 40px;
	font: bold 13px tahoma;
	border: 1px solid #eee;
	text-align: center;
	text-decoration: none;
	font-size: 20px;
	padding-top: 20px;
	background-color: #474747;
}

.t_ipFind {
	display: block;
	padding-left: 18%;
	width: 100%;
}

.t_ip {
	border-top: 1px solid #D5D5D5;
	border-bottom: 1px solid #D5D5D5;
	border-collapse: collapse;
	width: 60%;
	padding: 50%;
}

.t_ip td {
	padding: 2%;
}

.cor_idFind {
	border-top: 1px solid #474747;
}

.m_id {
	background-color: #EAEAEA;
	text-align: center;
}

.c_id {
	background-color: #EAEAEA;
	text-align: center;
}

.mem_sea1 {
	background: #626564;
	color: #fff;
	border: none;
	position: relative;
	height: 45px;
	font-size: 18px;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

.mem_sea1:hover {
	background: #fff;
	color: #626564;
}

.mem_sea1:before, .mem_sea1:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #626564;
	transition: 400ms ease all;
}

.mem_sea1:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.mem_sea1:hover:before, .mem_sea:hover:after {
	width: 60%;
	transition: 800ms ease all;
}

.cor_sea1 {
	background: #626564;
	color: #fff;
	border: none;
	position: relative;
	height: 45px;
	font-size: 18px;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

.cor_sea1:hover {
	background: #fff;
	color: #626564;
}

.cor_sea1:before, .cor_sea1:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #626564;
	transition: 400ms ease all;
}

.cor_sea1:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.cor_sea1:hover:before, .cor_sea1:hover:after {
	width: 60%;
	transition: 800ms ease all;
}

.main {
	background: #626564;
	color: #fff;
	border: none;
	position: relative;
	height: 45px;
	font-size: 18px;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

.bottom {
	padding-top: 7%;
	padding-left: 45%;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<div class="container">
			<h2>아이디/비밀번호 찾기</h2>
			<hr />
			<div class="id_pwFind">
				<ul>
					<li class="idfind"><a href="IdFind?menu=Find" class="a_idFind">아이디 찾기</a></li>
					<li class="pwfind"><a href="PwFind?menu=Find" class="a_pwFind">비밀번호 찾기</a></li>
				</ul>
			</div>
			<div class="t_ipFind">
				<table class="t_ip">
				<form:form id="pwfrm">
					<tr>
						<td rowspan="3" class="m_id">일반회원 아이디 찾기</td>
						<td>아이디 &nbsp;&nbsp;<input type="text" size="28" name="memberId"></td>
						<td rowspan="3"><button type="button" class="mem_sea1">검 색</button></td>

					</tr>
					<tr>
						<td>성&nbsp;&nbsp; 명&nbsp;&nbsp;&nbsp;<input type="text"
							maxlength="10" size="28" name="memberName"/></td>
					</tr>
					<tr>
						<td>이 메 일 <input type="text" class="pwEmail1" 
								size="15" /> @ <input type="text" class="pwEmail2" 
								size="10" /><input type="hidden" class="pwEmail3"
								name="memberEmail" />
						</td>	
					</tr>
					</form:form>
					<form:form id="pwfrm2">
					<tr class="cor_idFind">
						<td rowspan="3" class="c_id">기업회원 아이디 찾기</td>
						<td>아이디&nbsp;&nbsp;&nbsp; <input type="text" size="28" name="corporId"></td>
						<td rowspan="3"><button type="button" class="cor_sea1">검 색</button></td>
					</tr>
					<tr>
						<td>대표자명 &nbsp; <input type="text" maxlength="10" name="corporName"
							size="28" /></td>

					</tr>
					<tr>
						<td>이 메 일 <input type="text" class="c_pwEmail1" 
								size="15" /> @ <input type="text" class="c_pwEmail2" 
								size="10" /><input type="hidden" class="c_pwEmail3"
								name="corporEmail" />
						</td>	
					</tr>
					</form:form>
				</table>
			</div>
			<div class="bottom">
				<button class="main">메인으로</button>
			</div>

		</div>
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>