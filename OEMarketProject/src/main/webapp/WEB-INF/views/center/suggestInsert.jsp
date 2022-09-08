<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의하기</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section class="center__insert__ce" id="suggestInsert">
	<input type="hidden" name="us_id" value="${login.us_id }">
	<div class="container center__header__bottom">
		<p class="h6"><c:choose><c:when test="${us_id != null }"><a href='/center/center?us_id=<c:out value="${us_id }"/>'>고객센터</a
		></c:when><c:otherwise><a href='/center/center'>고객센터</a></c:otherwise></c:choose></p>&nbsp;&nbsp;＞&nbsp;&nbsp;건의하기
	</div>
	<div style="border-bottom: 1px solid #999;"></div>
	<div class="container center__insert__title">
		<div class="row">
			<div class="col-auto"><p class="h2"><strong>건의하기</strong></p></div>
			<div class="col-md-auto"><p class="h5 text-muted">※다른 이용자들에게 불쾌감을 줄 수 있는 게시글은 무통보 삭제됩니다.</p></div>
		</div>
	</div>
	<form action="/center/SuggestInsert" method="post" enctype="multipart/form-data" name="form">
		<input type="hidden" name="ce_id" value="${login.us_id}">
		<input type="hidden" name="ce_nickname" value="${login.us_nickname}">
		<input type="hidden" name="ce_category" value="SUGGESTION">
		<div class="container">
			<div class="row form-group">
				<div class="col-md-auto center__insert__label"><p class="h4 font-weight-bold"><label for="ce_title">제목　</label></p></div>
				<div class="col-md-auto">
					<input type="text" name="ce_title" class="form-control center__insert__input" id="ce_title" placeholder="100자 이내로 입력해주세요.">
				</div>
			</div>
				<div class="center__insert__label">
					<p class="h4 font-weight-bold"><label for="ce_content">내용 입력</label>
					<small class="center__insert__textCount">0자/1000자</small></p>
				</div>
			<div class="col-md-auto form-group">
				<textarea name="ce_content" class="form-control center__insert__textarea" id="ce_content" placeholder="1000자 이내로 입력해주세요." rows="14" cols="100"></textarea>
			</div>
		</div>
		<div class="container">
			<div class="row center__savearea">
				<div class="col-auto mr-auto">
					<div class="form-group filebox preview-image">
						<input class="upload-name" value="이미지 파일 첨부" disabled="disabled">
						<label class="input-file-button" for="input-file"><img src="/resources/assets/images/paper-clip.png" title="업로드"></label>
						<input type="file" name="ce_filename" class="upload-hidden" id="input-file" accept=".gif, .jpg, .jpeg, .png"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="offset-md-auto center__buttonarea">
						<button type="button" class="btn btn-danger" id="resetBtn">취소하기</button>&nbsp;&nbsp;
						<button type="button" class="btn btn-success" id="submitBtn">등록하기</button>&nbsp;&nbsp;
						<button type="button" class="btn btn-secondary" onclick="location.href='/center/suggest'">오이마켓 건의함으로</button>
				  	</div>
				</div>
			</div>
		</div>
		<!-- 모달 시작 -->
		<div id="myModal" class="modal fade" role="dialog" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
						<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
						</svg>&nbsp;알림</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span></button>
					</div>
					<div class="modal-body text-center"><p></p></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary modal-btn" id="modal-ok-btn">확인</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 모달 끝 -->
	</form>
</section>

<script>
	//뒤로가기가 감지되면 현재 페이지 새로고침
	window.onpageshow = function(e) {
		if (e.persisted || (window.performance && window.performance.navigation.type == 2)) {
			location.reload();
		}
	}

	$(document).ready(function(){
		var fileTarget = $('.filebox .upload-hidden');
	
		fileTarget.on('change', function(){
			if(window.FileReader){
				// 파일명 추출
				var filename = $(this)[0].files[0].name;
			}else{
				// Old IE 파일명 추출
				var filename = $(this).val().split('/').pop().split('\\').pop();
			};
			
			$(this).siblings('.upload-name').val(filename);
		});
		
		//preview image 
		var imgTarget = $('.preview-image .upload-hidden');
		
		imgTarget.on('change', function(){
			var parent = $(this).parent();
			parent.children('.upload-display').remove();
			
			if(window.FileReader){
				//image 파일만
				if (!$(this)[0].files[0].type.match(/image/)) return;
				
				var reader = new FileReader();
				reader.onload = function(e){
					var src = e.target.result;
					parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
				}
				reader.readAsDataURL($(this)[0].files[0]);
			}else{
				$(this)[0].select();
				$(this)[0].blur();
				var imgSrc = document.selection.createRange().text;
				parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
				
				var img = $(this).siblings('.upload-display').find('img');
				img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
			}
		});
		
		//모달-----------------------안내창----------------------------
		var modal = $("#myModal");
		
		$("#resetBtn").on("click",function(){
			modal.find("p").text("입력하신 내용이 모두 초기화됩니다. 계속하시겠습니까?");
			$('#modal-ok-btn').prop("type", "reset");
			$("#myModal").modal("show");
			$("#modal-ok-btn").on('click',function(){
				$("#myModal").modal("hide");
			});
		});
		
		$("#submitBtn").on("click",function(){
			if(document.form.ce_title.value.length === 0){
				alert("제목을 입력해주세요.");
				document.form.ce_title.focus();
				return false;
			}else if(document.form.ce_title.value.length > 100){
				alert("제목을 100자 이내로 입력해주세요.");
				document.form.ce_title.focus();
				return false;
			}else if(document.form.ce_content.value.length === 0){
				alert("내용을 입력해주세요.");
				document.form.ce_content.focus();
				return false;
			}else if(document.form.ce_content.value.length > 1000){
				alert("내용을 1000자 이내로 입력해주세요.");
				document.form.ce_content.focus();
				return false;
			}
			
			modal.find("p").text("게시글 등록 후 삭제가 불가능합니다. 계속하시겠습니까?");
			$('#modal-ok-btn').prop("type", "submit");
			$("#myModal").modal("show");
			$("#modal-ok-btn").on('click',function(){
				$("#myModal").modal("hide");
				alert("등록되었습니다.");
			});
		});
	});
	
	//내용 입력 영역 글자수 체크
	$('.center__insert__textarea').keyup(function (e) {
		let content = $(this).val();
		
		if (content.length == 0 || content == '') {
			$('.center__insert__textCount').text('0' + '자/1000자');
		}else{
			$('.center__insert__textCount').text(content.length + '자/1000자');
		}
		if (content.length > 1000) {
			$(this).val($(this).val().substring(0, 1000));
			alert('내용은 최대 1000자까지 입력 가능합니다.');
		};
	});
	
	//로그인 풀린채로 넘어갔을 때 로그인창으로 넘어가게
	var Id = $("input[name='us_id']").val();
	console.log(Id);
	if(Id === ''){
		alert('로그인이 필요한 서비스입니다.');
		$(location).attr("href","/login");
	}
</script>

<%@ include file="../includes/footer.jsp" %>