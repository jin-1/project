<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="Model.*, java.util.*" %>
<%
   request.setCharacterEncoding("UTF-8");
   String menu = "../top.jsp?menu=RENT";
   String img = "url(img/rent.jpg)";
%>
<%
   ArrayList<CartDTO> cartList = (ArrayList<CartDTO>)session.getAttribute("cartList");
   int totalMoney = (Integer)request.getAttribute("totalMoney");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TRENVIAJES</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./scripts/script.js"></script>
<link rel="stylesheet" type="text/css" href="./css/calendar-style.css" />
<link rel="stylesheet" type="text/css" href="./css/pignose.calendar.min.css" />
<script type="text/javascript"
	src="./scripts/pignose.calendar.full.min.js"></script>
<jsp:include page="../config.jsp" flush="false" />
<style>
#mid {
   width:60%;
   height: auto;
   postion:relative;
   margin-left: 20%;
}
#
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

#calcTotalField {
   margin-top: 50px;
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

#trainList1 {
   min-height: 50px;
   max-height: 150px;
   width: 252px;
   top: 40px;
   position: absolute;
   background-color: white;
   z-index: 9;
   box-shadow: 0px 3px 8px #888888;
   overflow-x: hidden;
   overflow-y: auto;
}

#trainList2 {
   min-height: 50px;
   max-height: 150px;
   width: 252px;
   top: 40px;
   position: absolute;
   background-color: white;
   z-index: 9;
   box-shadow: 0px 3px 8px #888888;
   overflow-x: hidden;
   overflow-y: auto;
}
.inputtext {
   position: relative;
   display: inline-block;
   cursor: pointer;
   width: 250px;
   height: 40px;
   border: #b3b3b3 1px solid;
   padding: 0;
   margin: 0;
}

.inputtext input {
   position: absolute;
   z-index: -1;
   opacity: 0;
   top: 5px;
   left: 3px;
   width: 210px;
   height: 25px;
}

@media screen and (-webkit-min-device-pixel-ratio:0) {
	.inputtext__indicator {
		position: absolute;
		top: 10px;
		font-size: 15px;
		font-weight: bold;
		left: 5px;
		color: #333537d6;
	}
}
.inputtext__indicator {
   position: absolute;
   top: 10px;
   font-size: 15px;
   font-weight: bold;
   left: 5px;
   color: #333537d6;
}

.inputtext input:focus {
   z-index: 1;
   opacity: 100;
}
.pinmark {
   width: 20px;
   height: 20px;
   position: absolute;
   right: 3px;
   top: 10px;
}

#pickup_field, #return_field{
   position:relative;
   display: table;
   margin: 0 auto;
   margin-top: 60px;
   width: 900px;
   height: 100px;
}
#return_field{
   margin-top:20px;
}
#pickupLabel, #pickupDLabel, #returnDLabel, #returnSLabel{
   position: block;
   font-size: 14px;
   font-weight: bold;
   margin-right: 30px;
   margin-left:60px;
}

#payment {
text-align: center;
   
   margin-top: 80px;
   margin-bottom: 30px;
}
#btnPayment {
   width: 167px;
   height: 70px;
   margin-left: 5px;
   position:relative;
   background: #91A7D0;
   color: #fff;

}
#goBack {
   width: 167px;
   height: 70px;
   margin-left: 5px;
   position:relative;
   background: #91A7D0;
   color: #fff;
}

.paymentTypeon {
   width: 150px;
   height: 30px;
   position: relative;
   text-align: center;
   padding-top: 10px;
   border: #0180a3 1.5px solid;
   display: inline-block;
   margin-right: -5.5px;
   background-color: #0180a3;
   color: white;
}

.contextPayment {
   width: 98%;
   border: #0180a3 1px solid;
   min-height: 250px;
   position: relative;
   padding: 10px;
   border-top-right-radius: 15px;
   border-bottom-left-radius: 15px;
   border-bottom-right-radius: 15px;
   top: -0.5px;
}

#contextPaymentTable {
   width: 100%;
}

#contextPaymentTable tr {
   height: 50px;
}

