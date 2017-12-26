<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="Model.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<script type="text/javascript">
	$(document).ready(function(){
		$('#addToBusi').on('click',function(){
			var loche = true;
			
			var localName = $('.localName').val();
			
			var localNum1 = $('.localNum1').val();
			var localNum2 = $('.localNum2').val();
			var localNum3 = $('.localNum3').val();
			
			var postcode = $('#postcode').val();
			var address = $('#address').val();
			var address2 = $('#address2').val();
			
			var localPhone1 = $('.localPhone1').val();
			var localPhone2 = $('.localPhone2').val();
			
			var smallCategory = $('.smallCategory').val();
			
			var localContent = $('.localContent').val();
			
			var localImage1 = $('.localImage1').val();
			/* var localImage2 = $('.localImage2').val(); */
			
			if(localName == '' | localName == null){
				alert("사업 명을 입력해주세요.");
				$('.localName').focus();
				loche = false;
			} else if(localNum1 == '' | localNum1 == null | localNum1.length != 3
					| localNum2 == '' | localNum2 == null | localNum2.length != 2
					| localNum3 == '' | localNum3 == null | localNum3.length != 5) {
				alert("사업자등록번호를 입력해주세요.");
				$('.localNum1').focus();
				loche = false;
			} else if(postcode == '' | postcode == null
					| address == '' | address == null
					| address2 == '' | address2 == null) {
				alert("주소를 입력해주세요.");
				$('.address2').focus();
				loche = false;
			} else if(localPhone1 == '' | localPhone1 == null | localPhone1.length < 3
					| localPhone2 == '' | localPhone2 == null | localPhone2.length < 3) {
				alert("사업지 번호를 입력해주세요.");
				$('.localPhone1').focus();
				loche = false;
			} else if(smallCategory == ''){
				alert("카테고리를 지정해주세요.");
				loche = false;
			} else if(localContent == '' | localContent == null){
				alert("사업 내용을 입력해주세요.");
				$('.localContent').focus();
				loche = false;
			} /* else if(localImage1 == '' | localImage1 == null
					| localImage2 == '' | localImage2 == null){
				alert("파일첨부를 해주세요.");
				loche = false;
			} */ else if(loche == true){
				$('.localNumAll').val(
						$('.localNum1').val() + "-" + $('.localNum2').val() + "-" + $('.localNum3').val());
				$('#addressAll').val(
						$('#postcode').val() + "/" + $('#address').val() + "/" + $('#address2').val());
				$('.localPhoneAll').val(
						$('.corpPhone').val() + "-" + $('.localPhone1').val() + "-" + $('.localPhone2').val());
				console.log($('.localImage1').val());
				/* $('.localImageAll').val(
						$('.localImage1').val() + "/" + $('.localImage2').val()); */
				$('.form').submit();
			}
		});
		
		$('.localNum1').keypress(function(event){
			if(event.which && (event.which <= 47 || event.which >= 58) && event.which != 8){
				event.preventDefault();
				alert("숫자만 입력 가능합니다.");
			}
		});
		$('.localNum2').keypress(function(event){
			if(event.which && (event.which <= 47 || event.which >= 58) && event.which != 8){
				event.preventDefault();
				alert("숫자만 입력 가능합니다.");
			}
		});
		$('.localNum3').keypress(function(event){
			if(event.which && (event.which <= 47 || event.which >= 58) && event.which != 8){
				event.preventDefault();
				alert("숫자만 입력 가능합니다.");
			}
		});
		$('.localPhone1').keypress(function(event){
			if(event.which && (event.which <= 47 || event.which >= 58) && event.which != 8){
				event.preventDefault();
				alert("숫자만 입력 가능합니다.");
			}
		});
		$('.localPhone2').keypress(function(event){
			if(event.which && (event.which <= 47 || event.which >= 58) && event.which != 8){
				event.preventDefault();
				alert("숫자만 입력 가능합니다.");
			}
		});
	});
