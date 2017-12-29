<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.*,  java.util.*"  %>
<%@ page import="Model.*" %>
<%
   request.setCharacterEncoding("UTF-8");
   String menu = "../top.jsp?menu="+request.getParameter("menu");
   String target = "./template/menu/" + request.getParameter("target") + ".jsp";
   List<ProductDTO> pDTO  = (List<ProductDTO>) request.getAttribute("result");
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./scripts/script.js"></script>
<jsp:include page="../config.jsp" flush="false"/>
<style>
#btnInsert{
   height: 39px;
   width: 63px;
   float:left; 
   cursor: pointer;
   border: 1px solid #444;
   border-radius: 5px 5px 5px 5px ;
   background: #0E3A53;    
   color: white;
   position:relative;
   margin-right:5px;
}
#btnCart{
   height: 39px;
   width: 63px;
   float:left; 
   cursor: pointer;
   border: 1px solid #444;
   border-radius: 5px 5px 5px 5px ;
   background: #0E3A53;    
   color: white;
   position:relative;
   margin-left:5px;
}
#btnArea{
   display:table;
   margin: 0 auto;
   margin-top: 40px;
}
#frm1{
   display:table;
   margin: 0 auto;
   margin-top: 50px;
}
#frm1 th{
   height: 40px;
}
#frm1 td{
   padding-left: 10px;
}
</style>
<script type="text/javascript">
<script type="text/javascript">
   function sendPrd(){
      alert("aaaa");
      document.getElementById("getType").value= document.getElementById("changeType1").value;
      $('.frm1').submit();
   } 

</script>
</head>
<body>
   <div id="top">
      <jsp:include page="<%=menu%>" flush="false" />
   </div>
   <form  id="frm1" name="frm1" class="frm1" method="post" enctype="multipart/form-data" > 
   <div id="mid">
      <table class="ModifyTable" width="800px">
         <colgroup>
            <col width="30%">
            <col width="70%">
         </colgroup>
         <thead>
            <tr>
               <th style="background-color: #eeeeee; text-align: center;"></th>
               <th style="background-color: #eeeeee; text-align: center;">상품 수정</th>
            </tr>
         </thead>
         <tbody>
            <%
            int num=1;
            for(int i=0; i<pDTO.size(); i++){
            %>
            <tr>
               <th style="background-color: #eeeeee; text-align: center;">카테고리</th>
               <td>
                  <select name="prdCategory" id="prdCategory" onchange="javascript:prdCategory1()">
                     <option value="<%= pDTO.get(i).getPrdCategory()%>"><%=pDTO.get(i).getPrdCategory()%></option>
                     
                  </select>
               </td>
            </tr>
      
            <tr>
               <th style="background-color: #eeeeee; text-align: center;">세부 카테고리</th>
               <td>
                  <div  id="prdType2">
                      <select id="changeType1" name="prdType">
                         <option value="<%= pDTO.get(i).getPrdType()%>"><%=pDTO.get(i).getPrdType()%></option>
                        
                     </select> 
                  </div>
               </td>
            </tr>
            <tr>
               <th style="background-color: #eeeeee; text-align: center;">상품명</th>
               <td><input type="text" id="prdName1" name="prdName" placeholder="<%=pDTO.get(i).getPrdName()%>"></td>
            </tr>
            <tr>
               <th style="background-color: #eeeeee; text-align: center;">가격</th> 
               <td><input type="text" id="prdPrice1" name="prdPrice" placeholder="<%=pDTO.get(i).getPrdPrice()%>"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');"></td>
            </tr>
            <tr>
               <th style="background-color: #eeeeee; text-align: center;">등록된 사진</th>
               <td><img height="200" width="200" src="/SpringProject/img/prd/<%=pDTO.get(i).getPrdImg()%>"></td>
            </tr>
            <%
            }
            %>
         </tbody>
      </table>
      
      <div id="btnArea">
         <input type="hidden" id="getType" name="prdType">
         <!-- <input type="submit"  value="등록"> -->
         <button class="btnInsert" onclick="javascript:sendPrd();">등록</button>
         <button class="btnCart" onclick="window.history.back(); return false;">취소</button> 
      </div>
   </div>
    </form>
   </div>
   <div id="bot">
      <jsp:include page="../bot.jsp" flush="false" />
   </div>
</body>
</html>