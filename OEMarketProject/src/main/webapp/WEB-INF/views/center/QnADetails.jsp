<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 내역</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section id="QnADetails">
	<div class="container center__header__bottom">
		<p class="h6"><a href="/center/center">고객센터</a
		>&nbsp;&nbsp;＞&nbsp;&nbsp;<a href="/center/QnAInsert">1:1 문의하기</a
		>&nbsp;&nbsp;＞&nbsp;&nbsp;<a href="/center/QnA">1:1 문의 내역</a></p>
	</div>
	<div style="border-bottom: 1px solid #999;"></div>
	<div class="container center__body">
		<div class="row">
			<div class="col-md-auto"><p class="h4"><strong>제목　</strong></p></div>
			<div class="col-md-auto"><p class="h4">| &emsp; ${QnA.ce_title}</p></div>
		</div>
		<div class="row" style="margin-top: 15px">
			<div class="col-md-auto"><p class="h4"><strong>이메일</strong></p></div>
			<c:choose>
				<c:when test="${login.us_grade == 0 }">
					<div class="col-md-auto">
						<span class="h4">| &emsp; </span><span class="h4 center__admin__emailarea" id="emailadress">${QnA.ce_email}</span>
						<div class="dropdown-menu center__admin__dropdown">
							<a class="dropdown-item" href='https://mail.google.com/mail/u/0/#inbox?compose=new' target='_blank'>Gmail로 이동</a>
							<a class="dropdown-item" href='https://mail.naver.com/#%7B%22fClass%22%3A%22write%22%2C%22oParameter%22%3A%7B%22orderType%22%3A%22new%22%2C%22sMailList%22%3A%22%22%7D%7D' target='_blank'>NAVER 메일로 이동</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" id="copy__emailadress" href="#">이메일 주소 복사</a>
						</div>
					</div>
				</c:when>
				<c:otherwise><div class="col-md-auto"><p class="h4">| &emsp; ${QnA.ce_email}</p></div></c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="container">
		<div class="row" style="margin: 50px 0 -25px 0;">
			<div class="col-md-auto">
				<p class="h6 text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
				<path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>
				<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/></svg>&nbsp;등록일&nbsp;:&nbsp;
				<fmt:formatDate value="${QnA.ce_date}" pattern="yyyy-MM-dd"/></p>
			</div>
			<div class="col-md-auto">
				<p class="h6 text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-headset" viewBox="0 0 16 16">
				<path d="M8 1a5 5 0 0 0-5 5v1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V6a6 6 0 1 1 12 0v6a2.5 2.5 0 0 1-2.5 2.5H9.366a1 1 0 0 1-.866.5h-1a1 1 0 1 1 0-2h1a1 1 0 0 1 .866.5H11.5A1.5 1.5 0 0 0 13 12h-1a1 1 0 0 1-1-1V8a1 1 0 0 1 1-1h1V6a5 5 0 0 0-5-5z"/>
				</svg>&nbsp;상태&nbsp;:&nbsp;<c:out value="${QnA.ce_status }" /></p>
			</div>
		</div>
		<hr class="center__hr">
		<div class="center__details__content">
			<div><c:out value="${QnA.ce_content }" /></div>
			<c:if test="${QnA.ce_filename != null }">
				<div>
					<img class="img-thumbnail rounded mx-auto d-block" src="<spring:url value='/img/${QnA.ce_filename}'/>" alt="image">
				</div>
			</c:if>
		</div>
		<hr class="center__hr">
	</div>
	<div class="container">
		<div class="row justify-content-end">
			<div class="col-auto center__buttonarea center__details__goToList">
				<button type="button" class="btn btn-success" id="goQnAOk_Btn">답변 완료 처리</button>
				<button type="button" class="btn btn-secondary" id="goQnAAdmin_Btn" onclick="location.href='/center/QnA_admin'">1:1 문의 내역으로</button>
				<button type="button" class="btn btn-secondary" id="goQnA_Btn" onclick="location.href='/center/QnA?us_id=${login.us_id}'">1:1 문의 내역으로</button>
				<input type="hidden" name="us_id" value="${login.us_id }">
				<input type="hidden" name="us_grade" value="${login.us_grade }">
			</div>
		</div>
	</div>
	<!-- 모달 시작 -->
	<div id="myModal" class="modal fade" role="dialog" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">!</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body text-center">
					<p>내용을 지우시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary modal-btn" id="modal-ok-btn">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 끝 -->
</section>

<form id="statusOkForm">
	<input type="hidden" name="ce_num" value="${QnA.ce_num }">
</form>

<script type="text/javascript">
	//폼 실행
	$(document).ready(function() {
		//=======================================
		//로그인 풀린채로 넘어갔을 때 로그인창으로 넘어가게
		var Id = $("input[name='us_id']").val();
		console.log(Id);
		if(Id === ''){
			alert('로그인이 필요한 서비스입니다.');
			$(location).attr("href","/login");
		}
		//=======================================
		
		// 회원등급 체크 후 버튼 바꾸기
		var grade_chk = $("input[name=us_grade]").val();
		console.log(grade_chk);
		if(grade_chk === '0'){//관리자
			$("#goQnA_Btn").hide();
		}else{
			$("#goQnAAdmin_Btn").hide();
			$("#goQnAOk_Btn").hide();
		}
		
		// 답변완료처리
		/* var formObj = $("#statusOkForm");
		$("#goQnAOk_Btn").on("click", function(e){
			e.preventDefault(); //페이지가 바로 넘어가는것을 방지하기 위한 코드
			
			formObj.attr("action","/center/QnA_admin_updateState").attr("method","post");
			formObj.submit();
		
		// 모달 & 답변완료처리
		 var formObj = $("#statusOkForm");
		 var modal = $("#myModal");
		
		 $("#goQnAOk_Btn").on("click",function(){
			modal.find("p").text("답변 완료 처리를 진행하시겠습니까?");
			$("#modal-ok-btn").attr('id', 'goQnAOkBtn');
			$("#myModal").modal("show");
			$("#goQnAOkBtn").on('click',function(){
				$("#myModal").modal("hide");
				alert("완료되었습니다.");
				formObj.attr("action","/center/QnA_admin_updateState").attr("method","post");
				formObj.submit();
			});
		});
	});
	
	//뒤로가기가 감지되면 현재 페이지 새로고침
	window.onpageshow = function(e) {
		if (e.persisted || (window.performance && window.performance.navigation.type == 2)) {
			location.reload();
		}
	}
	
	//관리자로 로그인 후, 이용자 이메일 주소 클릭 시 드롭다운 보여주기
	const emailadress = document.querySelector('.center__admin__emailarea');
	
	emailadress.addEventListener('click', () => {
		const dropdown = document.querySelector('.center__admin__dropdown');
		dropdown.style.display = 'block';
	});
	
	//드롭다운 외 영역 클릭 시 드롭다운 숨기기
	document.addEventListener('mouseup', function(e) {
	    var container = document.querySelector('.center__admin__dropdown');
	    if (!container.contains(e.target)) {
	        container.style.display = 'none';
	    }
	});
	
	//이메일 주소를 클립보드에 복사
	const myTextarea = document.getElementById('emailadress');
	
	document.getElementById('copy__emailadress').onclick = () => {
		window.navigator.clipboard.writeText(myTextarea.textContent).then(() => {
			alert("이메일 주소가 복사되었습니다.");
		});
	};
</script>
<%@ include file="../includes/footer.jsp" %>