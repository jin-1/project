function captureReturnKey(e) {
	if (e.keyCode == 13 && e.srcElement.type != 'textarea')
		return false;
}
$(function() {

	function onClickHandler(date, obj) {
		var calendar = obj.calendar;

		var text = '';

		if (date[0] !== null) {
			var now = new Date();
			var select = new Date(date[0]);
			console.log(select);
			if (now.getTime() < select.getTime()) {
				text += date[0].format('YYYY-MM-DD');
				$('#stDate').text(text);
				$('#inputDate').val(text);
				$('.tbg').css("display", "none");
				$('.tbgw').css("display", "none");
			} else {

				alert("오늘보다 이전날을 고를 수 없습니다.");
			}

		}

		if (date[0] !== null && date[1] !== null) {
			text += ' ~ ';
		} else if (date[0] === null && date[1] == null) {
			text += 'nothing';
		}

		if (date[1] !== null) {
			text += date[1].format('YYYY-MM-DD');
		}

	}

	// Default Calendar
	$('.calendar').pignoseCalendar({
		select : onClickHandler
	});

});
$(document)
		.ready(
				function() {
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
						$('.tbgB').css('display', 'none');
						$('.tbgC').css('display', 'none');
						$('.tbgChange').css('display', 'none');
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
					$('#trainList1 li').mouseenter(function() {
						$(this).css("background-color", "#EEF1F6");
					});
					$('#trainList1 li').mouseleave(function() {
						$(this).css("background-color", "#ffffff");
					});

					$('.trainSearch').click(
							function() {
								if (Number($('#adultsVal').val()) != 0
										|| Number($('#childVal').val()) != 0
										|| Number($('#oldVal').val()) != 0) {
									$('#frmTicket').submit();
								} else {
									alert("인원이 한명 이상이여야 합니다.");
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
									$("#stStation")
											.html($('#inputStrat').val());
									$('#inputStrat').blur();
								}
							});

					$("#trainList1 ul").on("click", "li", function() {

						$("#stStation").html($(this).text());
						$("#inputStrat").val($(this).text());
						$("#trainList1").css("display", "none");

					});
					var a;
					var b;

					$('#trainList1').on('mouseenter', function() {
						a = true;
					});
					$('#trainList1').on('mouseleave', function() {
						a = false;
					});

					$('#inputStrat').on('focusout', function() {
						if (!a) {
							$("#trainList1").css("display", "none");
							$("#stStation").html($('#inputStrat').val());
						}

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
						$("#inputEnd").val($(this).text());
						$("#trainList2").css("display", "none");

					});
					$('#trainList2').on('mouseenter', function() {
						b = true;
					});
					$('#trainList2').on('mouseleave', function() {
						b = false;
					});
					$('#inputEnd').on('focusout', function() {
						if (!b) {
							$("#trainList2").css("display", "none");
							$("#edStation").html($('#inputEnd').val());
						}

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
									$("#trainList3 li:contains('가')").css(
											"display", "inline-block");
								} else if (c == "나") {
									$("#trainList3 li").hide();
									$("#trainList3 li:contains('나')").css(
											"display", "inline-block");
								} else if (c == "다") {
									$("#trainList3 li").hide();
									$("#trainList3 li:contains('다')").css(
											"display", "inline-block");
								} else if (c == "라") {
									$("#trainList3 li").hide();
									$("#trainList3 li:contains('라')").css(
											"display", "inline-block");
								} else if (c == "마") {
									$("#trainList3 li").hide();
									$("#trainList3 li:contains('마')").css(
											"display", "inline-block");
								} else if (c == "바") {
									$("#trainList3 li").hide();
									$("#trainList3 li:contains('바')").css(
											"display", "inline-block");
								} else if (c == "사") {
									$("#trainList3 li").hide();
									$("#trainList3 li:contains('사')").css(
											"display", "inline-block");
								} else if (c == "아") {
									$("#trainList3 li").hide();
									$("#trainList3 li:contains('아')").css(
											"display", "inline-block");
								} else if (c == "자") {
									$("#trainList3 li").hide();
									$("#trainList3 li:contains('자')").css(
											"display", "inline-block");
								} else if (c == "차") {
									$("#trainList3 li").hide();
									$("#trainList3 li:contains('차')").css(
											"display", "inline-block");
								} else if (c == "카") {
									$("#trainList3 li").hide();
									$("#trainList3 li:contains('카')").css(
											"display", "inline-block");
								} else if (c == "타") {
									$("#trainList3 li").hide();
									$("#trainList3 li:contains('타')").css(
											"display", "inline-block");
								} else if (c == "파") {
									$("#trainList3 li").hide();
									$("#trainList3 li:contains('파')").css(
											"display", "inline-block");
								} else if (c == "하") {
									$("#trainList3 li").hide();
									$("#trainList3 li:contains('하')").css(
											"display", "inline-block");
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
									$("#trainList4 li:contains('가')").css(
											"display", "inline-block");
								} else if (c == "나") {
									$("#trainList4 li").hide();
									$("#trainList4 li:contains('나')").css(
											"display", "inline-block");
								} else if (c == "다") {
									$("#trainList4 li").hide();
									$("#trainList4 li:contains('다')").css(
											"display", "inline-block");
								} else if (c == "라") {
									$("#trainList4 li").hide();
									$("#trainList4 li:contains('라')").css(
											"display", "inline-block");
								} else if (c == "마") {
									$("#trainList4 li").hide();
									$("#trainList4 li:contains('마')").css(
											"display", "inline-block");
								} else if (c == "바") {
									$("#trainList4 li").hide();
									$("#trainList4 li:contains('바')").css(
											"display", "inline-block");
								} else if (c == "사") {
									$("#trainList4 li").hide();
									$("#trainList4 li:contains('사')").css(
											"display", "inline-block");
								} else if (c == "아") {
									$("#trainList4 li").hide();
									$("#trainList4 li:contains('아')").css(
											"display", "inline-block");
								} else if (c == "자") {
									$("#trainList4 li").hide();
									$("#trainList4 li:contains('자')").css(
											"display", "inline-block");
								} else if (c == "차") {
									$("#trainList4 li").hide();
									$("#trainList4 li:contains('차')").css(
											"display", "inline-block");
								} else if (c == "카") {
									$("#trainList4 li").hide();
									$("#trainList4 li:contains('카')").css(
											"display", "inline-block");
								} else if (c == "타") {
									$("#trainList4 li").hide();
									$("#trainList4 li:contains('타')").css(
											"display", "inline-block");
								} else if (c == "파") {
									$("#trainList4 li").hide();
									$("#trainList4 li:contains('파')").css(
											"display", "inline-block");
								} else if (c == "하") {
									$("#trainList4 li").hide();
									$("#trainList4 li:contains('하')").css(
											"display", "inline-block");
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
					$('.pm')
							.on(
									"click",
									function() {
										var id = $(this).attr('id');
										var total = Number($('#adultsVal')
												.val())
												+ Number($('#childVal').val())
												+ Number($('#oldVal').val());
										if (total > 8) {
											alert("9명 이상 신청할 수 없습니다.");
										} else {
											if (id == "adultsMin") {
												if ($('#adultsVal').val() > 0) {
													$('#adultsVal')
															.val(
																	($(
																			'#adultsVal')
																			.val() - 1));
												} else {
													alert("0보다 작습니다");
												}
											} else if (id == "adultsAdd") {
												$('#adultsVal').val(
														Number($('#adultsVal')
																.val()) + 1);
											}

											else if (id == 'childMin') {
												if ($('#childVal').val() > 0) {
													$('#childVal').val(
															$('#childVal')
																	.val() - 1);
												} else {
													alert("0보다 작습니다");
												}

											} else if (id == 'childAdd') {

												$('#childVal').val(
														Number($('#childVal')
																.val()) + 1);

											}

											else if (id == 'oldMin') {
												if ($('#oldVal').val() > 0) {
													$('#oldVal')
															.val(
																	$('#oldVal')
																			.val() - 1);
												} else {
													alert("0보다 작습니다");
												}

											} else if (id == 'oldAdd') {

												$('#oldVal').val(
														Number($('#oldVal')
																.val()) + 1);

											}
										}
									});

					$('.inquire').mouseenter(function() {
						var y = $(this).offset().top;
						var price = $(this).attr("name");
						$('#adult_pay').text(price);
						$('#old_pay').text(price * 0.7);
						$('#child_pay').text(price * 0.5);
						$('.tbgt').css("top", y);
						$('.tbgt').css("display", "inline");

					});
					$('.inquire').mouseleave(function() {

						$('.tbgt').css("display", "none");
					});
					$('.ticketing').on("click", function() {
						$(this).parent().submit();
					});
					$('#screenFirst').removeClass('screenOn').addClass(
							'screenOn');
					$('.screenOff').on(
							"click",
							function() {
								$('.screenOn').removeClass('screenOn')
										.addClass('screenOff');
								$(this).attr("class", "screenOn");
								if ($(this).text() == "1호차") {
									$('#seatTable0').css("display", "inline");
									$('#seatTable1').css("display", "none");
									$('#seatTable2').css("display", "none");
									$('#seatTable3').css("display", "none");
									$('#seatTable4').css("display", "none");
									$('#seatTable5').css("display", "none");
									$('#seatTable6').css("display", "none");

								} else if ($(this).text() == "2호차") {
									$('#seatTable0').css("display", "none");
									$('#seatTable1').css("display", "inline");
									$('#seatTable2').css("display", "none");
									$('#seatTable3').css("display", "none");
									$('#seatTable4').css("display", "none");
									$('#seatTable5').css("display", "none");
									$('#seatTable6').css("display", "none");
								} else if ($(this).text() == "3호차") {
									$('#seatTable0').css("display", "none");
									$('#seatTable1').css("display", "none");
									$('#seatTable2').css("display", "inline");
									$('#seatTable3').css("display", "none");
									$('#seatTable4').css("display", "none");
									$('#seatTable5').css("display", "none");
									$('#seatTable6').css("display", "none");
								} else if ($(this).text() == "4호차") {
									$('#seatTable0').css("display", "none");
									$('#seatTable1').css("display", "none");
									$('#seatTable2').css("display", "none");
									$('#seatTable3').css("display", "inline");
									$('#seatTable4').css("display", "none");
									$('#seatTable5').css("display", "none");
									$('#seatTable6').css("display", "none");
								} else if ($(this).text() == "5호차") {
									$('#seatTable0').css("display", "none");
									$('#seatTable1').css("display", "none");
									$('#seatTable2').css("display", "none");
									$('#seatTable3').css("display", "none");
									$('#seatTable4').css("display", "inline");
									$('#seatTable5').css("display", "none");
									$('#seatTable6').css("display", "none");
								} else if ($(this).text() == "6호차") {
									$('#seatTable0').css("display", "none");
									$('#seatTable1').css("display", "none");
									$('#seatTable2').css("display", "none");
									$('#seatTable3').css("display", "none");
									$('#seatTable4').css("display", "none");
									$('#seatTable5').css("display", "inline");
									$('#seatTable6').css("display", "none");
								} else if ($(this).text() == "7호차") {
									$('#seatTable0').css("display", "none");
									$('#seatTable1').css("display", "none");
									$('#seatTable2').css("display", "none");
									$('#seatTable3').css("display", "none");
									$('#seatTable4').css("display", "none");
									$('#seatTable5').css("display", "none");
									$('#seatTable6').css("display", "inline");
								}
							});
					$('#reservationBt').on("click", function() {
						if (list == "") {
							alert("좌석을 선택해주세요.");
						} else {
							$('#seatNum').val(list);
							$('#seatprice').val($('#allCount').val());
							$(this).parent().submit();
						}
					});

					$('#paymentBt').on("click", function() {
						$('#frmTicket').submit();
					});

					$('.ticketingBt')
							.on(
									"click",
									function() {
										$('.tbg').css("display", "inline");
										$('.tbgB').css("display", "inline");
										var index = $('.ticketingBt').index(this);

										$.ajax({
													url : "selectTicketing",
													dataType : "json",
													type : "post",
													data : {
														"TrainRegCode" : $(this).attr("name"),
														"DepartingStation" : $('#d' + index).text(),
														"ArrivalStation" : $('#a' + index).text()
													},
													success : function(data) {
														$('#ticketSeat')
																.empty();
														var temp1 = 0;
														var temp2 = 1;
														var t = data.train1.trainStationTimeDTO.time
																.split(",");
														var s = data.train1.seatNum
																.split("_");
														console
																.log(s.length / 2);
														$('#ticketDate')
																.text(
																		data.train1.trainPurchaseDTO.trainPubDate);
														$('#ticketD')
																.text(
																		data.train1.departingStation);
														$('#ticketA')
																.text(
																		data.train1.arrivalStation);
														$('#ticketT1').text(
																t[0]);
														$('#ticketT2').text(
																t[1]);
														$('#ticketTn')
																.text(
																		data.train1.trainName);
														$('#ticketCode')
																.text(
																		data.train1.trainCode
																				+ " 열차");
														for (var i = 0; i < parseInt(s.length / 2); i++) {
															$('#ticketSeat')
																	.append(
																			'<li>'
																					+ Number(s[temp1] + 1)
																					+ '호차'
																					+ s[temp2]
																					+ '석</li>');
															temp1 += 2;
															temp2 += 2;
														}
														$('#ticketInvoice')
																.text(
																		"운임요금 : "
																				+ data.train1.trainPurchaseDTO.invoice);
													},
													error : function(request,
															status, error) {
														console
																.log("code:"
																		+ request.status
																		+ "\n"
																		+ "error:"
																		+ error);
													}

												});
									});
					$('.ticketingCBt').on("click", function() {
						$('.tbg').css("display", "inline");
						$('.tbgC').css("display", "inline");
						$('#TicketCodevalue').val($(this).attr("name"));
					});
					$('#trainRefundC').on("click", function() {

						$('.tbg').css("display", "none");
						$('.tbgC').css("display", "none");

					});
					$('#trainRefund').on("click", function() {
						$('#trainHfrm').submit();
					});
					$('.ticketingChangeBt').on("click",
							function() {
								var index = $('.ticketingChangeBt').index(this);

								$.ajax({
									url : "selectTicketing1",
									dataType : "json",
									type : "post",
									data : {
										"TrainRegCode" : $(this).attr("name"),
										"DepartingStation" : $('#d' + index)
												.text(),
										"ArrivalStation" : $('#a' + index)
												.text()
									},
									success : function(data) {
										console.log(data);
										$(location).attr('href', 'TicketReservationChangeView');
									},
									error : function(request, status, error) {
										console.log("code:" + request.status
												+ "\n" + "error:" + error);
									}

								});
					});
					$('#seatChangeBt').on("click",function(){
						$('#seatChange').val(list);
						$('#seatChangeForm').submit();
					});
					
					$('#usSerch').on("click",function(){
						
						$.ajax({
							url : "useSearch",
							dataType : "json",
							type : "post",
							data : {
								"date1" : $('#useDate1').val(),
								"date2" :$('#useDate2').val()
								
							},
							success : function(data) {
								console.log(data);
							
								$.each(data, function(key, value) {
									var d = new Date(value.trainPurchaseDTO.trainPubDate);
									var day = d.getDate();
									var monthIndex = d.getMonth()+1;
									var s="";
									if(value.trainPurchaseDTO.trainRefund !=1){
										s = '발권';
									} else{
										s = '환불';
									}
									var year = d.getFullYear();
									$('#useTr').append('<tr><td>' +year+'-'+monthIndex+'-'+day+ '</td><td>' + value.trainCode + '</td><td>' + value.departingStation +'</td><td>' + value.arrivalStation + '</td><td>' + value.trainPurchaseDTO.invoice + '</td><td>' + s+ '</td></tr>');

								});
								
								
							},
							error : function(request, status, error) {
								console.log("code:" + request.status
										+ "\n" + "error:" + error);
							}

						});
					});

				});