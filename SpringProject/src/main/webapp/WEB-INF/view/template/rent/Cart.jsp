<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="Model.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String img = "url(img/rent.jpg)";
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
%>
<%
	ArrayList<CartDTO> cartList = (ArrayList<CartDTO>)session.getAttribute("cartList");
	int totalMoney = (Integer)request.getAttribute("totalMoney");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./scripts/script.js"></script>
<script type="text/javascript">
/*   function doNotReload(){
      if((event.ctrlKey == true && (event.keyCode == 8 ||event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
        event.keyCode = 0;
        event.cancelBubble = true;
        event.returnValue = false;
   		alert("새로고침 방지");
      } 
  }
  document.onkeydown = doNotReload; */
  
	function checkQty(prdName, qty){
	  if(qty != 1){
		  location.href="CartQtyDown?prdName="+prdName;
	  } else {
		  return;
	  }
	  
	function placeOrder(){
		document.getElementById('frm').submit();
	}
  }
</script>
<style>
#mid {
	width:60%;
	height: auto;
	postion:relative;
	margin-left: 20%;
}
div {
	display: block;
} 
#nav-critical {
	padding-top: 90px;
	display: table;
	margin: 0 auto;
}
#process{
	height: 100px;
	width:900px;
	border-radius:5px;
	position: relative;
	border-bottom: 4px solid #444;
}
#current_page {
	float:left;
	width:200px;
	font-size: 35px;
}
#step_list{
	float: right;
	padding-right: 10px; 
}
li {
	display:list-item;
	list-style: none;
	float:left;
	width: 160px;
	padding-left:10px;
	text-align: center;
	height: 100px;
	font-size: 18px;
}
#circle {
	position:relative;
	float:left;
	background-color: #C3DDD6;
	margin:3px auto;
	width: 40px;
	height: 40px;
	border-radius: 20px;
}
#current_circle {
	float:left;
	position:relative;
	background-color: #5BA1B0;
	margin:3px auto;
	width: 40px;
	height: 40px;
	border-radius: 20px;
}
#circle_level {
	position: absolute;
	top:50%;
	left:50%;
	transform: translate(-50%, -50%);
	color: #fff;	
}
#step_list span {
	width:95px;
	height: 32px;
	display: inline-block;
	vertical-align:top;
}
#cartField {
	width: 100%;
}
i {
    border: solid black;
    border-width: 0 3px 3px 0;
    display: inline-block;
    padding: 3px;
}
.arrowRight {
    transform: rotate(-45deg);
    -webkit-transform: rotate(-45deg);
    -moz-transform: rotate(-45deg);
}
.arrowLeft {
    transform: rotate(135deg);
    -webkit-transform: rotate(135deg);
    -moz-transform: rotate(135deg);
} 
#dialog{
	overflow: hidden;
	margin: 10px;

}
#applyEvent {
	float:right;
	padding-right: 20px;
	padding-top: 80px;
	padding-bottom: 15px;
}
#payment {
	text-align: center;
	
	margin-top: 80px;
	margin-bottom: 30px;
}
#btnPayment{
	heigth: 30px;
}
</style>
</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
		<div id="menuBg" style="background-image:<%=img%>;"></div> 
	</div>
	<div id="mid">
		<div class="container">
			<div id="nav-critical">
				<div id="process">
					<span id="current_page">장 바 구 니</span>
					<ul id="step_list">
						<li>
							<div id="current_circle">
								<div id="circle_level">1</div>
							</div>
							<span>장바구니</span>
						</li>
						<li>
							<div id="circle">
								<div id="circle_level">2</div>
							</div>
							<span>주문/결제</span>
						</li>
						<li>
							<div id="circle">
								<div id="circle_level">3</div>
							</div>
							<span>결제완료</span>
						</li>
					</ul>
				</div>
				<form id="cartField">
					<table align="center" width=900 border=1 id="cart-item" >
						<tr align="center">
							<td>상품 코드</td>
							<td>상 품 명</td>
							<td>가 격</td>
							<td>수 량</td>
							<td align="center"><input type="submit" name="delete" value="삭제"></td>
						</tr>
					<%
					if(cartList.size()==0||cartList ==  null){
					%>		<!-- 상품이 장바구니에 존재하지 않을 경우 -->
						<tr><td colspan="4"><h1 align="center">상품이 존재하지 않습니다.</h1></td></tr>
					<%
					} else {	//if end
						int num=1;
						for(int i=0; i<cartList.size(); i++){
					%>
						<tr align=center>
							<td><%= cartList.get(i).getPrdCode() %></td>	
							<td><%= cartList.get(i).getPrdName() %></td>
							<td><%= cartList.get(i).getPrice() %></td>
							<td>
								<a href="javascript:checkQty('<%=cartList.get(i).getPrdName() %>', <%= cartList.get(i).getQty() %>)">
									<i class="arrowLeft"></i>
								</a>
								<%= cartList.get(i).getQty() %>
								<a href="CartQtyUp?prdName=<%= cartList.get(i).getPrdName() %>">
									<i class="arrowRight"></i>
								</a>
							</td>
							<td align="center">
								<input type="checkbox" name="delete" value="<%= cartList.get(i).getPrdName() %>" />
							</td>
						</tr>
					<%
						}	//for end
					%>
					</table>
					<%-- <table align=center width=600 border=0>
						<tr align=center bgcolor=yellow>
							<td align=right colspan=6><font color=gray size=5>총 결제금액 : </font>
							<font color="red" size=8><%= totalMoney %></font></td>
						</tr>
					</table> --%>
				<%
					}	//else end
				%>			
				</form>		
					
				<div id="dialog">
					<span>대여 및 반납 왠만하면 대여하지마.그냥 알아서 사.</span> 
				</div>
				<div id="applyEvent">
					<button>쿠폰</button>
				</div>
				<form name="calcTotal">
					<table align="center" width="900" border="1">
						<tr align="center">
							<td>총 주문 금액</td>
							<td>총 할인 금액</td>
							<td>최종 결제 금액</td>
						</tr>
						<tr align="center">
							<td><%= totalMoney %></td>
							<td>0</td>
							<td><%= totalMoney %></td>
						</tr>
					</table>
				</form>
				<div id="payment">
					<form action="Payment" name="frm" method="post">
						<input type="hidden" name="totalAmount" value="<%= totalMoney %>" />
						<button id="btnPayment" onclick="javascript:placeOrder()">주문 결제</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>