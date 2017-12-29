<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Random"%>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Event</title>
<link href="./css/styles.css?ver=1" rel="stylesheet" type="text/css">
<link href="./css/train.css?ver=1" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="./scripts/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="./scripts/script.js"></script>
<script language="javascript">
	function user(user) {
		var params = "user=" + user;
		sendRequest("EventResult.jsp", params, responseResult, "POST");
	}
</script>
</head>
<body>
<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	
	
	<div id="mid" align="center">
	<table>
	<tr>
	<td>
		<%
			try {
				//전적을 세션에서 받아옴
			int win_com =  Integer.parseInt(String.valueOf(session.getAttribute("win_you")));
			int	win_you =  Integer.parseInt(String.valueOf(session.getAttribute("win_com")));
		%>
		<h2>
			현재 전적:
			<%=win_you%>:<%=win_com%></h2>
		<%
			if (win_com > 2 || win_you > 2) {
		%>
		</td>
		<td>
		<%
			if (win_com > win_you) {
		%>
		<h1>패배!</h1>
		<%
			} else {
		%>
		<h1>승리!</h1>
		
		<%
			}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
       </td>
       </tr>
       
       <tr>
       <td>
		<h1 align="center">가위바위보 게임</h1>
		<p>
			<img src="./img/RSP.PNG">
		</p>
		</td>
	    </tr>
		<tr>
		<td align="center">
		<form action="EventResult" method="get">
			<input name="you" type="image" src="./img/SJi2.png" value="0">
			<input name="you" type="image" src="./img/SBaa2.png" value="1">
			<input name="you" type="image" src="./img/SMook2.png" value="2">
			</form>
			</td>
			</tr>
			

			</table>
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>

