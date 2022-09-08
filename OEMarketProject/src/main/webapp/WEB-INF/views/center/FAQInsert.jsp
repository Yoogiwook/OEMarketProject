<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움말 등록</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section id="FAQInsert">
	<input type="hidden" name="us_grade" value="${login.us_grade }">
	<form action="/center/FAQInsert" method="post" name="form">
		<input type="hidden" name="no_id" value="${login.us_id }">
		<input type="hidden" name="no_nickname" value="${login.us_nickname }">
		<div class="container center__header__bottom">
			<p class="h6"><a href="/center/center">고객센터</a>&nbsp;&nbsp;＞&nbsp;&nbsp;<c:choose>
			<c:when test="${login.us_id != null }"><a href='/center/FAQ?us_id=<c:out value="${login.us_id }"/>&keyword='>자주 하는 질문</a></c:when>
			<c:otherwise><a href='/center/FAQ?keyword='>자주 하는 질문</a></c:otherwise></c:choose></p>
		</div>
		<div style="border-bottom: 1px solid #999;"></div>
		<div class="container center__insert__title">
			<div class="row"><div class="col-auto"><p class="h2"><strong>도움말 등록</strong></p></div></div>
		</div>
		<div class="container">
			<div class="row form-group">
				<div class="col-md-auto center__insert__label"><p class="h4 font-weight-bold"><label for="no_title">제목　</label></p></div>
				<div class="col-md-auto">
					<input type="text" name="no_title" class="form-control center__insert__input" id="no_title" placeholder="100자 이내로 입력해주세요.">
				</div>
			</div>
				<div class="center__insert__label">
					<p class="h4 font-weight-bold"><label for="no_content">내용 입력</label>
					<small class="center__insert__textCount"></small></p>
				</div>
			<div class="col-md-auto form-group">
				<textarea name="no_content" class="form-control center__insert__textarea" id="no_content" placeholder="1000자 이내로 입력해주세요." rows="14" cols="100"></textarea>
			</div>
		</div>
		<div class="container">
			<div class="row justify-content-end">
				<div class="col-auto">
					<div class="col-auto center__buttonarea center__admin__buttonarea">
						<button type="button" class="btn btn-danger" id="resetBtn">취소하기</button>&nbsp;&nbsp;
						<button type="button" class="btn btn-success" id="submitBtn">등록하기</button>&nbsp;&nbsp;
						<button type="button" class="btn btn-secondary" onclick="document.getElementById('goToFAQList').submit();">자주 하는 질문으로</button>
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
	
	//모달 안내창
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
		if(document.form.no_title.value.length === 0){
			alert("제목을 입력해주세요.");
			document.form.no_title.focus();
			return false;
		}else if(document.form.no_title.value.length > 100){
			alert("제목을 100자 이내로 입력해주세요.");
			document.form.no_title.focus();
			return false;
		}else if(document.form.no_content.value.length === 0){
			alert("내용을 입력해주세요.");
			document.form.no_content.focus();
			return false;
		}else if(document.form.no_content.value.length > 1000){
			alert("내용을 1000자 이내로 입력해주세요.");
			document.form.no_content.focus();
			return false;
		}
		
		modal.find("p").text("게시글을 등록하시겠습니까?");
		$('#modal-ok-btn').prop("type", "submit");
		$("#myModal").modal("show");
		$("#modal-ok-btn").on('click',function(){
			$("#myModal").modal("hide");
			alert("등록되었습니다.");
		});
	});

	//관리자로 로그인 하지 않았을 경우
	var grade = $("input[name='us_grade']").val();
	console.log(grade);
	if(grade != 0 || grade === ''){
		alert('관리자 전용 서비스입니다.');
		if(grade == 1){
			$(location).attr("href","/center/center"); //일반회원은 고객센터 메인페이지로 이동
		}else{
			$(location).attr("href","/login"); //비회원은 로그인 페이지로 이동
		}
	}
</script>

<%@ include file="../includes/footer.jsp" %>