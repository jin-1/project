<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	int num = 0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TRENVIAJES</title>
<jsp:include page="../config.jsp" flush="false" />
<link href="./css/train.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="./scripts/trainScript.js"></script>

</head>
<body>

	<div id="top" style="height: 100px;">
		<div id="menubgc"></div>
		<div id="menuBg"></div>
		<div id="header">
			<div id="logo">
				<a href="/SpringProject/main"><img src="img/3-2.png" /></a>
			</div>
			<div id="menu">
				<ul>
					<li><a href="adminIndex">회원/기업</a></li>
					<li><a href="adminTrain">기차</a></li>
					<li><a href="adminRent">대여</a></li>
					<li><a href="adminTour">여행지</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div id="mid1" style="display: inline-block; width: 85%; height: 700px; margin-left: 280px; overflow-y: auto;">
		<script>
			$(document).ready(function(){
				$('.busiDelete').on('click', function(){
					var index = $('.busiDelete').index(this);
					console.log(index);
					var a = confirm("정말 삭제하시겠습니까?");
					if(a == true){
						var code = $(this).attr("id");
						$.ajax({
							url:"DeleteView",
							dataType:"json",
							type:"post",
							data:{"localCode":code}, //보내야할 값
							success:function(data){
								console.log(data);
								$('.d'+index).remove();
							},
							error : function(request, status, error) {
								console.log("code:" + request.status + "\n" + "error:"
										+ error);
							}
						});
						alert("삭제 되었습니다.");
					} else{
						alert("삭제 되지 않았습니다.");
					}
				});
			});
		</script>
		<p></p>
		<c:if test="${ empty result }">
				아직 요청된 사업이 없습니다.
		</c:if>
		
		<table cellpadding=0 cellspacing=0 border=1 class="content">						
			<c:if test="${ not empty result }">					
				<c:forEach var="view" items="${result}" varStatus="status">
					<tr class="d<%=num%>">
						<td rowspan=4>
							<img alt="여행지 이미지" width=150 height=150 src="/SpringProject/img/tour/${view.localImage}">
						</td>
						<td>${view.corpId}</td>
						<td>[${view.localCategory}] ${view.localName}</td>
						<td>${view.registrationNum}</td>
						<td rowspan=4>
							<c:if test="${view.requestStatus == 0 }">대기</c:if>
							<c:if test="${view.requestStatus == 1 }">수락</c:if>
							<c:if test="${view.requestStatus == 2 }">거절</c:if>
						</td>
						<td rowspan=4>
							<a href="ViewOne?localCode=${view.localCode}">수정</a><br>
							<input type="hidden" class="hiddenCode" value="${view.localCode}">
							<a id="${view.localCode}" class="busiDelete">삭제</a>
						</td>
					</tr>
					
					<tr class="d<%=num%>">
						<td colspan=3>${view.localPhone}</td>	
					</tr>
					
					<tr class="d<%=num%>">
						<td colspan=3>${view.localAddr}</td>
					</tr>
					
					<tr class="d<%=num%>">
						<td colspan=3>${view.localContent}</td>
					</tr>
					<%num++; %>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<!-- /mid -->
	<div id="left"
		style="width: 12%; min-height: 900px; height: 105%; top: 100px; position: absolute; background-color: #595959;">
		<ul>
			<li style="margin-bottom: 30px; margin-top: 30px;"><a href="adminTour">사업 요청 상태 보기</a></li>
			<li><a href="ViewAdd">사업 등록 하기</a></li>

		</ul>
	</div>
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>