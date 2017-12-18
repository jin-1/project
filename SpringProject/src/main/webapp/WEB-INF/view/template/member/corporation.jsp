<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<link href="./css/train.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="./scripts/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="./scripts/script.js" charset="utf-8"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
.mid {
	margin: auto;
}

.container {
	
}

.c_table {
	width: 100%;
	border-top: 1px solid #D5D5D5;
	border-collapse: collapse;
	width: 60%;
}

.c_table td {
	padding: 15px;
	border-bottom: 1px solid #D5D5D5;
}

.c_table tr {
	height: auto;
	border-bottom: 1px solid #D5D5D5;
}

.c_table p {
	font-size: 12px;
	color: #FF8224;
}

.addrIn input {
	margin: 5px;
}

.c_confirm {
	width: 150px;
	height: 35px;
	background-color: #3163C9;
	padding-top: 12px;
	font-weight: bold;
	color: #FFFFFF;
	text-align: center;
	vertical-align: middle;
	display: inline-block
}

.c_cancel {
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
	text-align: center;
}
</style>
</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<div id="container">
			<h2>기업회원가입</h2>
			<hr />
			<form:form id="c_frm" modelAttribute="corregister">
				<div id="form">
					<table class="c_table">
						<colgroup>
							<col span="1" width="20%" style="background: #EAEAEA" />
							<col width="70%" />
						</colgroup>
						<tr>
							<td>ID</td>
							<td><input type="text" class="c_id" maxlength="15" size="20" name="corporId"/>&nbsp;
								<span class="idConfirm"></span> <br />
								<p>ID는 문자, 숫자, 특수문자로 최소 4글자 이상이여야 됩니다.</p></td>
						</tr>
						<tr>
							<td>비밀번호</td>

							<td><br />
							<input type="password" class="c_pw" size="15" name="corporPw" /><br />
								<p>비밀번호는 8자리 이상 15자리 이하 문자, 숫자 혹은 특수문자를 반드시 포함해야 합니다.</p></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" class="c_pwC" size="15" /></td>
						</tr>
						<tr>
							<td>대표자명</td>
							<td><input type="text" class="c_name" maxlength="10" name="corporName"
								size="10" /></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><select id="c_NomSelect" class="c_phone">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select>&nbsp;-&nbsp; <input type="text" class="c_phone2" maxlength="4"
								size="5" /> &nbsp;-&nbsp; <input type="text" class="c_phone3"
								maxlength="4" size="5" />
								<input type="hidden" class="c_phone4" name="corporPhone">
								</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" class="c_mail1" size="10" />&nbsp;@
								<input type="email" class="c_mail2" size="10" /> <select
								name="c_mail2" id="c_NomSelect1" class="c_mail3">
									<option value="1" selected>직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									<option value="empas.com">empas.com</option>
									<option value="dreamwiz.com">dreamwiz.com</option>
									<option value="freechal.com">freechal.com</option>
									<option value="lycos.co.kr">lycos.co.kr</option>
									<option value="korea.com">korea.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hanmir.com">hanmir.com</option>
									<option value="paran.com">paran.com</option>
							</select>&nbsp;
							<input type="hidden" class="c_mail3" name="corporEmail" /></td>
						</tr>
						<tr>
							<td>주소</td>
							<td class="addrIn"><input type="text" maxlength="3" size="5"
								id="c_post1" />
								<button class="c_postConfirm">우편번호 검색</button>
								<br /> <input type="text" size="60" id="c_post2" /><br /> <input
								type="text" size="60" id="c_post3" />
								<input type="hidden" class="c_post4" name="corporAddr" />
								
								</td>
						</tr>
					</table>
					<p>기업등록은 마이페이지>사업등록을 통해 등록해주세요.!</p>
					<div class="bottom">
						<p class="c_confirm">가 입</p>
						<p class="c_cancel">취 소</p>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>