#payMethod{
   font-size:18px;
   font-weight: bold;
}
.tbg {
	position: fixed;
	z-index: 10;
	width: 100%;
	height: 100%;
	background-color: #0000008a;
	display: none;
}

.tbgw {
	width: 60%;
	height: 620px;
	position: fixed;
	background: white;
	z-index: 11;
	top: 10%;
	left: 20%;
	display: none;
	border-radius: 15px;
}

.control {
	font-size: 18px;
	position: relative;
	display: inline-block;
	cursor: pointer;
	margin-left: 30px;
	padding-left: 30px;
}

.control input {
	position: absolute;
	z-index: -1;
	opacity: 0;
}

.control__indicator {
	position: absolute;
	top: 2px;
	left: 0;
	width: 20px;
	height: 20px;
	background: #e6e6e6;
}

.control--radio .control__indicator {
	border-radius: 50%;
}

/* Hover and focus states */
.control:hover input ~ .control__indicator, .control input:focus ~
	.control__indicator {
	background: #ccc;
}

/* Checked state */
.control input:checked ~ .control__indicator {
	background: #2aa1c0;
}

/* Hover state whilst checked */
.control:hover input:not ([disabled] ):checked ~ .control__indicator,
	.control input:checked:focus ~ .control__indicator {
	background: #0e647d;
}

/* Disabled state */
.control input:disabled ~ .control__indicator {
	pointer-events: none;
	opacity: .6;
	background: #e6e6e6;
}

/* Check mark */
.control__indicator:after {
	position: absolute;
	display: none;
	content: '';
}

/* Show check mark */
.control input:checked ~ .control__indicator:after {
	display: block;
}
#trainList1 {
	min-height: 50px;
	max-height: 150px;
	width: 252px;
	top: 40px;
	position: absolute;
	background-color: white;
	z-index: 9;
	box-shadow: 0px 3px 8px #888888;
	overflow-x: hidden;
	overflow-y: auto;
}

#trainList2 {
	min-height: 50px;
	max-height: 150px;
	width: 252px;
	top: 40px;
	position: absolute;
	background-color: white;
	z-index: 9;
	box-shadow: 0px 3px 8px #888888;
	overflow-x: hidden;
	overflow-y: auto;
}

.trainList ul {
	margin: 0;
	padding: 10px;
}

.trainList li {
	height: 30px;
	cursor: pointer;
}

.stbg {
	width: 98%;
	position: absolute;
	height: 98%;
	padding: 10px;
	display: none;
}

.edbg {
	width: 98%;
	position: absolute;
	height: 98%;
	padding: 10px;
	display: none;
}

.datebg {
	width: 98%;
	position: absolute;
	height: 98%;
	padding: 10px;
	display: none;
}

.stbg_1 {
	position: relative;
	width: 100%;
	height: 50px;
	background-color: #eeeef5cc;
	border-radius: 15px;
}

.stbg_1 ul {
	list-style: none;
	margin: 0;
	padding-top: 10px;
}

.stbg_1 li {
	display: inline;
	font-size: 15px;
	margin: 0px 16px;
	font-family: 'NanumSquareR' !important;
	cursor: pointer;
}

#trainList3 {
	width: 100%;
	height: 430px;
	overflow-x: hidden;
	overflow-y: auto;
}

#trainList3 ul {
	list-style: none;
	margin: 0;
	padding-top: 10px;
}

#trainList3 li {
	display: inline-block;
	font-size: 15px;
	min-width: 200px;
	margin: 5px 15px;
	font-family: 'NanumSquareR' !important;
	height: 35px;
	cursor: pointer;
}

#trainList4 {
	width: 100%;
	height: 430px;
	overflow-x: hidden;
	overflow-y: auto;
}

#trainList4 ul {
	list-style: none;
	margin: 0;
	padding-top: 10px;
}

