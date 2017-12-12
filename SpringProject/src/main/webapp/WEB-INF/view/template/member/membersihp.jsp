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
         <h2>일반회원가입</h2>
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
                     <button class="idConfirm">중복확인</button> <br />
                     <p>ID 중복검사를 해주세요.</p></td>
               </tr>
               <tr>
                  <td>비밀번호</td>

                  <td><br />
                  <input type="password" class="m_pw" size="15" /><br />
                     <p>비밀번호는 8자리 이상으로 만드셔야 합니다.</p></td>
               </tr>
               <tr>
                  <td>비밀번호 확인</td>
                  <td><input type="password" class="m_pwC" size="15" /></td>
               </tr>
               <tr>
                  <td>이름</td>
                  <td><input type="text" class="m_name" maxlength="10"
                     size="10" /></td>
               </tr>
               <tr>
                  <td>전화번호</td>
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
                  <td>생년 월 일</td>
                  <td><input type="date" maxlength="4" class="m_year" size="7" />
                  </td>
               </tr>
               <tr>
                  <td>이메일</td>
                  <td><input type="email" class="ㅡ_mail1" size="10" />&nbsp;@ <select
                     name="c_mail2" id="c_NomSelect1" class="ㅡ_phone1">
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="nate.net">nate.net</option>
                        <option value="naver.com">직접입력</option>
                  </select>&nbsp; <input type="email" class="ㅡ_mail3" size="10" /></td>
               </tr>
               <tr>
                  <td>주소</td>
                  <td class="addrIn"><input type="text" maxlength="3" size="5" />&nbsp;-&nbsp;
                     <input type="text" maxlength="3" size="5" /> &nbsp;
                     <button class="postConfirm">우편번호 검색</button>
                     <br /> <input type="text" size="60" /><br /> <input type="text"
                     size="60" /></td>
               </tr>
               <tr>
                  <td>성별</td>
                  <td><label><input type="radio" name="gender" checked />
                        남성</label> <label><input type="radio" name="gender" /> 여성</label></td>
               </tr>
               <tr>
                  <td>관심사</td>
                  <td><input type="checkbox" />레저<input type="checkbox" />스포츠<input
                     type="checkbox" />역사 <input type="checkbox" />쇼핑<input
                     type="checkbox" />축제<input type="checkbox" />캠핑<br /> <input
                     type="checkbox" />한식<input type="checkbox" />일식<input
                     type="checkbox" />중식 <input type="checkbox" />양식<input
                     type="checkbox" />자동차<input type="checkbox" />펜 <input
                     type="checkbox" />게스트하우스<br />
                     <p>관심사는 최대 4개까지 고를수 있습니다.</p></td>
               </tr>
            </table>
            <div class="bottom">
               <p class="m_confirm">가 입</p>
               <p class="m_cancel">취 소</p>
            </div>
         </div>
      </div>
   </div>
   <div id="bot"></div>
</body>
</html>