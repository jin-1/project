<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Random"%>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./css/evnet.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<jsp:include page="../config.jsp" flush="false" />

<style>
.tab_list_category ul {
	list-style: none;
}

.tab_list_category li {
	width: 33%;
	float: left;
	list-style: none;
	border: #0000006e 0.4px solid;
	height: 50px;
	margin-left: -1px;
	padding: 0;
	line-height: 50px;
	text-align: center;
	cursor: pointer;
}

.item_triple {
	background-color: #999;
	color: white;
}

.con_list {
	padding-top: 50px;
	margin-top: 100px;
}
</style>

<script>
	$(document).ready(function() {

		$('.tab_list_category li').on("click", function() {
								
			$('.tab_list_category li').attr("class", "item_triple-none");
			$(this).attr("class","item_triple");
			var tab = $(this).children("ul");
            var tabBtn = tab.children("li").children("a");
            var content = tabBtn.nextAll();

			if($(this).attr("id")=="n1"){
				$('#con').css("display","block");
				$('#con1').css("display","none");
				$('#con2').css("display","none");
				
			} else if($(this).attr("id")=="n2"){
				$('#con1').css("display","block");
				$('#con').css("display","none");
				$('#con2').css("display","none");
				
			} else if($(this).attr("id")=="n3"){
				$('#con2').css("display","block");
				$('#con').css("display","none");
				$('#con1').css("display","none");
				
			}
			
		});

	});
</script>

</head>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>

	<div id="mid">
		<div id="list" class="board list event">
			<div class="list_header" id="listHeader">
				<div class="tit">
					<h2 class="title">이벤트</h2>
				</div>
				<div class="tab_list_category">
					<ul>
						<li class="item_triple" id="n1">진행중<span class="num"></span>
						</li>
						<li class="item_triple-none" id="n2">예정<span class="num"></span></li>
						<li class="item_triple-none" id="n3">종료된 이벤트<span class="num"></span></li>
					</ul>
				</div>
				<div id="con">
					<div class="con_list">
						<table>
							<tr>
							<td>
							<a href="EventAll"><img src="./img/RSP.PNG" /><br />
							이벤트 기간 : 2017-12-21 ~ 2018~12-21
							</a>
							</td>
							</tr>
						</table>
					</div>


				</div>
				<div id="con1" style="display: none;">
					<div class="con_list">
						<table>
							<tr>
								<td><h2 align="center">예정되 있는 이벤트가 없습니다.</h2></td>
							</tr>
						</table>
					</div>


				</div>
				<div id="con2" style="display: none;">
					<div class="con_list">
						<table>
							<tr>
							<td><h2></h2></td>
							</tr>
						</table>
					</div>

				</div>
			</div>
		</div>



	</div>
	<div class="list_content"></div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>

</body>
</html>