#trainList4 li {
	display: inline-block;
	font-size: 15px;
	min-width: 200px;
	margin: 5px 15px;
	font-family: 'NanumSquareR' !important;
	height: 35px;
	cursor: pointer;
}
#isa{
	border:solid 1px gray; 
	height: 25px;
	line-height: 40px;
}
#i1{
	position: relative;
	display: inline-block;
	border:solid 1px gray; 
	height: 25px;
	line-height: 40px;
}
</style>
<script type="text/javascript">
$(function() {
   function onClickHandler(date, obj) {
      var calendar = obj.calendar;
      var text = '';

      if (date[0] !== null) {
         var now = new Date();
         var select = new Date(date[0]);
         console.log(select);
         if (now.getTime() < select.getTime()) {
            text += date[0].format('YYYY-MM-DD');
            $('#stDate').text(text);
            $('#inputDate').val(text);
            $('.tbg').css("display", "none");
            $('.tbgw').css("display", "none");
         } else {
            alert("오늘보다 이전날을 고를 수 없습니다.");
         }
      }
      if (date[0] !== null && date[1] !== null) {
         text += ' ~ ';
      } else if (date[0] === null && date[1] == null) {
         text += 'nothing';
      }
      if (date[1] !== null) {
         text += date[1].format('YYYY-MM-DD');
      }
   }
   function onClickHandler_1(date, obj) {
      var calendar = obj.calendar;
      var text = '';

      if (date[0] !== null) {
         var now = new Date();
         var select = new Date(date[0]);
         console.log(select);
         if (now.getTime() < select.getTime()) {
            text += date[0].format('YYYY-MM-DD');
            $('#stDate_1').text(text);
            $('#inputDate_1').val(text);
            $('.tbg').css("display", "none");
            $('.tbgw').css("display", "none");
         } else {
            alert("오늘보다 이전날을 고를 수 없습니다.");
         }
      }

      if (date[0] !== null && date[1] !== null) {
         text += ' ~ ';
      } else if (date[0] === null && date[1] == null) {
         text += 'nothing';
      }

      if (date[1] !== null) {
         text += date[1].format('YYYY-MM-DD');
      }
   }
   // Default Calendar
   $('.calendar').pignoseCalendar({
      select : onClickHandler
   });
   $('.calendar_1').pignoseCalendar({
      select : onClickHandler_1
   });
});


