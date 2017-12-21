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
<script type="text/javascript">
</script>
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
	background-color: #474747;
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
	border: 1 px solid #474747;
	background-color: white;
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

.mem_sea {
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

.mem_sea:hover {
	background: #fff;
	color: #626564;
}

.mem_sea:before, .mem_sea:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #626564;
	transition: 400ms ease all;
}

.mem_sea:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.mem_sea:hover:before, .mem_sea:hover:after {
	width: 60%;
	transition: 800ms ease all;
}

.cor_sea {
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

.cor_sea:hover {
	background: #fff;
	color: #626564;
}

.cor_sea:before, .cor_sea:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #626564;
	transition: 400ms ease all;
}

.cor_sea:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.cor_sea:hover:before, .cor_sea:hover:after {
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
					<li class="idfind"><a href="IdFind?menu=Find" class="a_idFind">아이디
							찾기</a></li>
					<li class="pwfind"><a href="PwFind?menu=Find" class="a_pwFind">비밀번호
							찾기</a></li>
				</ul>
			</div>
			<div class="t_ipFind">
				<table class="t_ip">
				
					<form:form id="frm1">
						<tr>
							<td rowspan="2" class="m_id">일반회원 아이디 찾기</td>
							<td>성&nbsp;&nbsp; 명&nbsp;&nbsp;&nbsp;<input type="text"
								maxlength="10" size="28" class="memName" name="memberName" /></td>
							<td rowspan="2"><button type="button" class="mem_sea">검색</button></td>
						</tr>
						<tr>
							<td>이 메 일 <input type="text" class="email1" 
								size="15" /> @ <input type="text" class="email2" 
								size="10" /><input type="hidden" class="email3"
								name="memberEmail" />
							</td>	
						</tr>
					</form:form>
					<form:form id="frm2">
					<tr class="cor_idFind">
						<td rowspan="2" class="c_id">기업회원 아이디 찾기</td>
						<td>대표자명 &nbsp;<input type="text" maxlength="10"size="28" name="corporName" class="corName" /></td>
						<td rowspan="2"><button type="button" class="cor_sea">검 색</button></td>
					</tr>
					<tr>
						<td>이 메 일 <input type="text" class="c_email1" 
								size="15" /> @ <input type="text" class="c_email2" 
								size="10" /><input type="hidden" class="c_email3"
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