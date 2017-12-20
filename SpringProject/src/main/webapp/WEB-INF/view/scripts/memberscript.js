$(document).ready(function() {

					// 약관 모두 동의하기
					$('#check').change(function() {
						if ($("#check").is(":checked")) {
							$("input[name=ch]:checkbox").each(function() {
								$(this).attr("checked", true);
							});
						} else {
							$("input[name=ch]:checkbox").each(function() {
								$(this).attr("checked", false);
							});
						}
					});

					// 일반회원 약관이벤트
					$('.c-btn')
							.click(
									function() {
										if ($('.check1').is(':checked') == false) {
											alert("이용약관에 동의해주세요");
											return;
										} else if ($('.check2').is(':checked') == false) {
											alert("개인정보 수집에 동의해주세요");
											return;
										} else {
											$(location).attr('href','MemberShip?menu=Register');
										}

									});

					// 기업회원 약관이벤트
					$('.c-btn1')
							.click(
									function() {
										if ($('.check1').is(':checked') == false) {
											alert("이용약관에 동의해주세요");
											return;
										} else if ($('.check2').is(':checked') == false) {
											alert("개인정보 수집에 동의해주세요");
											return;
										} else {
											$(location)
													.attr('href',
															'CorpoRation?menu=Register');
										}

									});

					// 일반회원 아이디 중복검사
					$(".m_id").blur(function() {
						$.ajax({
													url : "idcheck",
													dataType : "json",
													type : "post",
													data : $('.m_id')
															.serializeArray(),
													success : function(data) {
														console.log(data);
														$('#idcheck').html(
																data.result);
														if ($('#idcheck')
																.text() == '중복되지 않은 아이디 입니다.') {
															$('#idcheck').css(
																	'display',
																	'inline');
															$('#idcheck').css(
																	'color',
																	'blue');
														} else {
															$('#idcheck').css(
																	'display',
																	'inline');
															$('#idcheck').css(
																	'color',
																	'red');
														}

														if ($('.m_id').val() == "") {
															$('#idcheck').css(
																	'display',
																	'none');
														}
													},
													error : function(request,
															status, error) {
														alert("code:"
																+ request.status
																+ "\n"
																+ "error:"
																+ error);
													}

												});
									});

					// 기업회원 아이디 중복검사
					$(".c_id")
							.blur(
									function() {

										$
												.ajax({
													url : "coridcheck",
													dataType : "json",
													type : "post",
													data : $('.c_id')
															.serializeArray(),
													success : function(data) {
														console.log(data);
														$('.idConfirm').html(
																data.result);
														if ($('.idConfirm')
																.text() == '중복되지 않은 아이디 입니다.') {
															$('.idConfirm')
																	.css(
																			'display',
																			'inline');
															$('.idConfirm')
																	.css(
																			'color',
																			'blue');
														} else {
															$('.idConfirm')
																	.css(
																			'display',
																			'inline');
															$('.idConfirm')
																	.css(
																			'color',
																			'red');
														}

														if ($('.c_id').val() == "") {
															$('.idConfirm')
																	.css(
																			'display',
																			'none');
														}
													},
													error : function(request,
															status, error) {
														alert("code:"
																+ request.status
																+ "\n"
																+ "error:"
																+ error);
													}

												});
									});

					// 일반회원 주소 추가
					$(".postConfirm")
							.on(
									"click",
									function() {
										new daum.Postcode(
												{
													oncomplete : function(data) {
														// 팝업에서 검색결과 항목을 클릭했을때
														// 실행할 코드를 작성하는 부분.

														// 각 주소의 노출 규칙에 따라 주소를
														// 조합한다.
														// 내려오는 변수가 값이 없는 경우엔
														// 공백('')값을 가지므로, 이를
														// 참고하여 분기 한다.
														var fullAddr = ''; // 최종
																			// 주소
																			// 변수
														var extraAddr = ''; // 조합형
																			// 주소
																			// 변수

														// 사용자가 선택한 주소 타입에 따라 해당
														// 주소 값을 가져온다.
														if (data.userSelectedType === 'R') { // 사용자가
																								// 도로명
																								// 주소를
															// 선택했을 경우
															fullAddr = data.roadAddress;

														} else { // 사용자가 지번
																	// 주소를 선택했을
																	// 경우(J)
															fullAddr = data.jibunAddress;
														}

														// 사용자가 선택한 주소가 도로명 타입일때
														// 조합한다.
														if (data.userSelectedType === 'R') {
															// 법정동명이 있을 경우 추가한다.
															if (data.bname !== '') {
																extraAddr += data.bname;
															}
															// 건물명이 있을 경우 추가한다.
															if (data.buildingName !== '') {
																extraAddr += (extraAddr !== '' ? ', '
																		+ data.buildingName
																		: data.buildingName);
															}
															// 조합형주소의 유무에 따라 양쪽에
															// 괄호를 추가하여 최종 주소를
															// 만든다.
															fullAddr += (extraAddr !== '' ? ' ('
																	+ extraAddr
																	+ ')'
																	: '');
														}

														// 우편번호와 주소 정보를 해당 필드에
														// 넣는다.
														document
																.getElementById('m_post1').value = data.zonecode; // 5자리
														// 새우편번호
														// 사용
														document
																.getElementById('m_post2').value = fullAddr;
														// 커서를 상세주소 필드로 이동한다.
														document
																.getElementById(
																		'm_post3')
																.focus();
													}
												}).open();
									});

					// 기업회원 주소추가
					$(".c_postConfirm")
							.on(
									"click",
									function() {
										new daum.Postcode(
												{
													oncomplete : function(data) {
														// 팝업에서 검색결과 항목을 클릭했을때
														// 실행할 코드를 작성하는 부분.

														// 각 주소의 노출 규칙에 따라 주소를
														// 조합한다.
														// 내려오는 변수가 값이 없는 경우엔
														// 공백('')값을 가지므로, 이를
														// 참고하여 분기 한다.
														var fullAddr = ''; // 최종
																			// 주소
																			// 변수
														var extraAddr = ''; // 조합형
																			// 주소
																			// 변수

														// 사용자가 선택한 주소 타입에 따라 해당
														// 주소 값을 가져온다.
														if (data.userSelectedType === 'R') { // 사용자가
																								// 도로명
																								// 주소를
															// 선택했을 경우
															fullAddr = data.roadAddress;

														} else { // 사용자가 지번
																	// 주소를 선택했을
																	// 경우(J)
															fullAddr = data.jibunAddress;
														}

														// 사용자가 선택한 주소가 도로명 타입일때
														// 조합한다.
														if (data.userSelectedType === 'R') {
															// 법정동명이 있을 경우 추가한다.
															if (data.bname !== '') {
																extraAddr += data.bname;
															}
															// 건물명이 있을 경우 추가한다.
															if (data.buildingName !== '') {
																extraAddr += (extraAddr !== '' ? ', '
																		+ data.buildingName
																		: data.buildingName);
															}
															// 조합형주소의 유무에 따라 양쪽에
															// 괄호를 추가하여 최종 주소를
															// 만든다.
															fullAddr += (extraAddr !== '' ? ' ('
																	+ extraAddr
																	+ ')'
																	: '');
														}

														// 우편번호와 주소 정보를 해당 필드에
														// 넣는다.
														document
																.getElementById('c_post1').value = data.zonecode; // 5자리
														// 새우편번호
														// 사용
														document
																.getElementById('c_post2').value = fullAddr;
														// 커서를 상세주소 필드로 이동한다.
														if (document.get

														!== "") {
															$('c_post2').attr(
																	'readonly',
																	false);
														}
														document
																.getElementById(
																		'c_post3')
																.focus();
													}
												}).open();
									});

					// 회원가입 이메일 자동입력
					$(".m_mail3").change(function() {
						if ($(".m_mail3").val() == "1") {
							$(".m_mail2").val(""); // 값 초기화
							$(".m_mail2").attr("readonly", false); // 활성화
						} else if ($('.m_mail3').val() == "") {
							$(".m_mail2").val(""); // 값 초기화
							$(".m_mail2").attr("readonly", true); // textBox
																	// 비활성화
						} else {
							$(".m_mail2").val($('.m_mail3').val()); // 선택값 입력
							$(".m_mail2").attr("readonly", true); // 비활성화
						}
					});

					$(".c_mail3").change(function() {
						if ($(".c_mail3").val() == "1") {
							$(".c_mail2").val(""); // 값 초기화
							$(".c_mail2").attr("readonly", false); // 활성화
						} else if ($(".c_mail3").val() == "") {
							$(".c_mail2").val(""); // 값 초기화
							$(".c_mail2").attr("readonly", true); // textBox
																	// 비활성화
						} else {
							$(".c_mail2").val($(".c_mail3").val()); // 선택값 입력
							$(".c_mail2").attr("readonly", true); // 비활성화
						}
					});

					// 일반회원 유효성 검사
					$('.m_confirm')
							.click(
									function() {
										var check = true;
										var m_id = $('.m_id').val(), reg = /^[A-Za-z0-9+]{4,16}$/;

										var m_pw = $('.m_pw').val(), reg2 = /^(?=.*[a-zA-Z])((?=.\d)|(?=.*\W)).{8,15}$/;

										var m_pwC = $('.m_pwC').val();
										var m_name = $('.m_name').val();
										var m_phone2 = $('.m_phone2').val();
										var m_phone3 = $('.m_phone3').val();
										var m_year = $('.m_year').val();
										var m_mail1 = $('.m_mail1').val();
										var m_mail2 = $('.m_mail2').val();
										var m_post1 = $('#m_post1').val();
										var m_post3 = $('#m_post3').val();

										// 아이디 유효성 체크
										if (m_id == '' | m_id == null) {
											alert("아이디를 입력해주세요");
										} else if (!reg.test(m_id)) {
											alert("아이디는 영문 및 숫자, 4자리 이상 16자리 이하여야 합니다.");
											$('.m_id').val('');
											$('.m_id').focus();
											$('')

										} else if ($('#idcheck').text() == '중복된 아이디 입니다.') {
											alert("중복된 아이디 입니다. 아이디를 확인 해주세요.");
											$('.m_id').val('');
											$('.m_id').focus();
											check = false;
										}

										// 비밀번호 유효성 검사

										else if (m_pw == '' | m_pw == null) {
											alert("비밀번호 입력해주세요");
											$('.m_pw').focus();
											check = false;
										} else if (!reg2.test(m_pw)) {
											alert("비밀번호는 8자리 이상 15자리 이하 문자, 숫자 혹은 특수문자를 반드시 포함해야 합니다.");
											$('.m_pw').val('');
											$('.m_pw').focus();
											check = false;
											// 비밀번호 확인 유효성 검사
										} else if (m_pw !== m_pwC) {
											alert("비밀번호가 같지 않습니다.");
											$('.m_pwC').val('');
											$('.m_pwC').focus();
											check = false;
											// 이름 유효성 검사
										} else if (m_name == ''
												| m_name == null) {
											alert("이름을 입력해주세요");
											$('.m_name').focus();
											check = false;
										} else if (m_phone2 == ''
												| m_phone2 == null
												| m_phone3 == ''
												| m_phone3 == null) {
											alert("전화번호를 입력해주세요");
											$('.m_phone2').focus();
											check = false;
										} else if (m_year == ''
												| m_year == null) {
											alert("생년월일을 입력해주세요");
											$('.m_year').focus();
											check = false;
										} else if (m_mail1 == ''
												| m_mail1 == null
												| m_mail2 == ''
												| m_mail2 == null) {
											alert("메일을 입력해주세요");
											$('.m_mail1').focus();
											check = false;
										} else if (m_post1 == ''
												| m_post1 == null) {
											alert("우편번호 및 주소를 입력해주세요");
											$('#m_post1').focus();
											check = false;
										} else if (m_post3 == ''
												| m_post3 == null) {
											alert("상세주소를 입력해주세요");
											$('#m_post3').focus();
											check = false;
										} else if (check = true) {

											var test1 = "";
											$('.m_phone4').val(
													$('.m_phone1').val()
															+ "-"
															+ $('.m_phone2')
																	.val()
															+ "-"
															+ $('.m_phone3')
																	.val());
											$('.m_mail4').val(
													$('.m_mail1').val()
															+ "@"
															+ $('.m_mail2')
																	.val());
											$('.postM4').val(
													$('.postM1').val()
															+ " "
															+ $('.postM2')
																	.val()
															+ " "
															+ $('.postM3')
																	.val());
											$('.m_interest').val(
													$('.m_inter').val());
											$(".m_inter").each(function() {
												test1 += $(this).val() + ",";
											});
											$('.m_interest').val(test1);
											$('#frm').submit();
										}
									});

					// 기업회원 유효성 검사
					$('.c_confirm')
							.click(
									function() {

										var corche = true;

										var c_id = $('.c_id').val(), reg = /^[A-Za-z0-9+]{4,16}$/;
										var c_pw = $('.c_pw').val(), reg2 = /^(?=.*[a-zA-Z])((?=.\d)|(?=.*\W)).{8,15}$/;
										var c_pwC = $('.c_pwC').val();
										var c_name = $('.c_name').val();
										var c_num = $('.c_num').val();
										var c_num1 = $('.c_num1').val();
										var c_num2 = $('.c_num2').val();
										var c_phone2 = $('.c_phone2').val();
										var c_phone3 = $('.c_phone3').val();
										var c_mail1 = $('.c_mail1').val();
										var c_mail2 = $('.c_mail2').val();
										var c_post1 = $('#c_post1').val();
										var c_post3 = $('#c_post3').val();

										// 아이디 유효성 체크
										if (c_id == '' | c_id == null) {
											alert("아이디를 입력해주세요");
											corche = false;
										} else if (!reg.test(c_id)) {
											alert("아이디는 영문 및 숫자, 4자리 이상 16자리 이하여야 합니다.");
											$('.c_id').val('');
											$('.c_id').focus();
											corche = false;

										} else if ($('.idConfirm').text() == '중복된 아이디 입니다.') {
											alert("중복된 아이디 입니다. 아이디를 확인 해주세요");
											$('.c_id').val('');
											$('.c_id').focus();
											check = false;

											// 비밀번호 유효성 검사
										} else if (c_pw == '' | c_pw == null) {
											alert("비밀번호 입력해주세요");
											$('.c_pw').focus();
											corche = false;
										} else if (!reg2.test(c_pw)) {
											alert("비밀번호는 8자리 이상 15자리 이하 문자, 숫자 혹은 특수문자를 반드시 포함해야 합니다.");
											$('.c_pw').val('');
											$('.c_pw').focus();
											corche = false;
											// 비밀번호 확인 유효성 검사
										} else if (c_pw !== c_pwC) {
											alert("비밀번호가 같지 않습니다.");
											$('.c_pwC').val('');
											$('.c_pwC').focus();
											corche = false;
											// 이름 유효성 검사
										} else if (c_name == ''
												| c_name == null) {
											alert("대표자명을 입력해주세요");
											$('.c_name').focus();
											corche = false;
										} else if (c_phone2 == ''
												| c_phone2 == null
												| c_phone3 == ''
												| c_phone3 == null) {
											alert("전화번호를 입력해주세요");
											$('.c_phone2').focus();
											corche = false;
										} else if (c_mail1 == ''
												| c_mail1 == null
												| c_mail2 == ''
												| c_mail2 == null) {
											alert("메일을 입력해주세요");
											$('.c_mail1').focus();
											corche = false;
										} else if (c_post1 == ''
												| c_post1 == null) {
											alert("우편번호 및 주소를 입력해주세요");
											$('#c_post1').focus();
											corche = false;
										} else if (c_post3 == ''
												| c_post3 == null) {
											alert("상세주소를 입력해주세요");
											$('#c_post3').focus();
											corche = false;
										} else if (corche == true) {

											$('.c_num3').val(
													$('.c_num').val()
															+ "-"
															+ $('.c_num1')
																	.val()
															+ "-"
															+ $('.c_num2')
																	.val());
											$('.c_phone4').val(
													$('.c_phone').val()
															+ "-"
															+ $('.c_phone2')
																	.val()
															+ "-"
															+ $('.c_phone3')
																	.val());
											$('.c_mail3').val(
													$('.c_mail1').val()
															+ "@"
															+ $('.c_mail2')
																	.val());
											$('.c_post4').val(
													$('#c_post1').val()
															+ " "
															+ $('#c_post2')
																	.val()
															+ " "
															+ $('#c_post3')
																	.val());
											$('#c_frm').submit();
										}
									});

					$('.c_num')
							.keypress(
									function(event) {
										if (event.which
												&& (event.which <= 47 || event.which >= 58)
												&& event.which != 8) {
											event.preventDefault();
											alert("숫자만 입력가능합니다.")
										}
									});
					$('.c_num1')
							.keypress(
									function(event) {
										if (event.which
												&& (event.which <= 47 || event.which >= 58)
												&& event.which != 8) {
											event.preventDefault();
											alert("숫자만 입력가능합니다.")
										}
									});
					$('.c_num2')
							.keypress(
									function(event) {
										if (event.which
												&& (event.which <= 47 || event.which >= 58)
												&& event.which != 8) {
											event.preventDefault();
											alert("숫자만 입력가능합니다.")
										}
									});
					$('.c_phone2')
							.keypress(
									function(event) {
										if (event.which
												&& (event.which <= 47 || event.which >= 58)
												&& event.which != 8) {
											event.preventDefault();
											alert("숫자만 입력가능합니다.")
										}
									});
					$('.c_phone3')
							.keypress(
									function(event) {
										if (event.which
												&& (event.which <= 47 || event.which >= 58)
												&& event.which != 8) {
											event.preventDefault();
											alert("숫자만 입력가능합니다.")
										}
									});
					$('.m_phone2')
							.keypress(
									function(event) {
										if (event.which
												&& (event.which <= 47 || event.which >= 58)
												&& event.which != 8) {
											event.preventDefault();
											alert("숫자만 입력가능합니다.")
										}
									});
					$('.m_phone3')
							.keypress(
									function(event) {
										if (event.which
												&& (event.which <= 47 || event.which >= 58)
												&& event.which != 8) {
											event.preventDefault();
											alert("숫자만 입력가능합니다.")
										}
									});
					$('#m_post1')
							.keypress(
									function(event) {
										if (event.which
												&& (event.which <= 47 || event.which >= 58)
												&& event.which != 8) {
											event.preventDefault();
											alert("숫자만 입력가능합니다.")
										}
									});

					$('.p_btn').click(function() {
						location.replace('myPage.jsp');
					});

					$('.mc_id').attr('readonly', 'true').attr('disabled',
							'false');
					$('.mc_name').attr('readonly', 'true').attr('disabled',
							'false');
					$('.mc_year').attr('readonly', 'true').attr('disabled',
							'false');
					$('.cc_id').attr('readonly', 'true').attr('disabled',
							'false');
					$('.cc_num').attr('readonly', 'true').attr('disabled',
							'false');
					$('.cc_num1').attr('readonly', 'true').attr('disabled',
							'false');
					$('.cc_num2').attr('readonly', 'true').attr('disabled',
							'false');

					// 관심사 최대수 제한하기
					$(".m_inter:checkbox")
							.change(
									function() {// 체크박스들이 변경됬을때
										var cnt = 6;
										if (cnt == $(".m_inter:checkbox:checked").length) {
											$(":checkbox:not(:checked)").attr(
													"disabled", "disabled");
										} else {
											$(".m_inter:checkbox").removeAttr(
													"disabled");
										}
									});
					
					
					var tst = true;
					$('.corCheck').on("change", function() {
						console.log("dd");
						if (tst) {
							tst = false;
							$('#memFrm').css("display", "none");
							$('#corFrm').css("display", "inline");
							$('.corCheck').prop("checked", true);
						} else {
							tst = true;
							$('#memFrm').css("display", "inline");
							$('#corFrm').css("display", "none");
							$('.corCheck').prop("checked", false);
						}
					});
					
					
					//1:1문의 테이블 마우스on
					$( ".noticeTable tr" ).on( "mouseover", function() {
						 $( this ).css( "background-color", "#f4f4f4" );
						 $( this).children("td").css( "cursor", "pointer" );
						  });
					$( ".noticeTable tr" ).on( "mouseleave", function() {
						 $( this ).css( "background-color", "white" );
						  }); 

					//일반회원 id 찾기
					$('.mem_sea').click(function(){
				
						var memEmail = $('.email3').val($('.email1').val()+"@"+$('.email2').val());
				
	
						alert('5초뒤 메일이 보내집니다');
						$.ajax({
							url : "IdFind",
							dataType : "json",
							type : "post",
							data : $('#frm1').serialize(),
							
							success : function(data) {
								console.log(data);
								if(data.sc1 !=null){
									alert(data.sc1);
								} else if(data.sc2 !=null){
									alert(data.sc2);
								} else{
									alert(data.sc0);
								}
							},
							error : function(request,status, error) {
								alert("code:"+ request.status+ "\n"+ "error:"+ error);
							}

						});
						});
					
					//일반회원 비밀번호 찾기
					$('.mem_sea1').click(function(){

						var pwEmail3 = $('.pwEmail3').val($('.pwEmail1').val()+"@"+$('.pwEmail2').val());

						alert('5초뒤 메일이 보내집니다');
						$.ajax({
							url : "PwFind",
							dataType : "json",
							type : "post",
							data : $('#pwfrm').serialize(),
							
							success : function(data) {
								console.log(data);
								if(data.sc1 !=null){
									alert(data.sc1);
								} else if(data.sc2 !=null){
									alert(data.sc2);
								} else{
									alert(data.sc0);
								}
							},
							error : function(request,status, error) {
								alert("code:"+ request.status+ "\n"+ "error:"+ error);
							}

						});
						});

					//기업회원 아이디 찾기
					$('.cor_sea').click(function(){
						
						var corEmail = $('.c_email3').val($('.c_email1').val()+"@"+$('.c_email2').val());
						alert('5초뒤 메일이 보내집니다');
						$.ajax({
							url : "corIdFind",
							dataType : "json",
							type : "post",
							data : $('#frm2').serialize(),
							
							success : function(data) {
								console.log(data);
								if(data.sc1 !=null){
									alert(data.sc1);
								} else if(data.sc2 !=null){
									alert(data.sc2);
								} else{
									alert(data.sc0);
								}
							},
							error : function(request,status, error) {
								alert("code:"+ request.status+ "\n"+ "error:"+ error);
							}

						});
						});
					
					
					
					//마이페이지 이동
					$('.mypage').on("click",function(){
						$(location).attr('href','myPageCon?menu=MyPage');
					});
					
					
					
});
