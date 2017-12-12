$(document).ready(
		function() {

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
				$('.stbg').css('display', 'none');
				$('.edbg').css('display', 'none');
				$('.datebg').css('display', 'none');
			});
			$('#startTrain').click(function() {
				$('.tbg').css('display', 'inline');
				$('.tbgw').css('display', 'inline');
				$('.stbg').css('display', 'inline');
				$('.edbg').css('display', 'none');
				$('.datebg').css('display', 'none');
			});
			$('#endTrain').click(function() {
				$('.tbg').css('display', 'inline');
				$('.tbgw').css('display', 'inline');
				$('.stbg').css('display', 'none');
				$('.edbg').css('display', 'inline');
				$('.datebg').css('display', 'none');
			});
			$('#dateTrain').click(function() {
				$('.tbg').css('display', 'inline');
				$('.tbgw').css('display', 'inline');
				$('.stbg').css('display', 'none');
				$('.edbg').css('display', 'none');
				$('.datebg').css('display', 'inline');

			});

			$.ajax({
				url : "startTrain",
				dataType : "json",
				type : "post",
				data : $('#inputStrat').serializeArray(),
				success : function(data) {

					var trainLength = Object.keys(data).length;

					$.each(data, function(key, value) {
						$('.trainList ul').append('<li>' + value + '</li>');

					});

				},
				error : function(request, status, error) {
					console.log("code:" + request.status + "\n" + "error:"
							+ error);
				}

			});

			$("#inputStrat:text").keyup(
					function(e) {
						var code = e.which;
						$("#trainList1").css("display", "block");
						var k = $(this).val();

						$("#trainList1 li").hide();
						$("#trainList1 li:contains('" + k + "')").css(
								"display", "block");
						if (code == 13) {
							$("#trainList1").css("display", "none");
							$("#stStation").html($('#inputStrat').val());
							$('#inputStrat').blur();
						}
					});

			$("#trainList1 ul").on("click", "li", function() {
				$("#stStation").html($(this).text());
				$("#trainList1").css("display", "none");
			});
			$('#trainList1').blur(function() {
				$("#trainList1").css("display", "none");
				$("#stStation").html($('#inputStrat').val());

			});

			$("#inputEnd:text").keyup(
					function(e) {
						var code = e.which;
						$("#trainList2").css("display", "block");
						var k = $(this).val();

						$("#trainList2 li").hide();
						$("#trainList2 li:contains('" + k + "')").css(
								"display", "block");
						if (code == 13) {
							$("#trainList2").css("display", "none");
							$("#edStation").html($('#inputEnd').val());
							$('#inputEnd').blur();
						}
					});

			$("#trainList2 ul").on("click", "li", function() {
				$("#edStation").html($(this).text());
				$("#trainList2").css("display", "none");
			});
			$('#trainList2').blur(function() {
				$("#trainList2").css("display", "none");
				$("#edStation").html($('#inputEnd').val());

			});
			$('.stbg_1 ul').on(
					"click",
					"li",
					function() {
						var c = $(this).text();
						if (c == "전체") {
							$("#trainList3 li").show();

						} else if (c == "가") {
							$("#trainList3 li").hide();
							$("#trainList3 li:contains('가')").css("display",
									"inline-block");
						} else if (c == "나") {
							$("#trainList3 li").hide();
							$("#trainList3 li:contains('나')").css("display",
									"inline-block");
						} else if (c == "다") {
							$("#trainList3 li").hide();
							$("#trainList3 li:contains('다')").css("display",
									"inline-block");
						} else if (c == "라") {
							$("#trainList3 li").hide();
							$("#trainList3 li:contains('라')").css("display",
									"inline-block");
						} else if (c == "마") {
							$("#trainList3 li").hide();
							$("#trainList3 li:contains('마')").css("display",
									"inline-block");
						} else if (c == "바") {
							$("#trainList3 li").hide();
							$("#trainList3 li:contains('바')").css("display",
									"inline-block");
						} else if (c == "사") {
							$("#trainList3 li").hide();
							$("#trainList3 li:contains('사')").css("display",
									"inline-block");
						} else if (c == "아") {
							$("#trainList3 li").hide();
							$("#trainList3 li:contains('아')").css("display",
									"inline-block");
						} else if (c == "자") {
							$("#trainList3 li").hide();
							$("#trainList3 li:contains('자')").css("display",
									"inline-block");
						} else if (c == "차") {
							$("#trainList3 li").hide();
							$("#trainList3 li:contains('차')").css("display",
									"inline-block");
						} else if (c == "카") {
							$("#trainList3 li").hide();
							$("#trainList3 li:contains('카')").css("display",
									"inline-block");
						} else if (c == "타") {
							$("#trainList3 li").hide();
							$("#trainList3 li:contains('타')").css("display",
									"inline-block");
						} else if (c == "파") {
							$("#trainList3 li").hide();
							$("#trainList3 li:contains('파')").css("display",
									"inline-block");
						} else if (c == "하") {
							$("#trainList3 li").hide();
							$("#trainList3 li:contains('하')").css("display",
									"inline-block");
						}
					});
			$('.stbg_1 ul').on(
					"click",
					"li",
					function() {
						var c = $(this).text();
						if (c == "전체") {
							$("#trainList4 li").show();

						} else if (c == "가") {
							$("#trainList4 li").hide();
							$("#trainList4 li:contains('가')").css("display",
									"inline-block");
						} else if (c == "나") {
							$("#trainList4 li").hide();
							$("#trainList4 li:contains('나')").css("display",
									"inline-block");
						} else if (c == "다") {
							$("#trainList4 li").hide();
							$("#trainList4 li:contains('다')").css("display",
									"inline-block");
						} else if (c == "라") {
							$("#trainList4 li").hide();
							$("#trainList4 li:contains('라')").css("display",
									"inline-block");
						} else if (c == "마") {
							$("#trainList4 li").hide();
							$("#trainList4 li:contains('마')").css("display",
									"inline-block");
						} else if (c == "바") {
							$("#trainList4 li").hide();
							$("#trainList4 li:contains('바')").css("display",
									"inline-block");
						} else if (c == "사") {
							$("#trainList4 li").hide();
							$("#trainList4 li:contains('사')").css("display",
									"inline-block");
						} else if (c == "아") {
							$("#trainList4 li").hide();
							$("#trainList4 li:contains('아')").css("display",
									"inline-block");
						} else if (c == "자") {
							$("#trainList4 li").hide();
							$("#trainList4 li:contains('자')").css("display",
									"inline-block");
						} else if (c == "차") {
							$("#trainList4 li").hide();
							$("#trainList4 li:contains('차')").css("display",
									"inline-block");
						} else if (c == "카") {
							$("#trainList4 li").hide();
							$("#trainList4 li:contains('카')").css("display",
									"inline-block");
						} else if (c == "타") {
							$("#trainList4 li").hide();
							$("#trainList4 li:contains('타')").css("display",
									"inline-block");
						} else if (c == "파") {
							$("#trainList4 li").hide();
							$("#trainList4 li:contains('파')").css("display",
									"inline-block");
						} else if (c == "하") {
							$("#trainList4 li").hide();
							$("#trainList4 li:contains('하')").css("display",
									"inline-block");
						}
					});

			$('#trainList3 ul').on("click", "li", function() {
				var c = $(this).text();
				$('#inputStrat').val(c);
				$('#stStation').text(c);
				$('.tbg').css("display", "none");
				$('.tbgw').css("display", "none");

			});

			$('#trainList4 ul').on("click", "li", function() {
				var c = $(this).text();
				$('#inputEnd').val(c);
				$('#edStation').text(c);
				$('.tbg').css("display", "none");
				$('.tbgw').css("display", "none");
			});

			$('#allCheck').on("change", function() {
				if ($('#allCheck').is(":checked")) {
					$('#KTXcheck').prop('checked', true);
					$('#smcheck').prop('checked', true);
					$('#mgcheck').prop('checked', true);

				} else {
					$('#KTXcheck').prop('checked', false);
					$('#smcheck').prop('checked', false);
					$('#mgcheck').prop('checked', false);
				}
			});
			$('.pm').on("click",function() {
						var id = $(this).attr('id');
						var total = Number($('#adultsVal').val())+ Number($('#childVal').val())	+ Number($('#oldVal').val());
						if (total > 8) {
							alert("9명 이상 신청할 수 없습니다.");
						} else {
							if (id == "adultsMin") {
								if ($('#adultsVal').val() > 0) {
									$('#adultsVal').val(
											($('#adultsVal').val() - 1));
								} else {
									alert("0보다 작습니다");
								}
							} else if (id == "adultsAdd") {
								$('#adultsVal').val(
										Number($('#adultsVal').val()) + 1);
							}

							else if (id == 'childMin') {
								if ($('#childVal').val() > 0) {
									$('#childVal')
											.val($('#childVal').val() - 1);
								} else {
									alert("0보다 작습니다");
								}

							} else if (id == 'childAdd') {

								$('#childVal').val(
										Number($('#childVal').val()) + 1);

							}

							else if (id == 'oldMin') {
								if ($('#oldVal').val() > 0) {
									$('#oldVal').val($('#oldVal').val() - 1);
								} else {
									alert("0보다 작습니다");
								}

							} else if (id == 'oldAdd') {

								$('#oldVal')
										.val(Number($('#oldVal').val()) + 1);

							}
						}
					});
		});
