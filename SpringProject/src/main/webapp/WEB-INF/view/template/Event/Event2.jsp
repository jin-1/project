<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
	request.setCharacterEncoding("UTF-8");
	String menu = "../top.jsp?menu=" + request.getParameter("menu");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<jsp:include page="../config.jsp" flush="false" />
<style>
ul, ol, li {
    margin: 0;
    padding: 0;
    list-style: none;
}

.section3 {
    clear: both;
    background: #ffeeb3;
    padding: 0 0 80px 0;
}
.content3 {
    position: relative;
    padding-top: 80px;
}
.content {
    width: 900px;
    margin-bottom: 100px;
}
img {
    border: 0;
    display: block;
}
center {
    display: block;
    text-align: -webkit-center;
}
.section3 .content3 .vsMenupan .rps	li {
    position: absolute;
    top: 138px;
    left: 90px;
    width: 240px;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
form {
    display: block;
    margin-top: 0em;
}
.btnRps {
    position: absolute;
    top: 380px;
    left: 575px;
}
.btnRps li {
    float: left;
    margin-right: 5px;
}
.rps li {
    position: absolute;
    top: 138px;
    left: 560px;
    width: 240px;
}

</style>
<script>
var win=0;
function getRandom(num){
	var my_num = Math.floor(Math.random()*num);
	return my_num;
}

function Rresult(ID,ComNum){
	var myResult;
	
	if(ID=="2"&&ComNum=="2"){ //유저:가위 컴:보
		myResult = 1;
		Number(win++);
		$('#win').text("승리 :"+Number(win));
		
	}else if(ID=="3"&&ComNum=="0"){ //유저:바위 컴:가위
		myResult = 1;
		Number(win++);
		$('#win').text("승리 :"+Number(win));
	
	}else if(ID=="4"&&ComNum=="1"){ //유저:보 컴:바위
		myResult = 1;
		Number(win++);
		$('#win').text("승리 :"+Number(win));
		
	}else{
		myResult = 0;
	}
	return myResult;
}

function T(){
	if(form.selectU.value==""){
		alert("가위,바위,보를 선택해 주세요!");
	}else{
		document.getElementById("Victory").style.display = "none";
		for(var i = 0;i<=2;i++){
			document.getElementById('Com'+i).style.display = 'none';
		}
		document.getElementById("rps1").style.display = "none";
		document.getElementById("rps2").style.display = "";	
		setTimeout("PopRPS()",1000);
	}
}

function PopRPS(){
		form.txt_temp.value  = 0;	
		var win=0;
		var ComNum = getRandom(3);
		var ID = form.selectU.value;
		
		//비겼을 경우 처리
		if(ID==ComNum+2){
			if(ComNum == 0){
				ComNum=1;
			}else if(ComNum == 1){
				ComNum=2;
			}else{
				ComNum=0;
			}
		}
		
		// ID : 2:가위 3:바위 4:보
		// ComNum 0 :가위 1:바위 2:보
		document.getElementById("rps1").style.display = "none";
		document.getElementById("rps2").style.display = "none";
		
		for(var i = 0;i<=2;i++){
			if(i==ComNum){
				document.getElementById('Com'+ComNum).style.display = '';
			}else{
				document.getElementById('Com'+i).style.display = 'none';
			}
		}
		
		var Uresult = Rresult(ID,ComNum);

		//유저가 승리했을 경우
		if(Uresult=="1"){
			document.getElementById("Victory").style.display = "";
			var position = $("#Victory").offset();
			//$('html,body').animate({scrollTop: position.top}, 2000);
			alert("축하 합니다. 승리하셨네요!!");
		}else{
			
			form.selectU.value == "";			
			document.getElementById("Victory").style.display = "none";
		}
		form.selectU.value  = "";
		var goUrl;
		goUrl = "./coupon.jsp?Status="+Uresult;
		window.open(goUrl, "rps", "menubar=no, status=yes, scrollbars=yes, resizable=no,width=320,height=310");			
	}				

function UserClick(ID){
	var count=0;
	for(var i = 1;i<=4;i++){
		if(i==ID){
			document.getElementById('user'+ID).style.display = '';
			form.selectU.value  = ID;
			count++;
			count+=count;
		}else if(count==4){
			document.getElementById('user'+ID).style.display = '';
			form.selectU.value  = ID;
			alert("참여 횟수를 소진하였습니다.");
		}else{
			document.getElementById('user'+i).style.display = 'none';
					
		}
		
	}
}
</script>
</head>
<body>
<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
		</div>
		<div id="mid">
<div class="section3" align="center">
		<div class="content content3">
			<img src="./img/MainVS.jpg" alt="대결 가위바위보" />
			<div class="vsMenupan">
			<h1 id="win">승리 : </h1>
				<ul class="rps">
					<li style="display:;" id="rps1"><img src="./img/rps_basic.gif"></li>			
					<li style="display:none;" id="rps2"><img id="img1" src="./img/rps_all.gif"></li>
					<li style="display:none;" id="Com0"><img src="./img/rps_scissors.gif" alt="가위"></li>
					<li style="display:none;" id="Com1"><img src="./img/rps_rock.gif" alt="바위"></li>
					<li style="display:none;" id="Com2"><img src="./img/rps_paper.gif" alt="보"></li>
				</ul>
			</div>
			<form name="form" id="form">	
			<input type="text" id="txt_temp" value="1" style="display:none;">
			<input type="text" id="selectU" value="" style="display:none;">
			
			<div class="vsMine">
				<ul class="rps">
					<li style="display:;" id="user1"><img src="./img/rps_basic.gif"></li>
					<li style="display:none;" id="user2"><img src="./img/rps_scissors.gif" alt="가위"></li>
					<li style="display:none;" id="user3"><img src="./img/rps_rock.gif" alt="바위"></li>
					<li style="display:none;" id="user4"><img src="./img/rps_paper.gif" alt="보"></li>
				</ul>
				<ul class="btnRps">
					<li><a href="javascript:;" onclick="javascript:UserClick(2);"><img src="./img/btn_scissors.gif" alt="가위"></a></li>
					<li><a href="javascript:;" onclick="javascript:UserClick(3);"><img src="./img/btn_rock.gif" alt="바위"></a></li>
					<li><a href="javascript:;" onclick="javascript:UserClick(4);"><img src="./img/btn_paper.gif" alt="보"></a></li>
				</ul>
				
			</div>
			<p class="btnVs">
				<a href="javascript:;" onclick="javascript:T();"><img src="./img/btn_vs.gif"></a>
			</p>
			<div class="content content4" id="Victory" style="display:none;">
				<ul class="choice">
				</ul>
				<p class="name"></p>
				<div class="mobile">
									
				</div>
			
				<ul class="agree">
				</ul>
		</div>
		</form>
		</div>
		</div>
		</div>
		
	<div id="bot"><jsp:include page="../bot.jsp" flush="false" /></div>

</body>
</html>