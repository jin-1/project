<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 
	request.setCharacterEncoding("utf-8"); 
	String menu = "../top.jsp?menu=TOUR result";
	String img = "url(img/tour.jpg)";
	String login = (String)request.getAttribute("corpLogin");
	String memLogin = (String)request.getAttribute("memLogin");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>TRENVIAJES</title>
<jsp:include page="../config.jsp" flush="false" />
</head>
<script type="text/javascript">
	var areaFunc = function(){
		this.seoul = ['강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구'];
		this.busan = ['강서구','금정구','기장군','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구'];
		this.daegu = ['남구','달서구','달성군','동구','북구','서구','수성구','중구'];
		this.incheon = ['강화군','계양구','남구','남동구','동구','부평구','서구','연수구','옹진군','중구'];
		this.gwangju = ['광산구','남구','동구','북구','서구'];
		this.daejeon = ['대덕구','동구','서구','유성구','중구'];
		this.ulsan = ['남구','동구','북구','울주군','중구'];
		this.gyeonggi = ['가평군','고양시','고양시 덕양구','고양시 일산동구','고양시 일산서구','과천시','광명시','광주시','구리시','군포시','김포시','남양주시','동두천시','부천시','부천시 소사구','부천시 오정구','부천시 원미구','성남시','성남시 분당구','성남시 수정구','성남시 중원구','수원시','수원시 권선구','수원시 영통구','수원시 장안구','수원시 팔달구','시흥시','안산시','안산시 단원구','안산시 상록구','안성시','안양시','안양시 동안구','안양시 만안구','양주시','양평군','여주군','연천군','오산시','용인시','용인시 기흥구','용인시 수지구','용인시 처인구','의왕시','의정부시','이천시','파주시','평택시','포천시','하남시','화성시'];
		this.gangwon = ['강릉시','고성군','동해시','삼척시','속초시','양구군','양양군','영월군','원주시','인제군','정선군','철원군','춘천시','태백시','평창군','홍천군','화천군','횡성군'];
		this.chungnam = ['계룡시','공주시','금산군','논산시','당진시','보령시','부여군','서산시','서천군','아산시','예산군','천안시','천안시 동남구','천안시 서북구','청양군','태안군','홍성군'];
		this.chungbuk = ['괴산군','단양군','보은군','영동군','옥천군','음성군','제천시','증평군','진천군','청원군','청주시','청주시 상당구','청주시 흥덕구','충주시'];
		this.jeonnam = ['강진군','고흥군','곡성군','광양시','구례군','나주시','담양군','목포시','무안군','보성군','순천시','신안군','여수시','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군'];
		this.jeonbuk = ['고창군','군산시','김제시','남원시','무주군','부안군','순창군','완주군','익산시','임실군','장수군','전주시','전주시 덕진구','전주시 완산구','정읍시','진안군'];
		this.gyeongnam = ['거제시','거창군','고성군','김해시','남해군','밀양시','사천시','산청군','양산시','의령군','진주시','창녕군','창원시','창원시 마산합포구','창원시 마산회원구','창원시 성산구','창원시 의창구','창원시 진해구','통영시','하동군','함안군','함양군','합천군'];
		this.gyeongbuk = ['경산시','경주시','고령군','구미시','군위군','김천시','문경시','봉화군','상주시','성주군','안동시','영덕군','영양군','영주시','영천시','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군','포항시','포항시 남구','포항시 북구'];
		this.sejong = ['가람동','고운동','금남면','나성동','다정동','대평동','도담동','반곡동','보람동','부강면','새롬동','소담동','소정면','아름동','어진동','연기면','연동면','연서면','장군면','전동면','전의면','조치원읍','종촌동','한솔동'];
		
		this.sidoEreturn = function(sido){
			var sidoArray = [];
			switch(sido){
				case '서울': sidoArray = this.seoul; break;
				case '부산': sidoArray = this.busan; break;
				case '대구': sidoArray = this.daegu; break;
				case '인천': sidoArray = this.incheon; break;
				case '광주': sidoArray = this.gwangju; break;
				case '대전': sidoArray = this.daejeon; break;
				case '울산': sidoArray = this.ulsan; break;
				case '경기': sidoArray = this.gyeonggi; break;
				case '강원': sidoArray = this.gangwon; break;
				case '충남': sidoArray = this.chungnam; break;
				case '충북': sidoArray = this.chungbuk; break;
				case '전남': sidoArray = this.jeonnam; break;
				case '전북': sidoArray = this.jeonbuk; break;
				case '경남': sidoArray = this.gyeongnam; break;
				case '경북': sidoArray = this.gyeongbuk; break;
				case '세종': sidoArray = this.sejong; break;
			}
			return sidoArray;
		};
	};
	
	areaFunc.prototype = {
			gugunChange: function(sido, gugunFild){
				gugunFild.empty().append('<option value="">시/군/구</option>');
				$.each(this.sidoEreturn(sido), function(i, str){
					gugunFild.append('<option value="'+str+'">'+str+'</option>');
				});
			}
	};

	$(document).ready(function(){
		$('select[name=SearchArea1]').bind('change', function(){
			$("#frmNavi input[name='SearchArea1']").val($(this).val());
			var areaf = new areaFunc;
			areaf.gugunChange($(this).val(), $('select[name=SearchArea2]'));
		});
		$('select[name=SearchArea2]').bind('change', function(){
			$("#frmNavi input[name='SearchArea2']").val($(this).val());
		});
	});	
