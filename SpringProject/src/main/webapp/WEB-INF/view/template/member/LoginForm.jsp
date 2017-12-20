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
<title>Login</title>
<script type="text/javascript" src="./scripts/memberscript.js" charset="utf-8"></script>
<jsp:include page="../config.jsp" flush="false" />

<style type="text/css">
.form {
	z-index: 0;
	position: relative;
	background: #FFFFFF;
	width: 600px;
	border-radius: 4px;
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
	box-sizing: border-box;
	margin: 100px auto 10px;
	overflow: hidden;
}

.form-group {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-flex-wrap: wrap;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	-webkit-box-pack: justify;
	-webkit-justify-content: space-between;
	-ms-flex-pack: justify;
	justify-content: space-between;
	margin: 0 0 20px;
}

.form-group:last-child {
	margin: 0;
}

.form-group label {
	display: block;
	margin: 0 0 10px;
	color: rgba(0, 0, 0, 0.6);
	font-size: 12px;
	font-weight: 500;
	line-height: 1;
	text-transform: uppercase;
	letter-spacing: .2em;
}

.two .form-group label {
	color: #FFFFFF;
}

.form-group input {
	outline: none;
	display: block;
	background: rgba(0, 0, 0, 0.1);
	width: 100%;
	border: 0;
	border-radius: 4px;
	box-sizing: border-box;
	padding: 12px 20px;
	color: rgba(0, 0, 0, 0.6);
	font-family: inherit;
	font-size: inherit;
	font-weight: 500;
	line-height: inherit;
	-webkit-transition: 0.3s ease;
	transition: 0.3s ease;
}

.form-group input:focus {
	color: rgba(0, 0, 0, 0.8);
}

.two .form-group input {
	color: #FFFFFF;
}

.two .form-group input:focus {
	color: #FFFFFF;
}

.form-group button {
	outline: none;
	background: #4285F4;
	width: 100%;
	border: 0;
	border-radius: 4px;
	padding: 12px 20px;
	color: #FFFFFF;
	font-family: inherit;
	font-size: inherit;
	font-weight: 500;
	line-height: inherit;
	text-transform: uppercase;
	cursor: pointer;
}

.form-group .form-remember {
	font-size: 15px;
	font-weight: 400;
	letter-spacing: 0;
	text-transform: none;
}

.form-group .form-remember input[type='checkbox'] {
	display: inline-block;
	width: auto;
	margin: 0 10px 0 0;
}

.form-group .form-recovery {
	color: #4285F4;
	font-size: 12px;
	text-decoration: none;
}

.form-panel {
	padding: 60px calc(5% + 60px) 60px 60px;
	box-sizing: border-box;
}

.form-panel.one:before {
	content: '';
	display: block;
	opacity: 0;
	visibility: hidden;
	-webkit-transition: 0.3s ease;
	transition: 0.3s ease;
}

.form-panel.one.hidden:before {
	display: block;
	opacity: 1;
	visibility: visible;
}

.form-panel.two {
	z-index: 5;
	position: absolute;
	top: 0;
	left: 95%;
	background: #4285F4;
	width: 100%;
	min-height: 100%;
	padding: 60px calc(10% + 60px) 60px 60px;
	-webkit-transition: 0.3s ease;
	transition: 0.3s ease;
	cursor: pointer;
}

.form-panel.two:before, .form-panel.two:after {
	content: '';
	display: block;
	position: absolute;
	top: 60px;
	left: 1.5%;
	background: rgba(255, 255, 255, 0.2);
	height: 30px;
	width: 2px;
	-webkit-transition: 0.3s ease;
	transition: 0.3s ease;
}

.form-panel.two:after {
	left: 3%;
}

.form-panel.two:hover {
	left: 93%;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.form-panel.two:hover:before, .form-panel.two:hover:after {
	opacity: 0;
}

.form-panel.two.active {
	left: 10%;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	cursor: default;
}

.form-panel.two.active:before, .form-panel.two.active:after {
	opacity: 0;
}

.form-header {
	margin: 0 0 40px;
}

.form-header h1 {
	padding: 4px 0;
	color: #4285F4;
	font-size: 24px;
	font-weight: 700;
	text-transform: uppercase;
}
</style>
</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<div class="form">
			<div class="form-toggle"></div>
			<div class="form-panel one">
				<div class="form-header">
					<h1>TRENVIAJES Login</h1>
				</div>
				<div class="form-content" id="memFrm">
					<!-- 로그인 폼 -->
					<form:form modelAttribute="login">
						<div class="form-group">
							<label for="username">MEMBER ID</label> <input type="text"
								id="username" name="memberId" />
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								id="password" name="memberPw" />
						</div>
						<div class="form-group">
							<label class="form-remember"> <input type="checkbox" class="corCheck" />Corporation?
							</label> <a href="IdFind?menu=Find" class="form-recovery">Forgot ID/PW?</a> <a
								href="Register?menu=Register" class="form-recovery">REGISTER ACCOUNT</a>
						</div>
						<div class="form-group">
							<button type="submit">Log In</button>
						</div>
					</form:form>
				</div>
				<div class="form-content" style="display:none;" id="corFrm">
				
					<!-- 로그인 폼 -->
					<form:form modelAttribute="corlogin" action="CorLoginForm">
						<div class="form-group">
							<label for="username">CORPORRATION ID</label> <input type="text"
								id="username" name="corporId" />
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								id="password" name="corporPw" />
						</div>
						<div class="form-group">
							<label class="form-remember"> <input type="checkbox" class="corCheck" />Corporation?
							</label> <a href="IdFind?menu=Find" class="form-recovery">Forgot ID/PW?</a> <a
								href="Register?menu=Register" class="form-recovery">REGISTER ACCOUNT</a>
						</div>
						<div class="form-group">
							<button type="submit">Log In</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>