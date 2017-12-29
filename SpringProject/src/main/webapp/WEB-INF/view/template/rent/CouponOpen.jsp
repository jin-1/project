<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*, Model.*, java.util.*"  %>
<%
request.setCharacterEncoding("UTF-8");
List<EventDTO> view = (List<EventDTO>)request.getAttribute("eventApply");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
/* $(document).ready(function() {
	var selectedCode = "";
	$("input[name='geteventCode']:checked").each(function(){
		selectedCode = $(this).val();
	}
	
} */
function sendevent(){
	  document.getElementById('viewCouponList').submit();
	  window.close();
}

</script>
<body>
	<form id="viewCouponList" action="CouponDelete">
		<table align="center" width="100%" border=1>
			<colgroup>
				<col width="20%">
				<col width="50%">
				<col width="20%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">쿠폰 코드</th>
					<th style="background-color: #eeeeee; text-align: center;">쿠폰 적용가</th>
					<th style="background-color: #eeeeee; text-align: center;">쿠폰 기한</th>
					<th style="background-color: #eeeeee; text-align: center;">적용</th>
				</tr>
			</thead>
			<%
			int num=1;
			for(int i=0; i<view.size(); i++){
			%>
			<tr align="center">
				<td><%= view.get(i).getElectedCode() %></td>
				<td><%= view.get(i).getEventCategory() %></td>
				<td><%= view.get(i).getExpriyDate() %></td>
				<td><input type="checkbox" name="geteventCode" id="geteventCode" value="<%=view.get(i).getElectedCode() %>" /></td> 
			</tr>
			<%
			}
			%>
			<tr align="center">
				<td colspan="4"><button id="chooseEvent" onclick="javascript:sendevent();">적용하기</button>
			</tr>
		</table>
	</form>

</body>
</html>