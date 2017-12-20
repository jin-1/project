<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="service.*, Model.*"  %>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu="+request.getParameter("menu");
	String target = "./template/menu/" + request.getParameter("target") + ".jsp";
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TRENVIAJES</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./scripts/script.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	$('#searchButton').bind('click',function(){
		var prdName = document.searchField.prdName.value;
		/* alert(prdName); */
		var prdType = document.searchField.prdType.value;
		
 		$.ajax({
			type:"POST",
			url:"SearchResult",
			dataType:"html",
			/* data:"prdName="+prdName, */
			data: "prdName="+prdName+"&prdType="+prdType,  //변수명=값&변수명=값&변수명=값		일반형 / json으로 넘길때는 {변수명:값 , 변수명:값}
			success:function(result){
				$('.productList').html(result);
			}
		});		 
 		return false;
	});
}); 
</script>
<%-- <jsp:include page="../config.jsp" flush="false"/> --%>
<style>
#mid {
	width:60%;
	height: auto;
	postion:relative;
	margin-left: 20%;
}
#searchArea {
	width:70%;
	margin-left:15%;
	height:140px;
}
#searchForm {
	padding-top: 90px;
	padding-left: 5%;
	padding-right: 5%;
}
#searchField{
	margin: 0 auto;
	width: 640px;
}
select {
	width: 110px;
	height: 39px;
	font-size: 13px;
	text-align-last: center;
	float: left;
	position:relative;
	margin-right: 10px;
	border-radius: 5px;
	border: 1px solid #0E3A53;
	
	-moz-appearance: none;
    -webkit-appearance: none;
	background-image:
	    linear-gradient(45deg, transparent 50%, gray 50%),
	    linear-gradient(135deg, gray 50%, transparent 50%),
	    linear-gradient(to right, #ccc, #ccc);
 	background-position:
	    calc(100% - 20px) calc(1em + 2px),
	    calc(100% - 15px) calc(1em + 2px),
	    calc(100% - 2.5em) 0.5em;
    background-size:
	    5px 5px, 
	    5px 5px,
	    1px 1.5em;
	background-repeat: no-repeat;
	line-height: 1.5em;
	padding: 0.5em 3.2em 0.5em 1em;
}
select optgroup {
	font-size: 14px;
	font-weight: bold;
}
select option {
	font-weight: normal;
	font-size: 12px;
}
#prdName {
	width: 420px;
	height: 35px;
	background: #fff;
	float: left; 
	border: 1px solid #0E3A53;
	letter-spacing: -1px;
	border-radius: 5px 0px 0px 5px ;
	text-align:center;
	font-size: 15px;
	position: relative;	  
}
#searchButton {
	height: 39px;
	width: 63px;
	float:left; 
	cursor: pointer;
	border: 1px solid #444;
	border-radius: 0px 5px 5px 0px ;
	background: #0E3A53; 	
	color: white;
	position:relative;
}
#listArea {
	margin-top: 80px;
	padding: 0;
	display: table;
	margin: 0 auto;
	margin-bottom: 80px;
}
.productList{
	position: relative;
}
 #productTable {
	width: 900px;
	border-collapse: collapse;
} 
#productTable tr:nth-child(even){ background-color:#f2f2f2; }
#productTable td, #productTable th {
	border-top: 1px solid #ddd;
	padding: 8px;
}
#productTable a:hover {color:#0E3A53; }
#productTable th{
	padding-top:12px;
	padding-bottom: 12px;
	text-align: center;
	background-color: #0E3A53;
    color: white;
}
#photo{
	text-align: center;
 	width:250px;
 	height: 130px;
 	text-align: center;
}
#image{
	display:block;
	margin: 5px 35px 5px 35px;
	padding: 15px 20px 5px 20px;
	position: relative;
	width: 180px;
	height: 120px;
	background-color: white;
	overflow:hidden;
}
#photo .img {
	max-width:100%;
	max-height:100%;
	border:0;
	display:inline;
}
#details {
	border-left:1px solid #A8B0AE;
}
#name {
	font-size:19px;
	font-weight: bold;
	letter-spacing:1px;
	font-height: 30px;
}
#price{
	font-size: 17px;
}
#stack{
	font-size:10px;
	line-height: 20px;
}
</style>
</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<div id="searchArea">
			<div id="searchForm">
				<form id="searchField" name="searchField" method="POST" > <!-- action="SearchResult" -->
					<select name="prdType" id="prdType">
						<option value="전체">전체</option>
						<optgroup label="식품">
							<option value="물">물</option>
							<option value="탄산음료">탄산음료</option>
							<option value="커피">커피</option>
							<option value="초콜릿">초콜렛</option>
							<option value="라면">라면</option>
							<option value="과자">과자</option>
							<option value="견과류">견과류</option>
						</optgroup>
						<optgroup label="생활용품">
							<option value="헤어케어">헤어케어</option>
							<option value="스킨케어">스킨케어</option>
							<option value="면도기">면도기</option>
						</optgroup>
						<optgroup label="레저/스포츠">
							<option value="수영복">수영복</option>
							<option value="텐트">텐트</option>
							<option value="슬리퍼">슬리퍼</option>
						</optgroup>
						<optgroup label="디지털">
							<option value="충전기기">충전기기</option>
							<option value="카메라">카메라</option>
							<option value="배터리">배터리</option>
							<option value="음향기기">음향기기</option>
						</optgroup>
					</select>
					<input type="text" class="prdName" id="prdName"name="prdName"
						onfocus="if (this.value =='검색어 입력' ) this.value='' "
						onblur="if (this.value=='') this.value='검색어 입력'" value="검색어 입력" maxlength="50"/>
					 <button id="searchButton">검색</button> 

				</form>
			</div>
		</div>
	 	<div id="listArea">
	 		<div class="productList">

			</div>
	 	</div>
	</div>
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>