$(document)
.ready(
		function() {
			$('.tbg').click(function() {
				$('.tbg').css('display', 'none');
				$('.tbgw').css('display', 'none');
				$('.stbg').css('display', 'none');
				$('.edbg').css('display', 'none');
				$('.datebg').css('display', 'none');
				$('.datebg_1').css('display', 'none');
			});
      $('#startTrain').click(function() {
         $('.tbg').css('display', 'inline');
         $('.tbgw').css('display', 'inline');
         $('.stbg').css('display', 'inline');
         $('.edbg').css('display', 'none');
         $('.datebg').css('display', 'none');
         $('.datebg_1').css('display', 'none');
      });
      $('#endTrain').click(function() {
         $('.tbg').css('display', 'inline');
         $('.tbgw').css('display', 'inline');
         $('.stbg').css('display', 'none');
         $('.edbg').css('display', 'inline');
         $('.datebg').css('display', 'none');
         $('.datebg_1').css('display', 'none');
      });
      $('#dateTrain').click(function() {
         $('.tbg').css('display', 'inline');
         $('.tbgw').css('display', 'inline');
         $('.stbg').css('display', 'none');
         $('.edbg').css('display', 'none');
         $('.datebg').css('display', 'inline');
         $('.datebg_1').css('display', 'none');
      });
      $('#dateTrain_1').click(function() {
         $('.tbg').css('display', 'inline');
         $('.tbgw').css('display', 'inline');
         $('.stbg').css('display', 'none');
         $('.edbg').css('display', 'none');
         $('.datebg').css('display', 'none');
         $('.datebg_1').css('display', 'inline');
      });   
      $('#trainList1 li').mouseenter(function() {
			$(this).css("background-color", "#EEF1F6");
		});
		$('#trainList1 li').mouseleave(function() {
			$(this).css("background-color", "#ffffff");
		});
		$("#inputStrat:text").keyup(
				function(e) {
					var code = e.which;
					$("#trainList1").css("display", "block");
					var k = $(this).val();

					$("#trainList1 li").hide();
					$("#trainList1 li:contains('" + k + "')").css(
							"display", "block");
					if (code == 13) {
						$("#trainList1").css("display", "none");
						$("#stStation")
								.html($('#inputStrat').val());
						$('#inputStrat').blur();
					}
				});

		$("#trainList1 ul").on("click", "li", function() {
			$("#stStation").html($(this).text());
			$("#inputStrat").val($(this).text());
			$("#trainList1").css("display", "none");
		});
		var a;
		var b;

		$('#trainList1').on('mouseenter', function() {
			a = true;
		});
		$('#trainList1').on('mouseleave', function() {
			a = false;
		});

		$('#inputStrat').on('focusout', function() {
			if (!a) {
				$("#trainList1").css("display", "none");
				$("#stStation").html($('#inputStrat').val());
			}

		});

		$("#inputEnd:text").keyup(
				function(e) {
					var code = e.which;
					$("#trainList2").css("display", "block");
					var k = $(this).val();

					$("#trainList2 li").hide();
					$("#trainList2 li:contains('" + k + "')").css(
							"display", "block");
					if (code == 13) {
						$("#trainList2").css("display", "none");
						$("#edStation").html($('#inputEnd').val());
						$('#inputEnd').blur();
					}
				});

		$("#trainList2 ul").on("click", "li", function() {

			$("#edStation").html($(this).text());
			$("#inputEnd").val($(this).text());
			$("#trainList2").css("display", "none");

		});
		$('#trainList2').on('mouseenter', function() {
			b = true;
		});
		$('#trainList2').on('mouseleave', function() {
			b = false;
		});
		$('#inputEnd').on('focusout', function() {
			if (!b) {
				$("#trainList2").css("display", "none");
				$("#edStation").html($('#inputEnd').val());
			}

		});

		$('.stbg_1 ul').on(
				"click",
				"li",
				function() {
					var c = $(this).text();
					if (c == "전체") {
						$("#trainList3 li").show();

					} else if (c == "가") {
						$("#trainList3 li").hide();
						$("#trainList3 li:contains('가')").css(
								"display", "inline-block");
					} else if (c == "나") {
						$("#trainList3 li").hide();
						$("#trainList3 li:contains('나')").css(
								"display", "inline-block");
					} else if (c == "다") {
						$("#trainList3 li").hide();
						$("#trainList3 li:contains('다')").css(
								"display", "inline-block");
					} else if (c == "라") {
						$("#trainList3 li").hide();
						$("#trainList3 li:contains('라')").css(
								"display", "inline-block");
					} else if (c == "마") {
						$("#trainList3 li").hide();
						$("#trainList3 li:contains('마')").css(
								"display", "inline-block");
					} else if (c == "바") {
						$("#trainList3 li").hide();
						$("#trainList3 li:contains('바')").css(
								"display", "inline-block");
					} else if (c == "사") {
						$("#trainList3 li").hide();
						$("#trainList3 li:contains('사')").css(
								"display", "inline-block");
					} else if (c == "아") {
						$("#trainList3 li").hide();
						$("#trainList3 li:contains('아')").css(
								"display", "inline-block");
					} else if (c == "자") {
						$("#trainList3 li").hide();
						$("#trainList3 li:contains('자')").css(
								"display", "inline-block");
					} else if (c == "차") {
						$("#trainList3 li").hide();
						$("#trainList3 li:contains('차')").css(
								"display", "inline-block");
					} else if (c == "카") {
						$("#trainList3 li").hide();
						$("#trainList3 li:contains('카')").css(
								"display", "inline-block");
					} else if (c == "타") {
						$("#trainList3 li").hide();
						$("#trainList3 li:contains('타')").css(
								"display", "inline-block");
					} else if (c == "파") {
						$("#trainList3 li").hide();
						$("#trainList3 li:contains('파')").css(
								"display", "inline-block");
					} else if (c == "하") {
						$("#trainList3 li").hide();
						$("#trainList3 li:contains('하')").css(
								"display", "inline-block");
					}
				});
		$('.stbg_1 ul').on(
				"click",
				"li",
				function() {
					var c = $(this).text();
					if (c == "전체") {
						$("#trainList4 li").show();

					} else if (c == "가") {
						$("#trainList4 li").hide();
						$("#trainList4 li:contains('가')").css(
								"display", "inline-block");
					} else if (c == "나") {
						$("#trainList4 li").hide();
						$("#trainList4 li:contains('나')").css(
								"display", "inline-block");
					} else if (c == "다") {
						$("#trainList4 li").hide();
						$("#trainList4 li:contains('다')").css(
								"display", "inline-block");
					} else if (c == "라") {
						$("#trainList4 li").hide();
						$("#trainList4 li:contains('라')").css(
								"display", "inline-block");
					} else if (c == "마") {
						$("#trainList4 li").hide();
						$("#trainList4 li:contains('마')").css(
								"display", "inline-block");
					} else if (c == "바") {
						$("#trainList4 li").hide();
						$("#trainList4 li:contains('바')").css(
								"display", "inline-block");
					} else if (c == "사") {
						$("#trainList4 li").hide();
						$("#trainList4 li:contains('사')").css(
								"display", "inline-block");
					} else if (c == "아") {
						$("#trainList4 li").hide();
						$("#trainList4 li:contains('아')").css(
								"display", "inline-block");
					} else if (c == "자") {
						$("#trainList4 li").hide();
						$("#trainList4 li:contains('자')").css(
								"display", "inline-block");
					} else if (c == "차") {
						$("#trainList4 li").hide();
						$("#trainList4 li:contains('차')").css(
								"display", "inline-block");
					} else if (c == "카") {
						$("#trainList4 li").hide();
						$("#trainList4 li:contains('카')").css(
								"display", "inline-block");
					} else if (c == "타") {
						$("#trainList4 li").hide();
						$("#trainList4 li:contains('타')").css(
								"display", "inline-block");
					} else if (c == "파") {
						$("#trainList4 li").hide();
						$("#trainList4 li:contains('파')").css(
								"display", "inline-block");
					} else if (c == "하") {
						$("#trainList4 li").hide();
						$("#trainList4 li:contains('하')").css(
								"display", "inline-block");
					}
				});

		$('#trainList3 ul').on("click", "li", function() {
			var c = $(this).text();
			$('#inputStrat').val(c);
			$('#stStation').text(c);
			$('.tbg').css("display", "none");
			$('.tbgw').css("display", "none");

		});

		$('#trainList4 ul').on("click", "li", function() {
			var c = $(this).text();
			$('#inputEnd').val(c);
			$('#edStation').text(c);
			$('.tbg').css("display", "none");
			$('.tbgw').css("display", "none");
		});
		});
		
