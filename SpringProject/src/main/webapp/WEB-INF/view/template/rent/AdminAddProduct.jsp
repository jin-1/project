<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.*, Model.*"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu="+request.getParameter("menu");
	String target = "./template/menu/" + request.getParameter("target") + ".jsp";
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./scripts/script.js"></script>
<jsp:include page="../config.jsp" flush="false"/> 
<script type="text/javascript">

 	var sel="";
 	
	function prdCategory1(){ 
		/* alert("b"); */
		var option= document.getElementById("prdCategory").value;
		sel ="<select id='changeType1'> <option>-- Select below --</option>";
		
		if(option=="food"){
			sel+=' <option value="물">물</option>'
			sel+=' <option value="탄산음료">탄산음료</option>'
			sel+=' <option value="커피">커피</option>'
			sel+=' <option value="초콜릿">초콜릿</option>'
			sel+=' <option value="라면">라면</option>'
			sel+=' <option value="과자">과자</option>'
			sel+=' <option value="견과류">견과류</option>'
			sel+=' </select>';
			$('#prdType2').html(sel);	
		} else if(option=="body"){
			sel+=' <option value="헤어케어">헤어케어</option>'
			sel+=' <option value="스킨케어">스킨케어</option>'
			sel+=' <option value="면도기">면도기</option>';
			sel+=' </select>';
			$("#prdType2").html(sel);	
		} else if(option=="outdoor"){
			sel+=' <option value="수영복">수영복</option>'
			sel+=' <option value="텐트">텐트</option>'
			sel+=' <option value="슬리퍼">슬리퍼</option>';
			sel+=' </select>';
			$("#prdType2").html(sel);	
		} else if(option=="electronics"){
			sel+=' <option value="충전기기">충전기기</option>'
			sel+=' <option value="카메라">카메라</option>'
			sel+=' <option value="배터리">배터리</option>'
			sel+=' <option value="음향기기">음향기기</option>';
			sel+=' </select>';
			$("#prdType2").html(sel);
		}	
	 };

	function sendPrd(){
		alert("aaaa");
		document.getElementById("getType").value= document.getElementById("changeType1").value;
		$('.frm1').submit();
	} 

</script>
</head>
<body>
	
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
 	<form  id="frm1" name="frm1" class="frm1" method="post" enctype="multipart/form-data" > <!-- enctype="multipart/form-data" -->
	<div id="mid">
	
 
		<table class="AddTable" width="800px">
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;"></th>
					<th style="background-color: #eeeeee; text-align: center;">상품 등록</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">카테고리</th>
					<td>
						<select name="prdCategory" id="prdCategory" onchange="javascript:prdCategory1()">
							<option>-- Select below --</option>
							<option value="food">FOOD</option>
							<option value="body">BODY CARE</option>
							<option value="outdoor">OUTDOOR & MORE</option>
							<option value="electronics">ELECTRONICS</option>
						</select>
					</td>
				</tr>
		
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">세부 카테고리</th>
					<td>
						<div  id="prdType2">
						 	<select id="changeType1" name="prdType">
								<option>-- Select below --</option>
							</select> 
						</div>
					</td>
				</tr>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">상품명</th>
					<td><input type="text" id="prdName1" name="prdName" placeholder="상품명"><br></td>
				</tr>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">가격</th>
					<td><input type="text" id="prdPrice1" name="prdPrice" placeholder="00,000" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"><br></td>
				</tr>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">사진 첨부</th>
					<td><input type="file" name="prdImgSave" class="getPrdImg"></td>
				</tr>
			</tbody>
		</table>
		

			<input type="hidden" id="getType" name="prdType">
			<!-- <input type="submit"  value="등록"> -->
			<button class="btnInsert" onclick="javascript:sendPrd();">등록</button>
			<button class="btnCart" onclick="window.history.back(); return false;">취소</button> 
<!-- 	onclick="javascript:sendPrd()"	 -->
	</div>
 	</form>
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
	
</body>
</html>