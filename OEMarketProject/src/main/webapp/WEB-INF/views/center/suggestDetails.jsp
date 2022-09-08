<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오이마켓 건의함</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section id="suggestDetails">
	<div class="container center__header__bottom">
		<p class="h6"><a href="/center/center">고객센터</a
		>&nbsp;&nbsp;＞&nbsp;&nbsp;<a href="/center/suggestInsert">건의하기</a
		>&nbsp;&nbsp;＞&nbsp;&nbsp;<a href="/center/suggest">오이마켓 건의함</a></p>
	</div>
	<div style="border-bottom: 1px solid #999;"></div>
	<div class="container center__body">
		<div class="row">
			<div class="col-md-auto"><p class="h4"><strong><c:out value="${suggest.ce_title }"/></strong></p></div>
		</div>
		<div class="row" style="margin: 30px 0 -30px -13px;">
			<div class="col-md-auto">
				<p class="h6 text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
				<path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>
				<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/></svg>&nbsp;등록일&nbsp;:&nbsp;
				<fmt:formatDate value="${suggest.ce_date}" pattern="yyyy-MM-dd"/></p>
			</div>
			<div class="col-md-auto">
				<p class="h6 text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
				<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/></svg>&nbsp;작성자 아이디&nbsp;:&nbsp;
				<c:choose><c:when test="${login.us_grade == 0 }"><c:out value="${suggest.ce_id }" /></c:when>
				<c:otherwise><c:out value="${fn:substring(suggest.ce_id,0,3) }****"/></c:otherwise></c:choose></p>
			</div>
		</div>
		<hr class="center__hr">
		<div class="center__details__content">
			<div><c:out value="${suggest.ce_content }" /></div>
			<c:if test="${suggest.ce_filename != null }">
				<div>
					<img class="img-thumbnail rounded mx-auto d-block" src="<spring:url value='/img/${suggest.ce_filename}'/>" alt="image">
				</div>
			</c:if>
		</div>
		<hr class="center__hr">
	</div>
	<div class="container">
		<div class="row justify-content-end">
			<div class="col-auto center__buttonarea center__details__goToList">
				<c:if test="${login.us_grade == 0 || login.us_id == suggest.ce_id}">
					<button type="button" class="btn btn-danger" id="deleteSuggestBtn">삭제하기</button>&nbsp;&nbsp;
				</c:if>
				<button type="button" class="btn btn-secondary" onclick="location.href='/center/suggest'">오이마켓 건의함으로</button>
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
</section>

<form id="suggest_form">
	<input type="hidden" name="ce_num" value="${suggest.ce_num }">
</form>

<script>
	//폼 실행
	$(document).ready(function() {
		var formObj = $("#suggest_form");
		// 모달 & 글 삭제
		 var modal = $("#myModal");
	        
		$("#deleteSuggestBtn").on("click",function(){
			modal.find("p").text("게시글을 삭제하시겠습니까?");
			$("#modal-ok-btn").attr('id', 'goDelete');
			$("#myModal").modal("show");
			$("#goDelete").on('click',function(){
				$("#myModal").modal("hide");
				alert("삭제되었습니다.");
				formObj.attr("action","/center/suggestAdminDelete").attr("method","post");
				var ce_Num = $("input[name='ce_num']").clone();
				formObj.append(ce_Num);
				formObj.submit();
			});
		});
	});
	
	//뒤로가기가 감지되면 현재 페이지 새로고침
	window.onpageshow = function(e) {
		if (e.persisted
				|| (window.performance && window.performance.navigation.type == 2)) {
			location.reload();
		}
	}
</script>

<%@ include file="../includes/footer.jsp" %>