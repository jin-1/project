<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = request.getParameter("menu");
	String target = "./template/menu/" + request.getParameter("target") + ".jsp";
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
<script type="text/javascript" src="./scripts/script.js"></script>
<style type="text/css">
.contain{
	width:60%;
	padding-left:20%;
	padding-top:50px;
}
.p_tag{
	padding-left:28%;
}
.p_tag2{
	padding-left:41%;
}
.pwc_table{
	padding-top:3%;
	text-align:center;
} 
.pwc_t{
	border:1px solid #D5D5D5;
	width: 100%;
	padding : 40px;   
}
.p_btn{
	display: inline;
    color: #fff;
    font-weight: bold;
    background-color: #91A7D0;
    padding: 12px;
}
.in_pw{
	height:26px;
	background-color : #E1E1E1;
	border :1px solid #D5D5D5;
	padding : 8px;
}
</style>
</head>
<body>
	<div id="top">
		<jsp:include page="./template/top.jsp?menu=<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<div class="contain">
			<h2>개인정보변경</h2>
			<hr />
			<p class="p_tag">고객님의 개인정보 보호를 위해 본인확인을 진행합니다. </p>
			<p class="p_tag2">비밀번호를 입력해주세요. </p>
			<div class="pwc_table">
				<table class="pwc_t">
					<tr>
					<td>
					비밀번호 &nbsp;
					<input type="password" class="in_pw" size="40"/>&nbsp; 
					<p class="p_btn">확인</p>
					</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div id="bot"></div>
</body>

</html>