$.ajax({
	url : "startTrain",
	dataType : "json",
	type : "post",
	data : $('#inputStrat').serializeArray(),
	success : function(data) {

		var trainLength = Object.keys(data).length;

		$.each(data, function(key, value) {
			$('.trainList ul').append('<li>' + value + '</li>');

		});

	},
	error : function(request, status, error) {
		console.log("code:" + request.status + "\n" + "error:"
				+ error);
	}

});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('select[name=SearchArea1]').bind('change', function(){
		$("#frmNavi input[name='SearchArea1']").val($(this).val());
		var areaf = new areaFunc;
		areaf.gugunChange($(this).val(), $('select[name=SearchArea2]'));
	});
	$('select[name=SearchArea2]').bind('change', function(){
		$("#frmNavi input[name='SearchArea2']").val($(this).val());
	});
});


   function placeOrder(){
	   var pdate = document.getElementById("m2").value +"-"+document.getElementById("m3").value +"-"+document.getElementById("m4").value;
/* 		 alert( $("#prdType2").val(pdate) ); */
       document.getElementById('frm').submit(); 
   }
 
</script>
</head>
<body>
   <div class="tbg"></div>
   <div class="tbgw">
      <div class="stbg">
         <div style="text-align: center;">
            <H2>도시를 지정해주세요</H2>
         </div>
         <div class="stbg_1">
            <ul>
               <li>전체</li>
               <li>가</li>
               <li>나</li>
               <li>다</li>
               <li>라</li>
               <li>마</li>
               <li>바</li>
               <li>사</li>
               <li>아</li>
               <li>자</li>
               <li>차</li>
               <li>카</li>
               <li>타</li>
               <li>파</li>
               <li>하</li>
            </ul>
         </div>
         <div class="trainList" id="trainList3">
            <ul>
            </ul>
         </div>
      </div>
      <div class="datebg">
         <div style="text-align: center; margin-bottom: 35px;">
            <H2>날짜를 정해주세요</H2>
         </div>
         <div class="calendar"></div>

      </div>

      <div class="edbg">
         <div style="text-align: center;">
            <H2>도시를 지정해주세요</H2>
         </div>
         <div class="stbg_1">
            <ul>
               <li>전체</li>
               <li>가</li>
               <li>나</li>
               <li>다</li>
               <li>라</li>
               <li>마</li>
               <li>바</li>
               <li>사</li>
               <li>아</li>
               <li>자</li>
               <li>차</li>
               <li>카</li>
               <li>타</li>
               <li>파</li>
               <li>하</li>
            </ul>
         </div>
         <div class="trainList" id="trainList4">
            <ul>
            </ul>
         </div>
      </div>
            <div class="datebg_1">
      <div style="text-align: center; margin-bottom: 35px;">
            <H2>날짜를 정해주세요</H2>
         </div>
         <div class="calendar_1"></div>
      </div>
      
   </div>
   
   <div id="top">
         <jsp:include page="<%=menu%>" flush="false" />
         <div id="menuBg" style="background-image:<%=img%>;"></div>
   </div>
   <div id="mid">
      <div class="container">
         <div id="nav-critical">
            <div id="process">
               <span id="current_page">주문/결제</span>
               <ul id="step_list">
                  <li>
                     <div id="circle">
                        <div id="circle_level">1</div>
                     </div>
                     <span>장바구니</span>
                  </li>
                  <li>
                     <div id="current_circle">
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
            
            <div id="calcTotalField">
               <p id="calcPriceArea">
                  <span id="priceLabel">총 주문 금액</span>
                  <span id="calcPrice"><em id="getTotal"><%= totalMoney %></em>원</span>
               </p>
               <span id="subSymbolField">
                  <span id="minusSymbol">-</span>
               </span>
               <p id="applyEventArea">
                  <span id="eventLabel">할인 적용가</span>
                  <span id="getDiscount"></span>
               </p>
               <span id="equalSymbolField">
                  <span id="equalSymbol">=</span>
               </span>
               <p id="fixedPriceArea">
                  <span id="fixedPriceLabel">최종 결제 금액</span>
                  <span id="fixedPrice"><em id="fixedTotal"><%= totalMoney %></em>원</span>
               </p>
            </div>
