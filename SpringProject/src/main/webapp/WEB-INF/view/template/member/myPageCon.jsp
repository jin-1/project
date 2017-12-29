<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import = "Model.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
	MemberDTO memberdto = (MemberDTO) session.getAttribute("login");
	String memberPw = memberdto.getMemberPw();
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
<script type="text/javascript" src="./scripts/memberscript.js"
	charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function() {

	 $(".p_btn").click(function(){
		
		 
		 if("<%=memberPw%>" ==$('.in_pw').val()){
			 $(location).attr('href','myPage?menu=MyPage&userId=<%=memberdto.getMemberId()%>');
		 }else if("<%=memberPw%>" !=$('.in_pw').val()){
			 alert("입련된 비밀번호가 다릅니다.");
		 }else if($('.in_pw').val()==null){
			 alert("비밀번호를 입력해주세요");
		 }
		 
	 });
});
</script>
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
    cursor:pointer;
    
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
		<jsp:include page="<%=menu%>" flush="false" />
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
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>

</html>