<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="Model.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("utf-8"); 
	String menu = "../top.jsp?menu=TOUR modify";
	String img = "url(img/tour.jpg)";
	TourDTO mmt = (TourDTO) request.getAttribute("result");
	String[] regiNum = mmt.getRegistrationNum().split("-");
	String[] localPhn = mmt.getLocalPhone().split("-");
	String[] localAddr = mmt.getLocalAddr().split("/");
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
			var localImage1 = $('.localImage1').val();
			
			if(localImage1 == '' | localImage1 == null){
				alert("파일첨부를 해주세요.");
				loche = false;
			} else if(loche == true){
				$('.form').submit();
			}
		});
	});
</script>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
		<div id="menuBg" style="background-image:<%=img%>;"></div>
	</div>
	
	<div id="mid">
		내 사업 수정<br>
		사업 수정은 내용과 이미지만 가능합니다.<br>
		그 외에 다른 내용을 수정하고 싶으시다면 새로 등록해주시길 바랍니다. 
		<hr>
		<input type="hidden" name="localCode" id="localCode" value="<%=request.getParameter("localCode")%>">
		<form:form enctype="multipart/form-data" class="form" method="post" modelAttribute="localAdd" autocomplete="off">
			<input type="hidden" name="realPath" value="<%= application.getRealPath("/") %>">
			사업 명 <input type="text" class="localName" name="localName" value="<%=mmt.getLocalName()%>" readOnly><br>
			
			사업자등록번호 <input type="text" maxlength=3 class="localNum1" value="<%=regiNum[0]%>" readOnly>
			-<input type="text" maxlength=2 class="localNum2" value="<%=regiNum[1]%>" readOnly>
			-<input type="text" maxlength=5 class="localNum3" value="<%=regiNum[2]%>" readOnly><br>
			
			전화번호 
			<input type="text" maxlength=4 class="localPhone1" value="<%=localPhn[0]%>" readOnly>
			-<input type="text" maxlength=4 class="localPhone1" value="<%=localPhn[1]%>" readOnly>
			-<input type="text" maxlength=4 class="localPhone2" value="<%=localPhn[2]%>" readOnly><br>
			
			주소 <input type="text" id="postcode" value="<%= localAddr[0] %>" readOnly><br>
			<input type="text" id="address" value="<%= localAddr[1] %>" size=80 readOnly>
			<input type="text" id="address2" value="<%= localAddr[2] %>" readOnly><br>
			
			카테고리
<%
			if(mmt.getLocalCategory().equals("한식") || mmt.getLocalCategory().equals("분식")
					|| mmt.getLocalCategory().equals("일식") || mmt.getLocalCategory().equals("중식")){%>
				<input type="text" maxlength=4 class="localPhone1" value="맛집" readOnly>
<%
			} else if(mmt.getLocalCategory().equals("호텔") || mmt.getLocalCategory().equals("모텔")
					|| mmt.getLocalCategory().equals("찜질방") || mmt.getLocalCategory().equals("게스트하우스")){ %>
				<input type="text" maxlength=4 class="localPhone1" value="숙박" readOnly>
<%
			} else if(mmt.getLocalCategory().equals("자연") || mmt.getLocalCategory().equals("레저")
					|| mmt.getLocalCategory().equals("역사") || mmt.getLocalCategory().equals("박물관")){ %>
				<input type="text" maxlength=4 class="localPhone1" value="관광지" readOnly>
<%
			}
%>
			<input type="text" maxlength=4 class="localPhone1" value="<%= mmt.getLocalCategory() %>" readOnly><br>
			
			내용 <textarea rows="8" cols="50" class="localContent" name="localContent"><%= mmt.getLocalContent() %></textarea><br>
			
			이전 사진 <img alt="사진1" width=400 height=400 src="/SpringProject/img/tour/<%= mmt.getLocalImage() %>"><br>
			사진첨부 <input type="file" class="localImage1" name="localImageSave"/><br>
			<!-- <input type="file" class="localImage2"><br>
			<input type="hidden" class="localImageAll" name="localImage"/> -->
			
			<input type="button" id="addToBusi" value="등록"> &nbsp;&nbsp; <input type="button" id="back" value="취소" onclick="history.go(-1);"><br>
		</form:form>
	</div>
</body>
</html>