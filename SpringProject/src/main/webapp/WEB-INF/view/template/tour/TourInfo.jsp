<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.lang.String.*" %>
<%@ page import="java.util.*" %>
<%@ page import="Model.*" %>
<% 
	request.setCharacterEncoding("utf-8"); 
	String menu = "../top.jsp?menu=TOUR info";
	String img = "url(img/tour.jpg)";
	TourDTO list = (TourDTO)request.getAttribute("result");
	String[] addr = list.getLocalAddr().split("/");
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
		<center>
			<table border=1>
				<tr>
					<td colspan=4 rowspan=3>
						<img alt="사진1" width=400 height=400 src="img/tour/<%=list.getLocalCode()%>/<%=list.getLocalImage()%>">
					</td>
					<td><%=list.getLocalName() %></td>
				</tr>
				<tr>
					<td><%=list.getLocalPhone() %></td>
				</tr>
				<tr>
					<td>
						<%=addr[1]+" "+addr[2]%>
					</td>
				</tr>
				<tr>
					<td><img alt="사진2" width=100 height=100 src="img/tour/<%=list.getLocalCode()%>/<%=list.getLocalImage()%>"></td>
					<td><img alt="사진3" width=100 height=100 src="#"></td>
					<td><img alt="사진4" width=100 height=100 src="#"></td>
					<td><img alt="사진5" width=100 height=100 src="#"></td>
					<td><%=list.getLocalContent() %></td>
				</tr>
			</table>
			<p></p>
			<div id="map" style="width:500px;height:400px;"></div>
			<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8c84fe2bb777a0b119382064d811c615"></script>
			<script>
				var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
				var options = { //지도를 생성할 때 필요한 기본 옵션
						center: new daum.maps.LatLng(37.498993, 127.0307203), //지도의 중심좌표, 지도 생성에 반드시 필요
						level: 3 //지도의 레벨(확대, 축소 정도)
				};
				var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
				
				// 지도에 마커를 생성하고 표시한다
				var marker = new daum.maps.Marker({
				    position: new daum.maps.LatLng(37.498993, 127.0307203), // 마커의 좌표
				    map: map // 마커를 표시할 지도 객체
				});
			</script>
			<p></p>
		</center>

		<hr>
		<b>리뷰</b>
		<div class="commentView">
			<c:if test="${empty comment}"> 
				등록된 리뷰가 없습니다. <br>
				소중한 경험을 리뷰로 남겨주세요!<br>
				<p></p>
				리뷰 등록 <input type="text" size=80 name="commentAdd" id="commentAdd"/> 
				<input type="button" id="submitButton" value="등록">
				<p></p>
			</c:if>
			<c:if test="${not empty comment}">
				<table border=1 class="commentTable">
					<c:forEach var="comment" items="${comment}" varStatus="status">
						<tr>
							<td>${comment.memberId}</td>
							<td>
								<fmt:formatDate value="${comment.commentDate}" type="date" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
						<tr>
							<td colspan=2>${comment.content}</td>
						</tr>
					</c:forEach>
				</table>
				<p></p>
				<input type="hidden" name="localCode" id="localCode" value="<%=request.getParameter("localCode")%>">
				리뷰 등록 <input type="text" size=80 name="commentAdd" id="commentAdd" /> 
				<input type="submit" id="submitButton" value="등록">
				<p></p>
			</c:if>
		</div>

		<script type="text/javascript">
		 $(document).ready(function(){
			
			$('#submitButton').on("click",function(){
				console.log("dd");
				$.ajax({
		            url : "TourInfo",
		            dataType : "json",
		            type : "post",
		            data : {commentAdd:$('#commentAdd').val(), localCode: "<%=request.getParameter("localCode")%>"},
		            		
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
			});
		 });
		</script>
	</div>
</body>
</html>