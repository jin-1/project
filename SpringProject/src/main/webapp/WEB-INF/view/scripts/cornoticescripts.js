$(document).ready(function() {
	
	$('.filebox .upload-hidden').on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser 
			var filename = $(this)[0].files[0].name; 
		}else { //old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
			console.log(filename);
		} // 추출한 파일명 삽입 
		
		$(this).siblings('.file').val(filename); 
		});
	
	var imgTarget = $('.preview-image .upload-hidden'); 
	imgTarget.on('change', function(){ 
		var parent = $(this).parent(); parent.children('.upload-display').remove(); 
		if(window.FileReader){ //image 파일만 
			if (!$(this)[0].files[0].type.match(/image\//)) 
				return; 
			var reader = new FileReader(); 
			reader.onload = function(e){ 
				var src = e.target.result; parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>'); 
				}
			reader.readAsDataURL($(this)[0].files[0]); 
			} else 
			{ $(this)[0].select();
			$(this)[0].blur();
			var imgSrc = document.selection.createRange().text; parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'); 
			var img = $(this).siblings('.upload-display').find('img'); img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")"; 
			}
		});
		
	
	//1:1문의 값 넘기기
	$('.in_add').on('click',function(){
		var check = true;
		if($('.content').val()==""| $('.content').val()==null){
			alert("문의제목을 입력해주세요.");
			$('.content').focus();
			check=false;
		}else if($('.tent').val()==""| $('.tent').val()==null){
			alert("문의내용을 입력해주세요.");
			$('.tent').focus();
			check=false;
		}else if(check==true){
			$('#in_frm').submit();
			
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
	

	$(".line").on("click",function(){
		var num = $(this).attr("id");
		$(location).attr('href','corInquiryCon?menu=Inquiry&num='+num);
	});
	
	$(".inquiry_admin").on("click",function(){
		var num = $(this).attr("id");
		$(location).attr('href','InquiryConAdmin?menu=Inquiry&num='+num);
	});
	
	$(".cor_inquiry_admin").on("click",function(){
		var num = $(this).attr("id");
		$(location).attr('href','corInquiryConAdmin?menu=Inquiry&num='+num);
	});
	
	$(".no_line").on("click",function(){
		var num = $(this).attr("id");
		$(location).attr('href','noticeCon?menu=Notice&num='+num);
	});
	
	$(".detail_line").on("click",function(){
		var num = $(this).attr("id");
		$(location).attr('href','noticeDetails?menu=Notice&num='+num);
	});
	

	$('.notice_add').on("click",function(){
		console.log('aa');
	$(location).attr('href','noticeAdd?menu=Notice');
	
	});
	
	//공지사항 값넘기기
	$('.add').on('click',function(){
		var check = true;
		if($('.notice_title').val()==""| $('.notice_title').val()==null){
			alert("문의제목을 입력해주세요.");
			$('.notice_title').focus();
			check=false;
		}else if($('.notice_content').val()==""| $('.notice_content').val()==null){
			alert("문의내용을 입력해주세요.");
			$('.notice_content').focus();
			check=false;
		}else if(check==true){
			$('#notice_frm').submit();
			
		}
	});
	
	$('.ripple_add').on('click',function(){
		var check = true;
		if($('.ripple').val()==""| $('.ripple').val()==null){
			alert("문의제목을 입력해주세요.");
			$('.ripple').focus();
			check=false;
		}else if(check==true){
			$('#ripply_frm').submit();
			
		}
	});
	
	$('.ripple_add1').on('click',function(){
		var check = true;
		if($('.ripple1').val()==""| $('.ripple1').val()==null){
			alert("문의제목을 입력해주세요.");
			$('.ripple1').focus();
			check=false;
		}else if(check==true){
			$('#ripply_frm1').submit();
			
		}
	});
	
	

	$('.notice_list').on('click',function(){
		$(location).attr('href','noticeAdmin?menu=Notice');
	});
	
	$('.notice_details').on('click',function(){
		$(location).attr('href','NoticeIndex?menu=Notice');
	});
	
});
