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
	// setInterval("ozit_interval_test()", 5000); // 매 5000ms(5초)가 지날
	// 때마다
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

});
