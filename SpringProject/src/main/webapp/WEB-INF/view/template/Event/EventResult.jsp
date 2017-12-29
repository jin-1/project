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
<title>결과 화면</title>
<jsp:include page="../config.jsp" flush="false" />
</head>
<body>
<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
	</div>
	<div id="mid" align="center">
	<table>
		<tr>
			<td>
				<h1 align="center">User</h1> <%
 	switch (Integer.parseInt(request.getParameter("you"))) {
 	case 0:
 %><p>
					<img src="./img/Ji.PNG">
				</p> <%
 	break;
 	case 1:
 %><p>
					<img src="./img/Baa.PNG">
				</p> <%
 	break;
 	case 2:
 %><p>
					<img src="./img/Mook.PNG">
				</p> <%
 	break;
 	}
 %> <%
 	//컴퓨터 난수 설정
 	int com = 0;
 	String result = null;
 	Random random = new Random();
 	com = random.nextInt(3);

 	//이긴 횟수 계산(컴퓨터/당신)
 	int win_com, win_you;
 	if (session.getAttribute("win_you") == null) {
 		win_com = 0;
 		win_you = 0;
 	} else {
 		win_com = Integer.parseInt(String.valueOf(session.getAttribute("win_you")));
 		win_you = Integer.parseInt(String.valueOf(session.getAttribute("win_com")));
 %>
			</td>

			<td>
				<h1 align="center">Com</h1> <%
 	switch (com) {
 		case 0:
 %><p>
					<img src="./img/Ji.PNG">
				</p> <%
 	break;
 		case 1:
 %><p>
					<img src="./img/Baa.PNG">
				</p> <%
 	break;
 		case 2:
 %><p>
					<img src="./img/Mook.PNG">
				</p> <%
 	break;
 		}

 		//가위바위보 게임 결과 저장
 		switch (Integer.parseInt(request.getParameter("you"))) {
 		case 0:
 			if (com == 1) {
 				result = "승리";
 				win_you++;
 				break;
 			} else if (com == 2) {
 				result = "패배";
 				win_com++;
 				break;
 			} else {
 				result = "무승부";
 				break;
 			}
 		case 1:
 			if (com == 1) {
 				result = "무승부";
 				break;
 			} else if (com == 2) {
 				result = "승리";
 				win_you++;
 				break;
 			} else {
 				result = "패배";
 				win_com++;
 				break;
 			}
 		case 2:
 			if (com == 1) {
 				result = "패배";
 				win_com++;
 				break;
 			} else if (com == 2) {
 				result = "무승부";
 				break;
 			} else {
 				result = "승리";
 				win_you++;
 				break;
 			}
 		}
 	}
 %>
			</td>
		</tr>

		<tr>
			<td>
				<%
					//전적을 세션에 저장
					session.setAttribute("win_you", win_you);
					session.setAttribute("win_com", win_com);
				%>
			</td>
			<td>
				<h1><%=result%></h1>
				<p>
					<a href="EventAll">다시 하기</a>
				</p>
			</td>
		</tr>
	</table>
	</div>
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>
</body>
</html>



