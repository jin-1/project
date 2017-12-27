<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="Model.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("utf-8"); 
	String menu = "../top.jsp?menu=my TOUR";
	String img = "url(img/tour.jpg)";
	int num = 0;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>TRENVIAJES</title>
<jsp:include page="../config.jsp" flush="false" />
</head>
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
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
		<div id="menuBg" style="background-image:<%=img%>;"></div>
	</div>
	
	<div id="mid">
		<center>
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
		</center>		
	</div>
</body>
</html>