<br/>
            <form action="PaymentComplete" name="frm" method="post" id="frm">
               <div id="pickup_field">
                  <label id="pickupLabel">픽업 역</label>
                  <label class="inputtext control--text"> 
                     <span class="inputtext__indicator" id="stStation">출발지</span> 
                     <img id="startTrain" class="pinmark" src="http://download.seaicons.com/icons/paomedia/small-n-flat/1024/map-marker-icon.png">
                     <input type="text" id="inputStrat" name="startTrain">
                     <span class="trainList" id="trainList1" style="display: none;">
                        <ul>
                        </ul>
                     </span>
                  </label> 
                  
                  <label id="pickupDLabel">픽업 날짜</label>
                  <input type="text" id="isa" name="dateT">
                
                  </div>
   <!--                <label class="inputtext control--text"> 
                     <span id="stDate" class="inputtext__indicator">출발일</span> 
                     <img class="pinmark" id="dateTrain" src="http://download.seaicons.com/icons/paomedia/small-n-flat/1024/calendar-icon.png">
                     <input type="text" id="inputDate" name="dateTrain_2">
                  </label>
                   -->
               </div>
   
            <%
               int num=1;
               String prdCode = "";
               for(int i=0; i<cartList.size(); i++){
                  prdCode += cartList.get(i).getPrdCode();
               }
               if(prdCode.indexOf("B") != -1){
            %>               
               <div id="return_field">
                  <label id="returnSLabel">반납 역</label>
                  <label class="inputtext control--text"> 
                     <span class="inputtext__indicator" id="edStation">도착지</span> 
                     <input   type="text" id="inputEnd" name="endTrain"> 
                     <img id="endTrain" class="pinmark" src="http://download.seaicons.com/icons/paomedia/small-n-flat/1024/map-marker-icon.png">
                     <span class="trainList" id="trainList2" style="display: none;">
                        <ul>
                        </ul>
                     </span>
                  </label> 
                  <label id="returnDLabel">반납 날짜</label>
                  
                   <div>
                   
                   <input type="text" id="i1" name="dateT1">
                     
                  </div>
                <!--   <label class="inputtext control--text"> 
                     <span id="stDate_1" class="inputtext__indicator">출발일</span> 
                     <img class="pinmark" id="dateTrain_1" src="http://download.seaicons.com/icons/paomedia/small-n-flat/1024/calendar-icon.png">
                     <input type="text" id="inputDate_1" name="dateTrain_1">
                  </label> -->
                  
               </div>
               
            <%
               }
            %>
               
         <div>
              <p id="payMethod">결제 방법</p>
              <div class="paymentTypeon" style="border-top-left-radius: 15px;">
                 신용카드
              </div>
              <div class="contextPayment">
                 <table id="contextPaymentTable">
                    <tr>
                       <td>카드종류</td>
                       <td><input type="radio" name="card">개인카드 
                          <input type="radio" name="card">법인카드 
                       </td>
                    </tr>
                    <tr>
                       <td>카드번호</td>
                       <td><input type="text" name="cardO" style="width: 90px;"> -
                          <input type="text" name="cardS" style="width: 90px;"> -
                          <input type="text" name="cardT" style="width: 90px;"> -
                          <input type="text" name="cardF" style="width: 90px;">
                       </td>
                    </tr>
                    <tr>
                       <td>유효기간</td>
                       <td>
                        <select name="m" style="width: 65px; height: 25px;">
                            <option value="월">월</option>
                            <option value="01">01</option>
                            <option value="02">02</option>
                            <option value="03">03</option>
                            <option value="04">04</option>
                            <option value="05">05</option>
                            <option value="06">06</option>
                            <option value="07">07</option>
                            <option value="08">08</option>
                            <option value="09">09</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                        <select name="m" style="width: 65px; height: 25px;">
                            <option value="년">년</option>
                            <option value="2017">2017</option>
                            <option value="2018">2018</option>
                            <option value="2019">2019</option>
                            <option value="2020">2020</option>
                            <option value="2021">2021</option>
                            <option value="2022">2022</option>
                            <option value="2023">2023</option>
                            <option value="2024">2024</option>
                            <option value="2025">2025</option>
                            <option value="2026">2026</option>
                            <option value="2027">2027</option>
                            <option value="2028">2028</option>
                            <option value="2029">2029</option>
                        </select>
                     </td>
                    </tr>
                    <tr>
                       <td>할부개월</td>
                       <td>
                        <select name="m" style="width: 65px; height: 25px;">
                            <option value="일시불">일시불</option>
                            <option value="2개월">2개월</option>
                            <option value="3개월">3개월</option>
                            <option value="4개월">4개월</option>
                            <option value="5개월">5개월</option>
                            <option value="6개월">6개월</option>
                            <option value="12개월">12개월</option>
                            <option value="24개월">24개월</option>
                        </select>
                     </td>
                    </tr>
                    <tr>
                       <td>비밀번호</td>
                       <td><input type="text" style="width: 50px;"> **<span style="color:#d73a3a;"> 앞 2자리</span></td>
                    </tr>
                    <tr>
                       <td>인증번호</td>
                       <td><input type="text" style="width: 90px;"> (주민등록번호 앞 6자리)</td>
                    </tr>
                 </table>
              </div>
                          <div style="width: 250px; position: relative; margin: auto;">
         </div>
         </div>
        <div id="payment">
           			<input type="hidden" name="fixedTotal1" value="<%= totalMoney %>">
           			
           			<input type="hidden" name="fixedTotal2" id="fixedTotal2" >
           			<input type="hidden" name="fixedTotal3" >
                        <button id="btnPayment" onclick="javascript:placeOrder()">결제완료</button>
                        <button id="goBack" onclick="window.history.go(-1); return false;">뒤로</button>
                     
                  </div>
               </form>
         </div>
   
   </div>

</body>
</html>