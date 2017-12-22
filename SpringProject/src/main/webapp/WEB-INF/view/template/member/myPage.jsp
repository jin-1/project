<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="Model.*"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
	MemberDTO memberdto = (MemberDTO) session.getAttribute("login");
	
	String memberId = memberdto.getMemberId();
	String memberPw = memberdto.getMemberPw();
	String memberName = memberdto.getMemberName();
	String memberPhone = memberdto.getMemberPhone();
	String memberInte = memberdto.getInteRest();
	String memberMail = memberdto.getMemberEmail();
	String memberPost = memberdto.getMemberAddr();
	String[] check = memberInte.split(",");
	String[] check2 = memberPhone.split("-");
	String[] check3 = memberMail.split("@");
	String[] check4 = memberPost.split("/");
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
<script type="text/javascript" src="./scripts/memberscript.js"
	charset="utf-8"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	//관심사 값 체크
	<%for (int i = 0; i < check.length; i++) {
				for (int z = 1; z < 13; z++) {%>
		if($('input:checkbox[id="inter<%=z%>"]').val() == "<%=check[i]%>"){
			console.log('cdd');
			$('input:checkbox[id="inter<%=z%>"]').prop('checked', true);
		}
	<%}}%>
	});
</script>
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

.myPage_confirm {
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

.myPage_cancel {
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

.m_idcheck {
	padding-top: 20px;
}

.tour {
	width: 20%;
}
</style>
</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<div id="container">
			<h2>내정보수정</h2>
			<hr />
			<form:form id="myPageFrm" modelAttribute="myPageRevise">
				<div id="form">
					<table class="m_table">
						<colgroup>
							<col span="1" width="20%" style="background: #EAEAEA" />
							<col width="70%" />
						</colgroup>
						<tr>
							<td>ID</td>
							<td class="m_idcheck">
							<input type="text" class="MyPage_id" maxlength="15" size="20" value="<%=memberId%>" name="memberId" />&nbsp;
								<br />
								<p>ID는 변경이 불가합니다.</p></td>
						</tr>
						<tr>
							<td>비밀번호</td>

							<td><br /> <input type="password" class="myPage_pw"
								size="15" value="<%=memberPw%>" name="memberPw" /><br />
								<p>비밀번호는 8자리 이상 15자리 이하 문자, 숫자 혹은 특수문자를 반드시 포함해야 합니다.</p></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" class="myPage_pwC" size="15"
								value="<%=memberPw%>" /></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" class="myPage_name" maxlength="10"
								value="<%=memberName%>" size="10" name="memberName" /></td>

						</tr>
						<tr>
							<td>전화번호</td>
							<td><select name="hpNo1" id="hpNoSelect" class="myPage_phone1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select>&nbsp;-&nbsp; 
							<input type="text" class="myPage_phone2"maxlength="4" size="5" value="<%=check2[1]%>" /> &nbsp;-&nbsp;
							<input type="text" class="myPage_phone3" maxlength="4" size="5" value="<%=check2[2]%>" /> 
							<input type="hidden" class="myPage_phone4" name="memberPhone" /></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" class="myPage_mail1" size="10"
								value="<%=check3[0]%>" />&nbsp;@ <input type="email"
								class="myPage_mail2" size="10" value="<%=check3[1]%>" />&nbsp;
								<select name="c_mail2" id="m_NomSelect1" class="myPage_mail3">
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
							</select> <input type="hidden" class="myPage_mail4" name="memberEmail" />
							</td>
						</tr>
						<tr>
							<td>주소</td>
							<td class="addrIn"><input type="text" maxlength="5" size="8"
								id="myPage_post1" value="<%=check4[0]%>"/>
								<button class="mypage_post">우편번호 검색</button> <br /> <input
								type="text" size="60" id="myPage_post2" value="<%=check4[1]%>"/><br /> <input
								type="text" size="60" id="myPage_post3" value="<%=check4[2]%>"/> <input type="hidden"
								id="myPage_post4" name="memberAddr" /></td>

						</tr>
						<tr>
							<td rowspan="3">관심사</td>
							<td class="tour">관광지 &nbsp;&nbsp;&nbsp;&nbsp; <label><input
									type="checkbox" name="mypage_inter" id="inter1" class="mem_in" value="레저" />레저</label> <label><input
									type="checkbox" name="mypage_inter" id="inter2" class="mem_in" value="스포츠" />스포츠</label> <label><input
									type="checkbox" name="mypage_inter" id="inter3" class="mem_in" value="역사" />역사 </label> <label><input
									type="checkbox" name="mypage_inter" id="inter4" class="mem_in" value="축제" />축제</label>
							</td>
						</tr>
						<tr>
							<td>맛&nbsp;&nbsp;&nbsp;집&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label><input
									type="checkbox" name="mypage_inter" id="inter5" class="mem_in" value="한식" />한식</label> <label><input
									type="checkbox" name="mypage_inter" id="inter6" class="mem_in" value="일식" />일식</label> <label><input
									type="checkbox" name="mypage_inter" id="inter7" class="mem_in" value="중식" />중식 </label> <label><input
									type="checkbox" name="mypage_inter" id="inter8" class="mem_in" value="양식" />양식</label>
							</td>
						</tr>
						<tr>
							<td>숙&nbsp;&nbsp;&nbsp;박&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label><input
									type="checkbox" name="mypage_inter" id="inter9" class="mem_in" value="호텔" />호텔</label> <label><input
									type="checkbox" name="mypage_inter" id="inter10" class="mem_in" value="모텔" />모텔</label> <label><input
									type="checkbox" name="mypage_inter" id="inter11" class="mem_in" value="찜질방" />찜질방</label> <label><input
									type="checkbox" name="mypage_inter" id="inter12" class="mem_in" value="게스트하우스" />게스트하우스</label>
								<br />
								<p>관심사는 최대 6개까지 고를수 있습니다.</p>
								<input type="hidden" class="mypage_in" name="inteRest" />
							</td>
						</tr>
					</table>
					<div class="bottom">
						<p class="myPage_confirm">수 정</p>
						<p class="myPage_cancel">취 소</p>
					</div>	
				</div>
		</form:form>
	</div>
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>