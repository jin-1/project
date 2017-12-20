<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String menu = request.getParameter("menu");
	String target = "./template/menu/" + request.getParameter("target") + ".jsp";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<link href="./css/train.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="./scripts/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="./scripts/script.js" charset="utf-8"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
.mid {
	margin: auto;
}

.container {
	
}

.m_table {
	width: 100%;
	border-top: 1px solid #D5D5D5;
	border-collapse: collapse;
	width: 60%;
}

.m_table td {
	padding: 15px;
	border-bottom: 1px solid #D5D5D5;
}

.m_table tr {
	height: auto;
	border-bottom: 1px solid #D5D5D5;
}

.m_table p {
	font-size: 12px;
	color: #FF8224;
}

.addrIn input {
	margin: 5px;
}

.m_confirm {
	width: 150px;
	height: 35px;
	background-color: #3163C9;
	padding-top: 12px;
	font-weight: bold;
	color: #FFFFFF;
	text-align: center;
	vertical-align: middle;
	display: inline-block
}

.m_cancel {
	width: 150px;
	height: 35px;
	background-color: #686868;
	padding-top: 12px;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
	color: #FFFFFF;
	display: inline-block;
}

.bottom {
	text-align: center;
}
.m_idcheck{
	padding-top:20px;
}
.tour{
	width:20%;
}
</style>
</head>
<body>
	<div id="top">
		<jsp:include page="./template/top.jsp?menu=<%=menu%>" flush="false" />
	</div>
	<div id="mid">
		<div id="container">
			<h2>����������</h2>
			<hr />
			<div id="form">
				<table class="m_table">
					<colgroup>
						<col span="1" width="20%" style="background: #EAEAEA" />
						<col width="70%" />
					</colgroup>
					<tr>
						<td>ID</td>
						<td class="m_idcheck"><input type="text" class="mc_id" maxlength="15" size="20" />&nbsp;
							<br />
							<p>ID �ߺ��˻縦 ���ּ���. ID�� ����, ����, Ư�����ڷ� �ּ� 4���� �̻��̿��� �˴ϴ�.</p>
							</td>
					</tr>
					<tr>
						<td>��й�ȣ</td>

						<td><br /> <input type="password" class="mc_pw" size="15" /><br />
							<p>��й�ȣ�� 8�ڸ� �̻� 15�ڸ� ���� ����, ���� Ȥ�� Ư�����ڸ� �ݵ�� �����ؾ� �մϴ�.</p></td>
					</tr>
					<tr>
						<td>��й�ȣ Ȯ��</td>
						<td><input type="password" class="mc_pwC" size="15" /></td>
					</tr>
					<tr>
						<td>�̸�</td>
						<td><input type="text" class="mc_name" maxlength="10"
							size="10" /></td>
					</tr>
					<tr>
						<td>��ȭ��ȣ</td>
						<td><select name="hpNo1" id="hpNoSelect" class="mc_phone1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select>&nbsp;-&nbsp; <input type="text" class="mc_phone2" maxlength="4"
							size="5" /> &nbsp;-&nbsp; <input type="text" class="mc_phone3"
							maxlength="4" size="5" /></td>
					</tr>
					<tr>
						<td>���� �� ��</td>
						<td><input type="date" maxlength="4" class="mc_year" size="7" />
						</td>
					</tr>
					<tr>
						<td>�̸���</td>
						<td><input type="email" class="m_mail1" size="10" />&nbsp;@
							<input type="email" class="m_mail2" size="10" />&nbsp; <select
							name="c_mail2" id="m_NomSelect1" class="mc_mail3">
								<option value="1">�����Է�</option>
								<option value="naver.com" selected>naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option>
								<option value="empas.com">empas.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
								<option value="freechal.com">freechal.com</option>
								<option value="lycos.co.kr">lycos.co.kr</option>
								<option value="korea.com">korea.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmir.com">hanmir.com</option>
								<option value="paran.com">paran.com</option>
						</select></td>
					</tr>
					<tr>
						<td>�ּ�</td>
						<td class="addrIn"><input type="text" maxlength="5" size="8" id="mc_post1"/>
							<button class="postConfirm">�����ȣ �˻�</button> <br /> 
							<input type="text" size="60" id="mc_post2"/><br /> 
							<input type="text" size="60" id="mc_post3"/></td>
					</tr>
					<tr>
						<td>����</td>
						<td><label><input type="radio" name="gender" checked />
								����</label> <label><input type="radio" name="gender" /> ����</label></td>
					</tr>
					<tr>
						<td rowspan="3">���ɻ�</td>
						<td class="tour">������  &nbsp;&nbsp;&nbsp;&nbsp;
						<label><input type="checkbox" />����</label>
						<label><input type="checkbox" />������</label>
						<label><input type="checkbox" />���� </label>
						<label><input type="checkbox" />����</label>
					    </td>
					</tr>
					<tr>
						<td>��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label><input type="checkbox" />�ѽ�</label>
						<label><input type="checkbox" />�Ͻ�</label>
						<label><input type="checkbox" />�߽� </label>
						<label><input type="checkbox" />���</label>
						</td>
					</tr>
					<tr>
						<td>��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label><input type="checkbox" />ȣ��</label>
						<label><input type="checkbox" />����</label>
						<label><input type="checkbox" />������</label>
						<label><input type="checkbox" />�Խ�Ʈ�Ͽ콺</label> <br/>
						<p>���ɻ�� �ִ� 6������ ���� �ֽ��ϴ�.</p>
						</td>
					</tr>
				</table>
				<div class="bottom">
					<p class="m_confirm">�� ��</p>
					<p class="m_cancel">�� ��</p>
				</div>
			</div>
		</div>
	</div>
	<div id="bot"></div>
</body>
</html>