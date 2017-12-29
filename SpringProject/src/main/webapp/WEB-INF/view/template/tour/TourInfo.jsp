<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="Model.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String menu = "../top.jsp?menu=TOUR info";
	String img = "url(img/tour.jpg)";
	TourDTO list = (TourDTO) request.getAttribute("result");
	String memLogin = (String)request.getAttribute("memLogin");
	String corpLogin = (String)request.getAttribute("corpLogin");
	String[] addr = list.getLocalAddr().split("/");
	String[] location = list.getTravelCoord().split("/");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>TRENVIAJES</title>
<jsp:include page="../config.jsp" flush="false" />
</head>
<style>
.up{
	padding: 10px;
}
.infoAll{
	float: left;
	margin-left: 100px;
}
.name{
	font-size: 35px;
	font-weight: bold;
}
.cate{
	font-size:15px;
}
.contentTour{
	width: 650px;
	border-top: 5px solid #5BA1B0;
	border-right: 1px solid lightgrey;
	border-left: 1px solid lightgrey;
	border-bottom: 1px solid lightgrey;
	margin: 20px;
	/* padding: 20px; */
}
#map{
	margin: 20px;
}
/* .commentView{
	margin-left: -350px;
} */
.memIdCell{
	width: 100px;
}
.memId{
	font-weight: bold;
	padding: 50px;
	font-size: 20px;
	/* float: right; */
}
.semo{
	width: 0; 
	height: 0; 
	border-right: 20px solid #F6F6F6; 
	border-top: 20px solid transparent; 
	border-bottom: 20px solid transparent;
}
.contNdate{
	padding: 20px;
	width: 600px;
	height: 100px;
	background-color: #F6F6F6;
	border-radius: 5px 5px 5px 5px;
	box-shadow: 7px 7px 5px lightgrey;
}
.commentDate{
	float: right;
	font-size: 12px;
	color: grey;
	position: relative;
	top: 60px;
}
.reviewAdd{
	padding: 20px;
}
#commentAdd{
	width: 700px;
	height: 35px;
	background: #fff;
	border: 1px solid #0E3A53;
	letter-spacing: -1px;
	border-radius: 5px 0px 0px 5px ;
	text-align:center;
	font-size: 15px;
}
#submitButton{
	height: 39px;
	width: 63px;
	cursor: pointer;
	border: 1px solid #444;
	border-radius: 0px 5px 5px 0px ;
	background: #0E3A53; 	
	color: white;
}
</style>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
		<div id="menuBg" style="background-image:<%=img%>;"></div>
	</div>
	
	<div id="mid">
		<div class="up">
			<center>
				<div class="infoAll">
					<br>
					<img alt="사진1" width=500 height=350
								src="/SpringProject/img/tour/<%=list.getLocalImage()%>" class="img"><br>
					<br>
					
					<label class="cate">[<%=list.getLocalCategory()%>]</label><br>
					<label class="name"><%=list.getLocalName()%></label><br><br>
					
					<div class="info">
						☎ <%=list.getLocalPhone()%><br>
						<%=addr[1] + " " + addr[2]%><br><br>
						<div class="contentTour">
							<br><%=list.getLocalContent()%><br><br>
						</div>
					</div>
				</div>
			</center>
	
			<div id="map" style="width: 600px; height: 620px;">
				<script	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ea4fe07842ca6b52074a30963b1e1bd5"></script>
				<script>
					var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
					var options = { //지도를 생성할 때 필요한 기본 옵션
							center: new daum.maps.LatLng(<%=location[0]%>, <%=location[1]%>), //지도의 중심좌표, 지도 생성에 반드시 필요
							level: 3 //지도의 레벨(확대, 축소 정도)
					};
					var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
					
					// 지도에 마커를 생성하고 표시한다
					var marker = new daum.maps.Marker({
					    position: new daum.maps.LatLng(<%=location[0]%>, <%=location[1]%>), // 마커의 좌표
					    map: map // 마커를 표시할 지도 객체
					});
				</script>
			</div>
		</div>
		<hr>
		<center>
			<div class="commentView">
				<h2>리뷰</h2>
				<table class="commentTable" cellpadding=0 cellspacing=0>
	
				</table>
			</div>
		</center>
		
		<p></p>
		<input type="hidden" name="localCode" id="localCode" value="<%=request.getParameter("localCode")%>">
		<br><br>
		<center>
		<label class="reviewAdd"><b>리뷰등록</b></label> <input type="text" size=80 name="commentAdd" id="commentAdd" /> 
		<input type="submit" id="submitButton" value="등록">
		</center>
		<p></p>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$.ajax({
		            url : "TourInfo",
		            dataType : "json",
		            type : "post",
		            async: false,
		            data : {localCode: "<%=request.getParameter("localCode")%>"},
					success : function(data) {
						console.log('data '+data+'dd');
						if(Object.keys(data) == ''){
							$('.commentTable').append('<tr><td>등록된 리뷰가 없습니다.<br>소중한 경험을 남겨주세요.</td></tr>');
						} else{
							$('.commentTable tr').remove();
							$.each(data,function(key,value) {
								var date = new Date(value.commentDate);
								var y = date.getFullYear();
								var m = date.getMonth()+1;
								var d = date.getDay();
								$('.commentTable').append('<tr><td class="memIdCell"><div class="memId">'+ value.memberId+ '&nbsp;&nbsp;</div></td><td><div class="semo"></div></td><td><div class="contNdate">'+ value.content + '<br><label class="commentDate">' + y+"-"+m+"-"+d+ '</label></div></td></tr><tr><td><br></td></tr>');
							});	
						}
					},
					error : function(request,status,error) {
						console.log("code:"	+ request.status+ "\n"+ "error:"+ error);
						}
					});
					$('#submitButton').on("click",function(){
						if(<%=memLogin%> == null && <%=corpLogin%> == null){
							alert("로그인 후 리뷰를 남겨주세요.");
						} else if(<%=corpLogin%> != null){
							alert("기업회원은 리뷰를 남길 수 없습니다.");
						} else{
							$.ajax({
					            url : "TourComment",
					            dataType : "json",
					            type : "post",
					            async: false,
					            data : {commentAdd:$('#commentAdd').val(), localCode: "<%=request.getParameter("localCode")%>"},
								success : function(data) {
									$('.commentTable tr').remove();
									$.each(data,function(key,value) {
										var date = new Date(value.commentDate);
										var y = date.getFullYear();
										var m = date.getMonth()+1;
										var d = date.getDay();
										$('.commentTable').append('<tr><td class="memIdCell"><div class="memId">'+ value.memberId+ '&nbsp;&nbsp;</div></td><td><div class="semo"></div></td><td><div class="contNdate">'+ value.content + '<br><label class="commentDate">' + y+"-"+m+"-"+d+ '</label></div></td></tr><tr><td><br></td></tr>');
									});
								},
								error : function(request,status,error) {
									console.log("code:"	+ request.status+ "\n"+ "error:"+ error);
									}
								});
						}
					});
			});

		</script>
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>