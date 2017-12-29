<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.*, java.util.*" %>
<%
   request.setCharacterEncoding("UTF-8");
   String menu = "../top.jsp?menu=RENT";
   String img = "url(img/rent.jpg)";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="./css/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./scripts/script.js"></script>
<jsp:include page="../config.jsp" flush="false" />
<style type="text/css">
#mid {
   width:60%;
   height: auto;
   postion:relative;
   margin-left: 20%;
}
div {
   display: block;
} 
#nav-critical {
   padding-top: 90px;
   display: table;
   margin: 0 auto;
}
#process{
   height: 100px;
   width:900px;
   border-radius:5px;
   position: relative;
   border-bottom: 4px solid #444;
}
#current_page {
   float:left;
   width:200px;
   font-size: 35px;
}
#step_list{
   float: right;
   padding-right: 10px; 
}
#step_list li {
   display:list-item;
   list-style: none;
   float:left;
   width: 160px;
   padding-left:10px;
   text-align: center;
   height: 100px;
   font-size: 18px;
}
#circle {
   position:relative;
   float:left;
   background-color: #C3DDD6;
   margin:3px auto;
   width: 40px;
   height: 40px;
   border-radius: 20px;
}
#current_circle {
   float:left;
   position:relative;
   background-color: #5BA1B0;
   margin:3px auto;
   width: 40px;
   height: 40px;
   border-radius: 20px;
}
#circle_level {
   position: absolute;
   top:50%;
   left:50%;
   transform: translate(-50%, -50%);
   color: #fff;   
}
#step_list span {
   width:95px;
   height: 32px;
   display: inline-block;
   vertical-align:top;
}
#msg1{
   text-align: center;
   width: 900px;
   margin-top: 60px;
}
</style>
</head>
<body>
   <div id="top">
         <jsp:include page="<%=menu%>" flush="false" />
         <div id="menuBg" style="background-image:<%=img%>;"></div>
   </div>
   <div id="mid">
      <div class="container">
         <div id="nav-critical">
            <div id="process">
               <span id="current_page">결제완료</span>
               <ul id="step_list">
                  <li>
                     <div id="circle">
                        <div id="circle_level">1</div>
                     </div>
                     <span>장바구니</span>
                  </li>
                  <li>
                     <div id="circle">
                        <div id="circle_level">2</div>
                     </div>
                     <span>주문/결제</span>
                  </li>
                  <li>
                     <div id="current_circle">
                        <div id="circle_level">3</div>
                     </div>
                     <span>결제완료</span>
                  </li>
               </ul>
            </div>
            <div id="msg1">
            <center>결제가 완료되었습니다. 이용해주셔서 감사드립니다. 편안한 여행되길 바랍니다. </center>
            </div>
         </div>
   </div>
</div>
   <div id="bot">
      <jsp:include page="../bot.jsp" flush="false" />
   </div>
</body>
</html>