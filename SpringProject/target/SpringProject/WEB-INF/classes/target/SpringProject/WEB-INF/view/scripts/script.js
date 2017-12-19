$(document).ready(function() {

	$(window).scroll(function() {
		var scrollValue = $(document).scrollTop();

		if (scrollValue > 100) {
			$('#header').css("display", "none");
			$('#headerSub').stop().slideDown();

		} else {
			$('#header').css("display", "inline");
			$('#headerSub').stop().slideUp(300);
		}
	});
	$('#typography').animate({
		opacity : '1',
		top : '30%'
	}, 1000);
	// setInterval("ozit_interval_test()", 5000); // 매 5000ms(5초)가 지날 때마다
	// ozit_timer_test() 함수를 실행합니다.
	$('#ABOUT,#menuHr,#menug').mouseenter(function() {
		$('#ABOUT').css('color', '#F0EEE9');
		$('#menuHr').stop().animate({
			opacity : '1',
			width : '100%'
		});
		$('#menug').stop().animate({
			opacity : '1',
			left : '7.5%'
		});
	});
	$('#ABOUT,#menuHr,#menug').mouseleave(function() {
		$('#ABOUT').css('color', '#B2B0B0');
		$('#menuHr').stop().animate({
			opacity : '0'
		});
		$('#menuHr').stop().animate({
			width : '0%'
		});
		$('#menug').stop().animate({
			opacity : '0'
		});
	});

	$('#NOTICE,#menuHr,#menug').mouseenter(function() {
		$('#NOTICE').css('color', '#F0EEE9');
		$('#menuHr').stop().animate({
			opacity : '1',
			width : '100%'
		});
		$('#menug').stop().animate({
			opacity : '1',
			left : '25%'
		});
	});
	$('#NOTICE,#menuHr,#menug').mouseleave(function() {
		$('#NOTICE').css('color', '#B2B0B0');
		$('#menuHr').stop().animate({
			opacity : '0',
			width : '0%'
		});
		$('#menug').stop().animate({
			opacity : '0'
		});
	});

	$('#TOUR,#menuHr,#menug').mouseenter(function() {
		$('#TOUR').css('color', '#F0EEE9');
		$('#menuHr').stop().animate({
			opacity : '1',
			width : '100%'
		});
		$('#menug').stop().animate({
			opacity : '1',
			left : '42%'
		});
	});
	$('#TOUR,#menuHr,#menug').mouseleave(function() {
		$('#TOUR').css('color', '#B2B0B0');
		$('#menuHr').stop().animate({
			opacity : '0',
			width : '0%'
		});
		$('#menug').stop().animate({
			opacity : '0'
		});
	});

	$('#RENT,#menuHr,#menug').mouseenter(function() {
		$('#RENT').css('color', '#F0EEE9');
		$('#menuHr').stop().animate({
			opacity : '1',
			width : '100%'
		});
		$('#menug').stop().animate({
			opacity : '1',
			left : '58%'
		});
	});
	$('#RENT,#menuHr,#menug').mouseleave(function() {
		$('#RENT').css('color', '#B2B0B0');
		$('#menuHr').stop().animate({
			opacity : '0',
			width : '0%'
		});
		$('#menug').stop().animate({
			opacity : '0'
		});
	});

	$('#TRAIN,#trainSub,#menuHr,#menug').mouseenter(function() {
		$('#TRAIN').css('color', '#F0EEE9');
		$('#trainSub').stop().animate({
			opacity : '1'
		});
		$('#menuHr').stop().animate({
			opacity : '1',
			width : '100%'
		});
		$('#menug').stop().animate({
			opacity : '1',
			left : '74.5%'
		});
	});
	$('#TRAIN,#trainSub,#menuHr,#menu').mouseleave(function() {
		$('#TRAIN').css('color', '#B2B0B0');
		$('#trainSub').stop().animate({
			opacity : '0'
		});
		$('#menuHr').stop().animate({
			opacity : '0',
			width : '0%'
		});
		$('#menug').stop().animate({
			opacity : '0'
		});
	});

	$('#EVENT,#menuHr,#menug').mouseenter(function() {
		$('#EVENT').css('color', '#F0EEE9');
		$('#menuHr').stop().animate({
			opacity : '1',
			width : '100%'
		});
		$('#menug').stop().animate({
			opacity : '1',
			left : '91%'
		});
	});
	$('#EVENT,#menuHr,#menug').mouseleave(function() {
		$('#EVENT').css('color', '#B2B0B0');
		$('#menuHr').stop().animate({
			opacity : '0',
			width : '0%'
		});
		$('#menug').stop().animate({
			opacity : '0'
		});
	});

	$('#ABOUTSub').mouseenter(function() {
		$('#ABOUTSub').css('color', '#F0EEE9');
		$('#menuHrSub').stop().animate({
			opacity : '1',
			width : '100%'
		});
	});
	$('#ABOUTSub').mouseleave(function() {
		$('#ABOUTSub').css('color', '#B2B0B0');
		$('#menuHrSub').stop().animate({
			opacity : '0'
		});
		$('#menuHrSub').stop().animate({
			width : '0%'
		});
	});

	$('#NOTICESub').mouseenter(function() {
		$('#NOTICESub').css('color', '#F0EEE9');
		$('#menuHrSub').stop().animate({
			opacity : '1',
			width : '100%'
		});
	});
	$('#NOTICESub').mouseleave(function() {
		$('#NOTICESub').css('color', '#B2B0B0');
		$('#menuHrSub').stop().animate({
			opacity : '0',
			width : '0%'
		});
	});

	$('#TOURSub,#menuHrSub').mouseenter(function() {
		$('#TOURSub').css('color', '#F0EEE9');
		$('#menuHrSub').stop().animate({
			opacity : '1',
			width : '100%'
		});
	});
	$('#TOURSub,#menuHrSub').mouseleave(function() {
		$('#TOURSub').css('color', '#B2B0B0');
		$('#menuHrSub').stop().animate({
			opacity : '0',
			width : '0%'
		});
	});

	$('#RENTSub,#menuHrSub').mouseenter(function() {
		$('#RENTSub').css('color', '#F0EEE9');
		$('#menuHrSub').stop().animate({
			opacity : '1',
			width : '100%'
		});

	});
	$('#RENTSub,#menuHrSub').mouseleave(function() {
		$('#RENTSub').css('color', '#B2B0B0');
		$('#menuHrSub').stop().animate({
			opacity : '0',
			width : '0%'
		});
	});
	$('#TRAINSub,#menuHrSub').mouseenter(function() {
		$('#TRAINSub').css('color', '#F0EEE9');
		$('#menuHrSub').stop().animate({
			opacity : '1',
			width : '100%'
		});

	});
	$('#TRAINSub,#menuHrSub').mouseleave(function() {
		$('#TRAINSub').css('color', '#B2B0B0');

		$('#menuHrSub').stop().animate({
			opacity : '0',
			width : '0%'
		});

	});

	$('#EVENTSub,#menuHrSub').mouseenter(function() {
		$('#EVENTSub').css('color', '#F0EEE9');
		$('#menuHrSub').stop().animate({
			opacity : '1',
			width : '100%'
		});

	});
	$('#EVENTSub,#menuHrSub,#menug').mouseleave(function() {
		$('#EVENTSub').css('color', '#B2B0B0');
		$('#menuHrSub').stop().animate({
			opacity : '0',
			width : '0%'
		});
	});

	$('#trainInfo').mouseenter(function() {
		$('#trainInfo').css('color', '#F0EEE9');
	});
	$('#trainInfo').mouseleave(function() {
		$('#trainInfo').css('color', '#B2B0B0');
	});
	$('#trainTicket').mouseenter(function() {
		$('#trainTicket').css('color', '#F0EEE9');
	});
	$('#trainTicket').mouseleave(function() {
		$('#trainTicket').css('color', '#B2B0B0');
	});

	// 경부 호남 경전 전라 클릭이벤트
	$('#gbbt').click(function() {
		$('#gbbt').css('background', '#b3b3b3');
		$('#hnbt').css('background', '#f8f8f8');
		$('#gjbt').css('background', '#f8f8f8');
		$('#jrbt').css('background', '#f8f8f8');
		$('#gb').css('display', 'table-row');
		$('#hn').css('display', 'none');
		$('#gj').css('display', 'none');
		$('#jr').css('display', 'none');
	});
	$('#hnbt').click(function() {
		$('#gbbt').css('background', '#f8f8f8');
		$('#hnbt').css('background', '#b3b3b3');
		$('#gjbt').css('background', '#f8f8f8');
		$('#jrbt').css('background', '#f8f8f8');
		$('#gb').css('display', 'none');
		$('#hn').css('display', 'table-row');
		$('#gj').css('display', 'none');
		$('#jr').css('display', 'none');
	});
	$('#gjbt').click(function() {
		$('#gbbt').css('background', '#f8f8f8');
		$('#hnbt').css('background', '#f8f8f8');
		$('#gjbt').css('background', '#b3b3b3');
		$('#jrbt').css('background', '#f8f8f8');
		$('#gb').css('display', 'none');
		$('#hn').css('display', 'none');
		$('#gj').css('display', 'table-row');
		$('#jr').css('display', 'none');
	});
	$('#jrbt').click(function() {
		$('#gbbt').css('background', '#f8f8f8');
		$('#hnbt').css('background', '#f8f8f8');
		$('#gjbt').css('background', '#f8f8f8');
		$('#jrbt').css('background', '#b3b3b3');
		$('#gb').css('display', 'none');
		$('#hn').css('display', 'none');
		$('#gj').css('display', 'none');
		$('#jr').css('display', 'table-row');
	});
	$('#sudobt').click(function() {
		$('#sudobt').css('background', '#b3b3b3');
		$('#ccbt').css('background', '#f8f8f8');
		$('#gwbt').css('background', '#f8f8f8');
		$('#gsbt').css('background', '#f8f8f8');
		$('#jrabt').css('background', '#f8f8f8');
		$('#sudo').css('display', 'table-row');
		$('#cc').css('display', 'none');
		$('#gw').css('display', 'none');
		$('#gs').css('display', 'none');
		$('#jra').css('display', 'none');
	});
	$('#ccbt').click(function() {
		$('#sudobt').css('background', '#f8f8f8');
		$('#ccbt').css('background', '#b3b3b3');
		$('#gwbt').css('background', '#f8f8f8');
		$('#gsbt').css('background', '#f8f8f8');
		$('#jrabt').css('background', '#f8f8f8');
		$('#sudo').css('display', 'none');
		$('#cc').css('display', 'table-row');
		$('#gw').css('display', 'none');
		$('#gs').css('display', 'none');
		$('#jra').css('display', 'none');
	});
	$('#gwbt').click(function() {
		$('#sudobt').css('background', '#f8f8f8');
		$('#ccbt').css('background', '#f8f8f8');
		$('#gwbt').css('background', '#b3b3b3');
		$('#gsbt').css('background', '#f8f8f8');
		$('#jrabt').css('background', '#f8f8f8');
		$('#sudo').css('display', 'none');
		$('#cc').css('display', 'none');
		$('#gw').css('display', 'table-row');
		$('#gs').css('display', 'none');
		$('#jra').css('display', 'none');
	});
	$('#gsbt').click(function() {
		$('#sudobt').css('background', '#f8f8f8');
		$('#ccbt').css('background', '#f8f8f8');
		$('#gwbt').css('background', '#f8f8f8');
		$('#gsbt').css('background', '#b3b3b3');
		$('#jrabt').css('background', '#f8f8f8');
		$('#sudo').css('display', 'none');
		$('#cc').css('display', 'none');
		$('#gw').css('display', 'none');
		$('#gs').css('display', 'table-row');
		$('#jra').css('display', 'none');
	});
	$('#jrabt').click(function() {
		$('#sudobt').css('background', '#f8f8f8');
		$('#ccbt').css('background', '#f8f8f8');
		$('#gwbt').css('background', '#f8f8f8');
		$('#gsbt').css('background', '#f8f8f8');
		$('#jrabt').css('background', '#b3b3b3');
		$('#sudo').css('display', 'none');
		$('#cc').css('display', 'none');
		$('#gw').css('display', 'none');
		$('#gs').css('display', 'none');
		$('#jra').css('display', 'table-row');
	});
	$('.tbg').click(function() {
		$('.tbg').css('display', 'none');
		$('.tbgw').css('display', 'none');
	});
	$('#startTrain').click(function() {
		$('.tbg').css('display', 'inline');
		$('.tbgw').css('display', 'inline');
	});
	$('#endTrain').click(function() {
		$('.tbg').css('display', 'inline');
		$('.tbgw').css('display', 'inline');
	});
	
	
	
	$("#inputStrat:text").keydown(function(e) {

		$.ajax({
			url : "startTrain",
			dataType : "json",
			type : "post",
			data : $('#inputStrat').serializeArray(),
			success : function(data) {
				alert("성공:" + data.KEY);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "error:" + error);
			}

		});

	});
});
