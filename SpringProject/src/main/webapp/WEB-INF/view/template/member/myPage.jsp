<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = request.getParameter("menu");
	String target = "./template/menu/" + request.getParameter("target") + ".jsp";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<link href="./css/train.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="./scripts/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="./scripts/script.js" charset="utf-8"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
.mid {
	margin: auto;
}

.container {
	
}

.m_table {
	width: 100%;
	border-top: 1px solid #D5D5D5;
	border-collapse: collapse;
	width: 60%;
}

.m_table td {
	padding: 15px;
	border-bottom: 1px solid #D5D5D5;
}

.m_table tr {
	height: auto;
	border-bottom: 1px solid #D5D5D5;
}

.m_table p {
	font-size: 12px;
	color: #FF8224;
}

.addrIn input {
	margin: 5px;
}

.m_confirm {
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

.m_cancel {
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
.m_idcheck{
	padding-top:20px;
}
.tour{
	width:20%;
}
</style>
</head>
<body>
	<div id="top">
		<jsp:include page="./template/top.jsp?menu=<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<div id="container">
			<h2>내정보수정</h2>
			<hr />
			<div id="form">
				<table class="m_table">
					<colgroup>
						<col span="1" width="20%" style="background: #EAEAEA" />
						<col width="70%" />
					</colgroup>
					<tr>
						<td>ID</td>
						<td class="m_idcheck"><input type="text" class="mc_id" maxlength="15" size="20" />&nbsp;
							<br />
							<p>ID 중복검사를 해주세요. ID는 문자, 숫자, 특수문자로 최소 4글자 이상이여야 됩니다.</p>
							</td>
					</tr>
					<tr>
						<td>비밀번호</td>

						<td><br /> <input type="password" class="mc_pw" size="15" /><br />
							<p>비밀번호는 8자리 이상 15자리 이하 문자, 숫자 혹은 특수문자를 반드시 포함해야 합니다.</p></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" class="mc_pwC" size="15" /></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" class="mc_name" maxlength="10"
							size="10" /></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><select name="hpNo1" id="hpNoSelect" class="mc_phone1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select>&nbsp;-&nbsp; <input type="text" class="mc_phone2" maxlength="4"
							size="5" /> &nbsp;-&nbsp; <input type="text" class="mc_phone3"
							maxlength="4" size="5" /></td>
					</tr>
					<tr>
						<td>생년 월 일</td>
						<td><input type="date" maxlength="4" class="mc_year" size="7" />
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" class="m_mail1" size="10" />&nbsp;@
							<input type="email" class="m_mail2" size="10" />&nbsp; <select
							name="c_mail2" id="m_NomSelect1" class="mc_mail3">
								<option value="1">직접입력</option>
								<option value="naver.com" selected>naver.com</option>
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
						</select></td>
					</tr>
					<tr>
						<td>주소</td>
						<td class="addrIn"><input type="text" maxlength="5" size="8" id="mc_post1"/>
							<button class="postConfirm">우편번호 검색</button> <br /> 
							<input type="text" size="60" id="mc_post2"/><br /> 
							<input type="text" size="60" id="mc_post3"/></td>
					</tr>
					<tr>
						<td>성별</td>
						<td><label><input type="radio" name="gender" checked />
								남성</label> <label><input type="radio" name="gender" /> 여성</label></td>
					</tr>
					<tr>
						<td rowspan="3">관심사</td>
						<td class="tour">관광지  &nbsp;&nbsp;&nbsp;&nbsp;
						<label><input type="checkbox" />레저</label>
						<label><input type="checkbox" />스포츠</label>
						<label><input type="checkbox" />역사 </label>
						<label><input type="checkbox" />축제</label>
					    </td>
					</tr>
					<tr>
						<td>맛&nbsp;&nbsp;&nbsp;집&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label><input type="checkbox" />한식</label>
						<label><input type="checkbox" />일식</label>
						<label><input type="checkbox" />중식 </label>
						<label><input type="checkbox" />양식</label>
						</td>
					</tr>
					<tr>
						<td>숙&nbsp;&nbsp;&nbsp;박&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label><input type="checkbox" />호텔</label>
						<label><input type="checkbox" />모텔</label>
						<label><input type="checkbox" />찜질방</label>
						<label><input type="checkbox" />게스트하우스</label> <br/>
						<p>관심사는 최대 6개까지 고를수 있습니다.</p>
						</td>
					</tr>
				</table>
				<div class="bottom">
					<p class="m_confirm">가 입</p>
					<p class="m_cancel">취 소</p>
				</div>
			</div>
		</div>
	</div>
	<div id="bot"></div>
</body>
</html>