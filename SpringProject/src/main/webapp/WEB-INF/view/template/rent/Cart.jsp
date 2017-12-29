<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="Model.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   request.setCharacterEncoding("UTF-8");
   String img = "url(img/rent.jpg)";
   String menu = "../top.jsp?menu=" + "Cart";
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

$(document).ready(function() {
   $('.arrowRight').on('click',function(){
      var currentRow = $(this).closest('tr');
      var prdName = currentRow.find('td:eq(1)').text();
      var prdPrice = Number(currentRow.find('td:eq(2)').text());
      var prdQty = Number(currentRow.find('td:eq(3)').text()) + 1;
      var subtotal = Number(document.getElementById("getTotal").innerText)+prdPrice;
      $.ajax({
         url : "CartQtyUp",
         dataType : "json",
         type : "post",
         data : {"prdName":prdName},
         success : function(data) {         
            currentRow.find('.getQty').text(prdQty);
            document.getElementById("getTotal").innerText= subtotal;
         },
         error : function(request, status, error) {
            console.log("code:" + request.status + "\n" + "error:" + error);
         }
      });
    });
   
   $('.arrowLeft').on('click',function(){
      var currentRow = $(this).closest('tr');
      var prdName = currentRow.find('td:eq(1)').text();
      var prdPrice = Number(currentRow.find('td:eq(2)').text());   
      var prdQty = Number(currentRow.find('td:eq(3)').text()) - 1;
      var subtotal = Number(document.getElementById("getTotal").innerText)- prdPrice;
      if(prdQty !=0){
         $.ajax({
            url : "CartQtyDown",
            dataType : "json",
            type : "post",
            data : {"prdName":prdName},
            success : function(data) {         
               currentRow.find('.getQty').text(prdQty);   
               document.getElementById("getTotal").innerText =subtotal;
            },
            error : function(request, status, error) {
               console.log("code:" + request.status + "\n" + "error:" + error);
            }
         });
      } else {
         return;   
      }
   });
   
   $('#deletePrd').on('click', function(){
      var selectedPrd = "";
      var data = "";
      var p="";
      var q= "";
      var calcDelete="";
      $("input[name='checkDelete']:checked").each(function(){
         selectedPrd += $(this).val()+",";
          data = $(this).parents('tr');
          p = Number(data.find('td:eq(2)').text());
         q = Number(data.find('td:eq(3)').text());
         calcDelete += p*q;
      });
      $('#deletehidden').val(selectedPrd);
      var subtotal = Number(document.getElementById("getTotal").innerText)-calcDelete;
      if(selectedPrd!=""){
          $.ajax({
            url : "CartRemove",
            dataType : "json",
            type : "post",
            data :$('#deletehidden').serializeArray(),
            success : function(data) {
               $("input[name='checkDelete']:checked").each(function(){
                  $(this).parents('tr').fadeOut(function(){
                     $(this).remove();
                  })
               });
               document.getElementById("getTotal").innerText = subtotal;
            }
         });
      } else {
         alert("삭제할 상품을 선택하세요.");
      }
   });

   function placeOrder(){
      document.getElementById('frm').submit();
   }
});
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
#btnPayment{
   width: 167px;
   height: 70px;
   margin-left: 5px;
   position:relative;
   background: #91A7D0;
   color: #fff;
}
#goBack{
   width: 167px;
   height: 70px;
   margin-left: 5px;
   position:relative;
   background: #91A7D0;
   color: #fff;
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
#step_list li {
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
#cart-item {
   width: 900px;
   border-collapse: collapse; 
   border-spacing: 0; 
} 
#cart-item td, #cart-item th { 
   border: 0 none; 
   height: 35px; 
}
#cart-item th{
   background: linear-gradient(#333 0%,#444 100%);
   color: #FFF; 
   font-weight: bold;
   height: 40px;
}
#cart-item td { background: #FAFAFA; text-align: center; }
#cart-item tr:nth-child(even) td { background: #EEE; } 
#cart-item tr:nth-child(odd) td { background: #FDFDFD; }
#cart-item button{
   height: 39px;
   width: 63px;
   /* float:left;  */
   cursor: pointer;
   border: 1px solid #444;
   border-radius: 5px 5px 5px 5px ;
   background: #f57184;    
   color: white;
   /* position:relative; */
}
#couponBtn:active {
    background: #f06a7c;
}
#couponBtn:hover {
    background: #f57184;
    background: -webkit-gradient(linear, 0 0, 0 bottom, from(#f57184), to(#f78297));
    background: -moz-linear-gradient(#f57184, #f78297);
    background: linear-gradient(#f57184, #f78297);
    border: solid 1px #e26272;
    border-bottom: solid 3px #cb5462;
    box-shadow: inset 0 0 0 1px #f9aab5; 
}

#couponBtn{
   background: #f997b0;
    background: -webkit-gradient(linear, 0 0, 0 bottom, from(#f997b0), to(#f56778));
    background: -moz-linear-gradient(#f997b0, #f56778);
    background: linear-gradient(#f997b0, #f56778);
    border: solid 1px #ee8090;
    border-bottom: solid 3px #cb5462;
    box-shadow: inset 0 0 0 1px #fbc1d0;
    color: #913944;
    text-shadow: 0 1px 0 #f9a0ad; 
    width:80px;
    height: 30px;
}

#calcTotalField {
   margin-top: 120px;
   position: relative;
   border-top: 2px solid #92ced9;
   border-bottom: 2px solid #92ced9;
   background: #f9fdfe;
   color: #666;
   border-collapse: collapse;
   height: 120px;
   width: 900px;
}

#calcPriceArea {
   width: 180px;
   padding-left: 60px;
   display: inline;
   float: left;
   text-align: left;
}

#priceLabel, #eventLabel, #fixedPriceLabel  {
   display: block;
   height: 30px;
   margin-top: 15px;
   font-size: 20px;
   line-height: -48px;
}

#calcPrice{
   display: block;
   color: black;
   line-height: 17px;
   margin-bottom: 38px;
   font-size: .8em;
   vertical-align: top;
}

#getTotal {      
   font-size: 18px;
   vertical-align: top;
   font-weight: bold;
}

#subSymbolField, #equalSymbolField{
   display: inline;
   float: left;
   width: 50px;
   text-align: left;
}

