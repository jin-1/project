<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="Model.*" %>
<% 
	request.setCharacterEncoding("utf-8"); 
	String menu = "../top.jsp?menu=TOUR Add";
	String img = "url(img/tour.jpg)";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>TRENVIAJES</title>
<jsp:include page="../config.jsp" flush="false" />
</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
		<div id="menuBg" style="background-image:<%=img%>;"></div>
	</div>
	
	<div id="mid">
		내 사업 등록
		<hr>
		사업 명 <input type="text"><br>
		사업자등록번호 <input type="text">-<input type="text">-<input type="text"><br>
		전화번호 <input type="text">-<input type="text">-<input type="text"><br>
		주소 <input type="text" id="sample6_postcode" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소" size=80>
		<input type="text" id="sample6_address2" placeholder="상세주소">
		카테고리<br>
		내용 <textarea rows="8" cols="50"></textarea><br>
		사진첨부 <input type="text"><input type="button"><br>
		<input type="text"><input type="button"><br>
		등록 <input type="submit"><br>
	</div>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		function sample6_execDaumPostcode(){
			new daum.Postcode({
				oncomplete:function(data){
					var fullAddr = '';
					var extraAddr = '';
					
					if(data.uesrSelectedType == 'R'){// 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;
					}else { // 사용자가 지번 주소를 선택했을 경우(J)
		                fullAddr = data.jibunAddress;
		            }
					
					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		            if(data.userSelectedType === 'R'){
		                //법정동명이 있을 경우 추가한다.
		                if(data.bname !== ''){
		                    extraAddr += data.bname;
		                }
		                // 건물명이 있을 경우 추가한다.
		                if(data.buildingName !== ''){
		                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		            }
	
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
		            document.getElementById('sample6_address').value = fullAddr;
	
		            // 커서를 상세주소 필드로 이동한다.
		            document.getElementById('sample6_address2').focus();
				}
			}).open();
		}
	</script>
</body>
</html>