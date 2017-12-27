<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
function() {
	sendRequest("Budget.jsp", params, responseResult, "POST");
}
</script>
</head>
<body>
<h1 align="center">00 님의 예산</h1>
<hr>
<table>
<tr>
<td>
<button onclick="location='Budget.jsp'">등록</button>
<input type="button" name="insert" value="삭제" >
</td>
</tr>
</table>
</body>
</html>