</script>
<style>
#mid {
	width:60%;
	margin-left: 20%; 
	height: auto;
	postion:relative;
}
.searchName{
	width: 250px;
	height: 35px;
	background: #fff;
	border: 1px solid #0E3A53;
	letter-spacing: -1px;
	border-radius: 5px 5px 5px 5px ;
	text-align:center;
	margin-top: 20px;
	position: relative;
	margin-right: 20px;
}
.sido{
	width: 140px;
	height: 35px;
	border: 1px solid #0E3A53;
	border-radius: 5px 5px 5px 5px ;
	position: relative;
	margin-top: 20px;
	margin-right: 1px;
}
.sigungu{
	width: 140px;
	height: 35px;
	border: 1px solid #0E3A53;
	border-radius: 5px 5px 5px 5px ;
	margin-top: 20px;
	position: relative;
}
.food{
	width: 160px;
	text-align: left;
	margin-left: 20px;
	display: inline-block;
	margin-right: 20px;
}
.house{
	width: 160px;
	text-align: left;
	display: inline-block;
	margin-right: 20px;
}
.spot{
	width: 160px;
	text-align: left;
	display: inline-block;
	margin-right: 20px;
} 
.searchButton{
	height: 39px;
	width: 63px;
	cursor: pointer;
	border: 1px solid #444;
	border-radius: 5px 5px 5px 5px ;
	background: #0E3A53; 	
	color: white;
	position:relative;
}
.allResult{
	width: 650px;
	height: 318px;
	border: 1px solid #EAEAEA;
	padding: 5px;
	margin: 15px;
	display: block;
	clear: both;
}
.nameNimg{
	background-color: #F0EEE9;
	width: 270px;
	padding: 20px;
	float: left;
}
.ect{
	padding-right: 20px;
	padding-left: 20px;
	diplay: inline-block;
	height: 317px;
	width: 300px;
	float: right;
}
a[class]{
	color: #003789;
	text-decoration: underline;
	text-weight: bold;
}
a:hover{
	color: #B2B0B0;
}
.cate{
	text-align: right;
	font-weight: bold;
}
.localImg{
	width: 200px;
	height: 200px;
	border: 3px solid white;
}
</style>
<body>
	<div id="top">
		<jsp:include page="<%=menu%>" flush="false" />
		<div id="menuBg" style="background-image:<%=img%>;"></div>
	</div>
	
	<div id="mid">
		<form:form modelAttribute="tourDTO" action="TourResult" method="get">

			<center>

				<form:input path="localName" class="searchName" placeholder="이름 검색"/>
				
				<select class="sido" id="locationSelect" title="시/도 선택" name="SearchArea1">
					<option value="">시/도</option>
					<option value="서울">서울</option>
					<option value="부산">부산</option>
					<option value="대구">대구</option>
					<option value="인천">인천</option>
					<option value="광주">광주</option>
					<option value="대전">대전</option>
					<option value="울산">울산</option>
					<option value="세종">세종</option>
					<option value="경기">경기</option>
					<option value="강원">강원</option>
					<option value="충남">충남</option>
					<option value="충북">충북</option>
					<option value="전남">전남</option>
					<option value="전북">전북</option>
					<option value="경남">경남</option>
					<option value="경북">경북</option>
				</select>
				<select title="시/군/구 선택" class="sigungu" name="SearchArea2">
					<option value="">시/군/구</option>
				</select>
				<p></p>
				<div class="food">
					<fieldset>
						<legend>맛집</legend>
						<input type="checkbox" name="category" value="0">한식<br>
						<input type="checkbox" name="category" value="1">중식<br>
						<input type="checkbox" name="category" value="2">일식<br>
						<input type="checkbox" name="category" value="3">분식
					</fieldset>
				</div>
				
				<div class="house">
					<fieldset>
						<legend>숙박</legend>
						<input type="checkbox" name="category" value="4">호텔<br>
						<input type="checkbox" name="category" value="5">모텔<br>
						<input type="checkbox" name="category" value="6">찜질방<br>
						<input type="checkbox" name="category" value="7">게스트하우스
					</fieldset>
				</div>
				
				<div class="spot">
					<fieldset>
						<legend>관광지</legend>
						<input type="checkbox" name="category" value="8">자연<br>
						<input type="checkbox" name="category" value="9">레저<br>
						<input type="checkbox" name="category" value="10">역사<br>
						<input type="checkbox" name="category" value="11">박물관
					</fieldset>
				</div>
				<input type="submit" value="검색" class="searchButton">
				
				<p></p>
				<label class="addMyBusi">내 사업 등록하기</label>&nbsp;&nbsp;&nbsp;
				<label class="viewMyBusi">내 사업 보기</label>&nbsp;&nbsp;&nbsp;
				<script type="text/javascript">
					$(document).ready(function(){
						$('.addMyBusi').on("click", function(){
							if(<%=login%> == null && <%=memLogin%> == null){
								alert("기업 로그인 후 사업을 등록해주세요.\n기업의 사업등록은 '마이페이지>사업등록'에서도 가능합니다.");
								location.replace("LoginForm");
							} else if(<%=login%> == null && <%=memLogin%> != null){
								alert("일반 회원은 사업등록을 하실 수 없습니다.\n기업 로그인 후 이용해주세요.");
							} else{
								location.replace("TourAdd");
							}
						});
						
						$('.viewMyBusi').on("click", function(){
							if(<%=login%> == null && <%=memLogin%> == null){
								alert("사업 보기는 기업 로그인 후 이용 가능합니다.");
								location.replace("LoginForm");
							} else if(<%=login%> == null && <%=memLogin%> != null){
								alert("일반 회원은 사업보기를 하실 수 없습니다.\n기업 로그인 후 이용해주세요.");
							} else{
								location.replace("MyTour");
							}
						});
					});
				</script>
				
				<c:if test="${ empty result }">
					<br>검색 결과가 없습니다.
				</c:if>
				
				<c:if test="${ not empty result }">					
					<c:forEach var="tour" items="${result}" varStatus="status">
						<div class="allResult">
							<div class="nameNimg">
								<h2>
									<a href="TourInfo?localCode=${tour.localCode}" name="localCode" class="aTag">
										<label class="label">${tour.localName}</label>
									</a>
								</h2>
								
								<img alt="여행지 이미지" class="localImg" src="/SpringProject/img/tour/${tour.localImage}"><br>
							</div>
							<div class="ect">
								<p class="cate">[${tour.localCategory}]</p><br>
								☎ ${tour.localPhone}<br>
								<c:set var="str1" value="${tour.localAddr}" />
							    <c:set var="splitStr" value="${fn:split(str1, '/') }" />
							    ${splitStr[1]}, <br>${splitStr[2]}
								<hr>
								${tour.localContent}
							</div>
						</div>
					</c:forEach>
				</c:if>
			</center>

		</form:form>
	</div>
	
	<div id="bot">
		<jsp:include page="../bot.jsp" flush="false" />
	</div>
</body>
</html>