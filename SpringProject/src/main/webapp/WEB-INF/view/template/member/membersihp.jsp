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
<jsp:include page="../config.jsp" flush="false" />
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
</style>
</head>
<body>
   <div id="top">
      <jsp:include page="./template/top.jsp?menu=<%=menu%>" flush="false" />
   </div>
   <div id="mid">
      <div id="container">
         <h2>�Ϲ�ȸ������</h2>
         <hr />
         <div id="form">
            <table class="m_table">
               <colgroup>
                  <col span="1" width="20%" style="background: #EAEAEA" />
                  <col width="70%" />
               </colgroup>
               <tr>
                  <td>ID</td>
                  <td><input type="text" class="m_id" maxlength="15" size="20" />&nbsp;
                     <button class="idConfirm">�ߺ�Ȯ��</button> <br />
                     <p>ID �ߺ��˻縦 ���ּ���.</p></td>
               </tr>
               <tr>
                  <td>��й�ȣ</td>

                  <td><br />
                  <input type="password" class="m_pw" size="15" /><br />
                     <p>��й�ȣ�� 8�ڸ� �̻����� ����ž� �մϴ�.</p></td>
               </tr>
               <tr>
                  <td>��й�ȣ Ȯ��</td>
                  <td><input type="password" class="m_pwC" size="15" /></td>
               </tr>
               <tr>
                  <td>�̸�</td>
                  <td><input type="text" class="m_name" maxlength="10"
                     size="10" /></td>
               </tr>
               <tr>
                  <td>��ȭ��ȣ</td>
                  <td><select name="hpNo1" id="hpNoSelect" class="m_phone1">
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                  </select>&nbsp;-&nbsp; <input type="text" class="m_phone2" maxlength="4"
                     size="5" /> &nbsp;-&nbsp; <input type="text" class="m_phone3"
                     maxlength="4" size="5" /></td>
               </tr>
               <tr>
                  <td>���� �� ��</td>
                  <td><input type="date" maxlength="4" class="m_year" size="7" />
                  </td>
               </tr>
               <tr>
                  <td>�̸���</td>
                  <td><input type="email" class="��_mail1" size="10" />&nbsp;@ <select
                     name="c_mail2" id="c_NomSelect1" class="��_phone1">
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="nate.net">nate.net</option>
                        <option value="naver.com">�����Է�</option>
                  </select>&nbsp; <input type="email" class="��_mail3" size="10" /></td>
               </tr>
               <tr>
                  <td>�ּ�</td>
                  <td class="addrIn"><input type="text" maxlength="3" size="5" />&nbsp;-&nbsp;
                     <input type="text" maxlength="3" size="5" /> &nbsp;
                     <button class="postConfirm">�����ȣ �˻�</button>
                     <br /> <input type="text" size="60" /><br /> <input type="text"
                     size="60" /></td>
               </tr>
               <tr>
                  <td>����</td>
                  <td><label><input type="radio" name="gender" checked />
                        ����</label> <label><input type="radio" name="gender" /> ����</label></td>
               </tr>
               <tr>
                  <td>���ɻ�</td>
                  <td><input type="checkbox" />����<input type="checkbox" />������<input
                     type="checkbox" />���� <input type="checkbox" />����<input
                     type="checkbox" />����<input type="checkbox" />ķ��<br /> <input
                     type="checkbox" />�ѽ�<input type="checkbox" />�Ͻ�<input
                     type="checkbox" />�߽� <input type="checkbox" />���<input
                     type="checkbox" />�ڵ���<input type="checkbox" />�� <input
                     type="checkbox" />�Խ�Ʈ�Ͽ콺<br />
                     <p>���ɻ�� �ִ� 4������ ���� �ֽ��ϴ�.</p></td>
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