#minusSymbol, #equalSymbol  {
   width: 25px;
   height: 4px;
   margin-top: 30px;
   vertical-align: top;
   font-size: 40px;
   display:inline-block;
}

#applyEventArea {
   display: inline;
   float: left;
   width: 180px;
   text-align: left;
}


#getDiscount {
   display: block;
   color: #00aac4;
   line-height: 17px;
   margin-bottom: 38px;
   font-size: .8em;
   vertical-align: top;
   font-size: 18px;
   font-weight: bold;
}

#fixedPriceArea {
   width: 180px;
   padding-right: 40px;
   margin-left: 30px;
   display: inline;
   float: right;
   text-align: left;
}

#fixedPrice {
   display: block;
   color: #f14f4f;
   line-height: 17px;
   margin-bottom: 38px;
   font-size: .8em;
   vertical-align: top;
}

#fixedTotal {
   font-size: 32px;
   vertical-align: top;
   font-weight: bold;
   padding-right:10px;
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
               <table id="cart-item" >
                  <colgroup>
                     <col width="20%">
                     <col width="40%">
                     <col width="16%">
                     <col width="15%">
                     <col width="9%">
                  </colgroup>
                  <thead>
                  <tr align="center">
                     <th>상품 코드</th>
                     <th>상 품 명</th>
                     <th>가 격</th>
                     <th>수 량</th>
                     <th align="center"><button type="button" id="deletePrd" value="삭제">삭제</button></th>
                  </tr>
               <%
               if( cartList==null ){
               %>      <!-- 상품이 장바구니에 존재하지 않을 경우  /if(cartList.size()<1 || cartList==null || cartList.isEmpty() ){ -->
                  <tr align=center><td colspan="5"><h1 align="center">상품이 존재하지 않습니다.</h1></td></tr>
               <%
               } else {   //if end
                  int num=1;
                  for(int i=0; i<cartList.size(); i++){
               %>
                  <tr align=center>
                     <td><%= cartList.get(i).getPrdCode() %></td>   
                     <td id="prd_Name"><%= cartList.get(i).getPrdName() %></td>
                     <td id="prdP"><%= cartList.get(i).getPrice() %></td>
                     <td class="totalQty">
                        <a href="javascript:checkQty('<%=cartList.get(i).getPrdName() %>', <%= cartList.get(i).getQty() %>)">
                           <i class="arrowLeft"></i>
                        </a>
                        <span class="getQty" ><%= cartList.get(i).getQty() %></span> 
                        <span id="arrowRight">
                           <i class="arrowRight"></i>
                        </span>
                     </td>
                     <td align="center">
                        <input type="hidden" id="deletehidden" name="deletehidden">
                        <input type="checkbox" name="checkDelete" value="<%= cartList.get(i).getPrdName() %>" />
                     </td>
                  </tr>
               <%
                  }   //for end
               %>
                  </thead>
               </table>
            <%
               }   //else end
            %>         
            </form>      
               

            <div id="applyEvent">
               <button id="couponBtn" onClick="window.open('CouponOpen','mywindow','width=500, height=350, toolbar=no, resizable=no, menubar=yes')">쿠폰 적용</button>
            </div>
            <div id="calcTotalField">
               <p id="calcPriceArea">
                  <span id="priceLabel">총 주문 금액</span>
                  <span id="calcPrice"><label id="getTotal" value="<%=totalMoney %>"><%= totalMoney %></label>원</span>
               </p>
               <span id="subSymbolField">
                  <span id="minusSymbol">-</span>
               </span>
               <p id="applyEventArea">
                  <span id="eventLabel">할인 적용가</span>
                  <span id="getDiscount">aa</span>
               </p>
               <span id="equalSymbolField">
                  <span id="equalSymbol">=</span>
               </span>
               <p id="fixedPriceArea">
                  <span id="fixedPriceLabel">최종 결제 금액</span>
                  <span id="fixedPrice"><label id="fixedTotal"><%= totalMoney %></label>원</span>
               </p>
            </div>
            
            <div id="payment">
               <form action="Payment" name="frm" method="post">
                  <input type="hidden" name="totalAmount" value="<%= totalMoney %>" />
                  <button id="btnPayment" onclick="javascript:placeOrder()">주문 결제</button>
                  <button id="goBack" onclick="window.history.go(-2); return false;">뒤로가기</button>
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