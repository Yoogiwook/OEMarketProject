<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section id="noticeDetails">
	<form action="/center/noticeUpdate" method="get">
		<input type="hidden" name="no_num" value="${notice.no_num }">
		<input type="hidden" name="no_title" value="${notice.no_title }">
		<input type="hidden" name="no_content" value="${notice.no_content }">
		<div class="container center__header__bottom">
			<p class="h6"><a href="/center/center">고객센터</a>&nbsp;&nbsp;＞&nbsp;&nbsp;<a href="/center/notice">공지사항</a></p>
		</div>
		<div style="border-bottom: 1px solid #999;"></div>
		<div class="container center__body">
			<div class="row">
				<div class="col-md-auto"><p class="h4"><strong><c:out value="${notice.no_title }"/></strong></p></div>
			</div>
			<div class="row" style="margin: 30px 0 -30px -13px;">
				<div class="col-md-auto">
					<p class="h6 text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
					<path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>
					<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/></svg>&nbsp;등록일&nbsp;:&nbsp;
					<fmt:formatDate value="${notice.no_date}" pattern="yyyy-MM-dd"/></p>
				</div>
			</div>
			<hr class="center__hr">
			<div class="center__details__content"><c:out value="${notice.no_content }" /></div>
			<hr class="center__hr">
		</div>
		<div class="container">
			<div class="row justify-content-end">
				<div class="col-auto center__buttonarea center__details__goToList">
					<c:if test="${login.us_grade == 0 }">
						<button type="submit" class="btn btn-danger runFrm" data-oper="deleteNotice">삭제하기</button>&nbsp;&nbsp;
						<button type="submit" class="btn btn-success runFrm" data-oper="updateNotice">수정하기</button>&nbsp;&nbsp;
					</c:if>
						<button type="button" class="btn btn-secondary" onclick="location.href='/center/notice'">공지 사항 목록으로</button>
				</div>
			</div>
		</div>
	</form>
</section>

<script>
	//폼 실행
	$(document).ready(function(){
		var formObj = $("form");
		
		$('.runFrm').on("click", function(e){
			e.preventDefault();
			
			var operation = $(this).data('oper');
			console.log(operation);
			
			if(operation === 'deleteNotice'){
				if (!confirm("게시글을 삭제하시겠습니까?")){
					return;
				}else{
					alert("삭제되었습니다.");
					formObj.attr("action","/center/removeNotice").attr("method","post");
				}
			}else if(operation === 'updateNotice'){
				formObj.attr("action","/center/noticeUpdate").attr("method","get");
			}
			formObj.submit();
		});
	});
</script>

<%@ include file="../includes/footer.jsp" %>