</script>
<script type="text/javascript">
	var categoryFunc = function(){
		this.food = ['한식','분식','중식','일식'];
		this.house = ['호텔','모텔','찜질방','게스트하우스'];
		this.spot = ['자연','역사','박물관','레저'];
		
		this.smallCate = function(category){
			var categoryArray = [];
			switch(category){
				case '맛집': categoryArray = this.food; break;
				case '숙박': categoryArray = this.house; break;
				case '관광지': categoryArray = this.spot; break;
			}
			return categoryArray;
		};
	};
	
	categoryFunc.prototype = {
			smallChange: function(category, cateField){
				cateField.empty().append('<option value="">--소분류--</option>');
				$.each(this.smallCate(category), function(i, str){
					cateField.append('<option value="'+str+'">'+str+'</option>');
				});
			}
	};

	$(document).ready(function(){
		$('select[name=bigCategory]').bind('change', function(){
			$("#frmNavi input[name='bigCategory']").val($(this).val());
			var catef = new categoryFunc;
			catef.smallChange($(this).val(), $('select[name=localCategory]'));
		});
		$('select[name=localCategory]').bind('change', function(){
			$("#frmNavi input[name='localCategory']").val($(this).val());
		});
	});
</script>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
		<div id="menuBg" style="background-image:<%=img%>;"></div>
	</div>
	
	<div id="mid">
		내 사업 등록
		<hr>
		
		<form:form enctype="multipart/form-data" class="form" method="post" modelAttribute="localAdd" autocomplete="off">
			<input type="hidden" name="realPath" value="<%= application.getRealPath("/") %>">
			사업 명 <input type="text" class="localName" name="localName"><br>
			
			사업자등록번호 <input type="text" maxlength=3 class="localNum1">
			-<input type="text" maxlength=2 class="localNum2">
			-<input type="text" maxlength=5 class="localNum3"><br>
			<input type="hidden" class="localNumAll" name="registrationNum">
			
			전화번호 
			<select class="corpPhone" class="localNum">
				<option value="02">02</option>
				<option value="031">031</option>
				<option value="032">032</option>
				<option value="033">033</option>
				<option value="041">041</option>
				<option value="042">042</option>
				<option value="043">043</option>
				<option value="044">044</option>
				<option value="051">051</option>
				<option value="052">052</option>
				<option value="053">053</option>
				<option value="054">054</option>
				<option value="055">055</option>
				<option value="061">061</option>
				<option value="062">062</option>
				<option value="063">063</option>
				<option value="064">064</option>
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
				<option value="013">013</option>
				<option value="070">070</option>
			</select>
			-<input type="text" maxlength=4 class="localPhone1">
			-<input type="text" maxlength=4 class="localPhone2"><br>
			<input type="hidden" class="localPhoneAll" name="localPhone">
			
			주소 <input type="text" id="postcode" placeholder="우편번호" readOnly>
			<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="address" placeholder="주소" size=80 readOnly>
			<input type="text" id="address2" placeholder="상세주소"><br>
			<input type="hidden" id="addressAll" name="localAddr">
			
			카테고리
			<select title="대분류선택" name="bigCategory">
				<option value="">--대분류--</option>
				<option value="맛집">맛집</option>
				<option value="숙박">숙박</option>
				<option value="관광지">관광지</option>
			</select>
			<select title="소분류선택" name="localCategory" class="smallCategory">
				<option value="">--소분류--</option>
			</select><br>
			
			내용 <textarea rows="8" cols="50" class="localContent" name="localContent"></textarea><br>
			
			사진첨부 <input type="file" class="localImage1" name="localImageSave"/>
			<!-- <input type="file" class="localImage2"><br>
			<input type="hidden" class="localImageAll" name="localImage"/> -->
			
			<input type="button" id="addToBusi" value="등록"><br>
		</form:form>
	</div>
</body>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
	function execDaumPostcode(){
		new daum.Postcode({
			oncomplete:function(data){
				var fullAddr = '';
				var extraAddr = '';
				
				if(data.userSelectedType == 'R'){// 사용자가 도로명 주소를 선택했을 경우
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
	            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('address').value = fullAddr;

	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById('address2').focus();
			}			
		}).open();
	}
</script>
</html>