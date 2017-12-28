<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="Model.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
	String img = "url(img/rent.jpg)";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TRENVIAJES</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./scripts/script.js"></script>
<style>
#content{
	margin: 0 auto;
	width: 1020px;
	padding:0;
}
#basicDetail{
	padding:80px 0 0;
}
#left_area{
	float: left;
	width:450px;
	height: 450px;
	border:1px solid;
}
#view_image{
	position:relative;
	display: table;
	margin: 0 auto;
	margin-top: 40px;
}
#view_image img{
	text-align:center;
	width: auto !important;
	max-width: 410px;
	height: auto !important;
	max-height: 410px;
	border:0;
	vertical-align: top;
}
#disposable {
	position:absolute;
	top: 350px;
	text-align:center;
}
#info{
	float:right;
	width:425px;
	margin:0;
	padding:0;
}
#right_area{
	border:0px;
}
#basic_info {
	position:relative;
	width:100%;
}
.prd_code_label {
	font-size:11px;
	line-height:15px;
	letter-spacing: -1px;
	margin: 0 0 6px -1px;
}
.prd_name {
	font-size:26px;
	line-height: 32px;
	word-break: break-all;
	letter-spacing: -0.04em;
}
.prd_info {
	font-size:14px;
	line-height: 20px;
	letter-spacing: -0.04em;
	width:100%;
	padding: 0 0 8px;
	border-bottom: 1px solid;
}
.prd_info > li {
	overflow:hidden;
	padding: 6px 0;
}
.prd_price_label {
	float:left;
	font-weight: 700;
}
.prd_price {
	font-weight: 700;
	text-align:right;
	float:right;
}
.price {
	color:#91A7D0;
	line-height:20px;
	word-spacing:-1px;
	font-size:22px;
	vertical-align: -2px;
}
.prd_delivery_label{
	float:left;
	font-weight: 700;
}
.prd_delivery {
	font-weight: 700;
	text-align:right;
	float:right;
	font-size: 12px;
}
.prd_stack_label {
	float:left;
	font-weight: 700;
}
.prd_stack {
	font-weight: 700;
	text-align:right;
	float:right;
	font-size: 12px;
}
.prd_cnt_field {
	position: relative;
	margin: 10px 0 0;
	padding: 14px 10px;
}
.cnt_box{
	line-height:15px;
	font-size:20px;
	font-weight: 700;
}
.cnt_area {
	position: absolute;
	bottom: 11px;
	right:22px;
	max-width: 50%;
	display:block;
}
.adjust_cnt {
	display:block;
	max-width: 140px;
	margin-top: 5px;
	overflow:hidden;
	border:1px solid #ddd;
}
.cnt{
	margin-bottom: -6px;
}
.btn_less {
	float:left;
	width:45px;
	height:33px;
	background: #f5f5f5;
	text-align: center;
	font-size:21px;
}
#total_cnt{
	float:left;
	font-weight:700; 
	width: 30px;
	height:29px;
	padding: 0 8px;
	text-align: center;
	font-size:14px;
	line-height:20px;
}
.btn_add{
	float:left;
	width:45px;
	height:33px;
	background: #f5f5f5;
	text-align: center;
	font-size:21px;
}
#prd_total_field {
	height: 60px;
	margin: 10px 0 0;
	padding: 18px 0 0;
	color: #91A7D0;
	font-weight: 700;
	line-weight: 20px;
	font-size: 18px;
	border-bottom: 4px solid #91A7D0;
}
.txt_total {
	float: left;
	height: 29px;
	width: 130px;
	padding-bottom: 15px;
}
.txt_sum{
	float: right;
	padding-bottom: 15px;
	height: 29px;
}
.totalWon{
	font-size: 22px;
	height: 29px;
	margin-right: 2px;
	vertical-align: -2px;
	padding-bottom: 15px;
}
#btn_field {
	margin: 10px 0 0;
	height: 70px;
	width: 425px;
	text-align: center;
}
.btnCart {
	width: 167px;
	height: 70px; 
	background: #fff;
	border: 1px solid #91A7D0;
	float: left;
	color: #91A7D0;
}
.btnBuy{ 
	width: 167px;
	height: 70px;
	margin-left: 5px;
	float: right;
	background: #91A7D0;
	color: #fff;
}
#policy{ 
	display: block;
	padding: 30px 0 0;
	text-align: center;
}
.policy_src{
	margin-top: 140px;
	max-width: 1020px;
	border:0;
	vertical-align:top;
}
</style>

