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
<style>
.des{
	font-size: 12px;
	color: #FF8224;
}
tr{
	height: 60px;
	padding: 20px;
}
th{
	background-color: #F6F6F6;
	padding: 20px;
}
td{
	padding: 20px;
}
#addToBusi{
	height: 39px;
	width: 80px;
	cursor: pointer;
	border: 1px solid #444;
	border-radius: 5px 5px 5px 5px ;
	background: #0E3A53; 	
	color: white;
	position: relative;

}
#back{
	height: 39px;
	width: 80px;
	cursor: pointer;
	border: 1px solid grey;
	border-radius: 5px 5px 5px 5px ;
	background: grey; 	
	color: white;
	position: relative;

}
</style>
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
		<h2>내 사업 수정</h2>
		<label class="des">
			사업 수정은 내용과 이미지만 가능합니다.<br>
			그 외에 다른 내용을 수정하고 싶으시다면 새로 등록해주시길 바랍니다. 
		</label>
		
		<hr>
		<input type="hidden" name="localCode" id="localCode" value="<%=request.getParameter("localCode")%>">
		<form:form enctype="multipart/form-data" class="form" method="post" modelAttribute="localAdd" autocomplete="off">
			<input type="hidden" name="realPath" value="<%= application.getRealPath("/") %>">
			<table border=1 cellspacing=0 cellpadding=0>
				<tr>
					<th>사업 명</th>
					<td colspan=3>
						<input type="text" class="localName" name="localName" value="<%=mmt.getLocalName()%>" readOnly>
					</td>
				</tr>
				<tr>
					<th>사업자등록번호</th>
					<td colspan=3>
						<input type="text" maxlength=3 class="localNum1" value="<%=regiNum[0]%>" readOnly>
						-<input type="text" maxlength=2 class="localNum2" value="<%=regiNum[1]%>" readOnly>
						-<input type="text" maxlength=5 class="localNum3" value="<%=regiNum[2]%>" readOnly>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan=3>
						<input type="text" maxlength=4 class="localPhone1" value="<%=localPhn[0]%>" readOnly>
						-<input type="text" maxlength=4 class="localPhone1" value="<%=localPhn[1]%>" readOnly>
						-<input type="text" maxlength=4 class="localPhone2" value="<%=localPhn[2]%>" readOnly>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan=3>
						<input type="text" id="postcode" value="<%= localAddr[0] %>" readOnly><br>
						<input type="text" id="address" value="<%= localAddr[1] %>" size=80 readOnly>
						<input type="text" id="address2" value="<%= localAddr[2] %>" readOnly>
					</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td colspan=3>
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
						<input type="text" maxlength=4 class="localPhone1" value="<%= mmt.getLocalCategory() %>" readOnly>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan=3>
						<textarea rows="8" cols="50" class="localContent" name="localContent"><%= mmt.getLocalContent() %></textarea>
					</td>
				</tr>
				<tr>
					<th rowspan=2>사진첨부</th>
					<td>이전 사진</td>
					<td><img alt="사진1" width=400 height=400 src="/SpringProject/img/tour/<%= mmt.getLocalImage() %>"></td>
				</tr>
				<tr>
					<td>새 사진</td>
					<td colspan=2>
						<br>
						<input type="file" class="localImage1" name="localImageSave"/><br>
						<p class="des">
							사진을 수정하지 않더라도 다시 사진을 첨부해주세요.<br>
							수정 시 사진을 첨부하지 않으시면 사진이 없는 상태로 수정이 됩니다.
						</p>
					</td>
				</tr>
			</table>
			<br>
			<center>			
				<input type="button" id="addToBusi" value="등록"> &nbsp;&nbsp; 
				<input type="button" id="back" value="취소" onclick="history.go(-1);"><br>
			</center>
		</form:form>
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>