</head>
<script type="text/javascript">
	jQuery(document).ready(function(){
		var aa = null;
		var q = null;
		var price = document.getElementById('total').innerText;
		
		$('.btn_less').click(function(e){
			e.preventDefault();
			fieldName = $(this).attr('field');
			var currentQ = parseInt($('input[name='+fieldName+']').val());
			if( !isNaN(currentQ)&& currentQ>1){	
				$('input[name='+fieldName+']').val(currentQ-1);
				aa = document.getElementById("total_cnt").value;
				document.getElementById('productQ').value=aa; 		//controller에 보낼 수량값 변경
				document.getElementById('total').innerText= price*aa; 
			} else {
				$('input[name='+fieldName+']').val(1);
			}
		});
		$('.btn_add').click(function(e){
			e.preventDefault();
			fieldName = $(this).attr('field');
			var currentQ = parseInt($('input[name='+fieldName+']').val());
			if( !isNaN(currentQ) ){
				$('input[name='+fieldName+']').val(currentQ+1);
				aa = document.getElementById("total_cnt").value;
				document.getElementById('productQ').value=aa;
				document.getElementById('total').innerText= price*aa;
			} else {
				$('input[name='+fieldName+']').val(1);
			}
		});	
	});
</script>
<script type="text/javascript">
	function sendPrd(){
		document.getElementById('frm').submit();
	} 
</script>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
		<div id="menuBg" style="background-image:<%=img%>;"></div> 
	</div>
	<div id="mid">
		<div id="content">
		<c:forEach var="pDTO" items="${result}" varStatus="status">
			<div id="basicDetail">
				<div id="left_area">
					<div id="view_image">
					<c:choose>
						<c:when test="${fn:startsWith(pDTO.prdCode,'A')}">
							<img src="/SpringProject/img/prd/${pDTO.prdImg}" alt="대표이미지" >
							<p id="disposable">일회용</p>
						</c:when>	
						<c:otherwise>
							<img src="/SpringProject/img/prd/${pDTO.prdImg}" alt="대표이미지" >
						</c:otherwise>
					</c:choose>
					</div>
				</div>
				<div id="info">
					<fieldset id="right_area">
						<div id="basic_info">
							<p class="prd_code_label">상품번호 : <span class="prd_code">${pDTO.prdCode}</span> </p><hr/>
							<p class="prd_name"><strong>${pDTO.prdName}</strong></p>
							<ul class="prd_info">
								<li>
									<span class="prd_price_label">Price</span>
									<span class="prd_price">
										<span class="price">${pDTO.prdPrice}</span>
										원
									</span>
								</li>
								<li>
									<span class="prd_delivery_label">배송비</span>
									<span class="prd_delivery">무료</span>
								</li>
								<li>
									<span class="prd_stack_label">수량 현황</span>
									<span class="prd_stack">있음</span>
								</li>
							</ul>	
						</div>
						<div class="prd_cnt_field">
							<div class="cnt_box">
								<span class="cnt">대여수량</span>
								<div class="cnt_area">
									<span class="adjust_cnt">
										<input type="button" class="btn_less"  value="-" field="quantity" />
										<input type="text" id="total_cnt" name="quantity" value="1" readonly />
										<input type="button" class="btn_add"  value="+" field="quantity"/>
									</span>
								</div>
							</div>
						</div>
						<hr/>
						<div id="prd_total_field">
							<span class="txt_total">상품금액 합계</span>
							<span class="txt_sum">
								 <span class="totalWon"><label id="total">${pDTO.prdPrice}</label></span> 
								원
							</span>
						</div>
					</fieldset>	
					<form action="Cart?menu=RENT&img=trainbg" name="frm" method="post" id="frm">
						<input type="hidden" name="productName" value= "${pDTO.prdName}" />	
						<input type="hidden" name="productCode" value= "${pDTO.prdCode}" />
						<input type="hidden" name="productPrice" value= "${pDTO.prdPrice}" />	
						<input type="hidden" name="productQ" id="productQ"  />
						<div id="btn_field">
							<button class="btnCart" onclick="window.history.back(); return false;">목록</button> 
							<button class="btnBuy" onclick="javascript:sendPrd()">장바구니</button>
						</div>						
					</form>
				</div>
			</div>
			</c:forEach>
			<div id="policy">
				<img src="img/deliveryPolicy.jpg" class="policy_src"/>
			</div>
 		</div>
	</div>
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>