<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 내역</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section id="QnA">
	<div class="container center__header__bottom">
		<p class="h6"><a href="/center/center">고객센터</a
		>&nbsp;&nbsp;＞&nbsp;&nbsp;<a href="/center/QnAInsert">1:1 문의하기</a
		>&nbsp;&nbsp;＞&nbsp;&nbsp;<a href="/center/QnA">1:1 문의 내역</a></p>
	</div>
	<div style="border-bottom: 1px solid #999;"></div>
	<div class="container center__body">
		<div>
			<p class="h4"><strong>[관리자] ${login.us_nickname}님</strong></p>
			<p class="h6 center__body__explanation">1:1 문의 내역 관리</p>
		</div>
	</div>
	<div class="container center__qna__table">
		<c:choose>
			<c:when test="${fn:length(QnAList) > 0}">
				<table class="table table-bordered table-secondary table-hover">
					<thead>
						<tr>
							<th class="center__thead column__width__160" scope="col">등록일</th>
							<th class="center__thead" scope="col">제목</th>
							<th class="center__thead column__width__160" scope="col">답변 상태</th>
							<th class="center__thead column__width__160" scope="col">작성자 아이디</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${QnAList}" var="QnA">
						<tr>
							<td class="text-center"><fmt:formatDate value="${QnA.ce_date}" pattern="yyyy-MM-dd"/></td>
							<td class="center__table__widecolumn"><a href='/center/QnADetails?ce_num=${QnA.ce_num}'
							><c:out value="${QnA.ce_title}"/></a></td>
							<td class="text-center"><c:out value="${QnA.ce_status}"/></td>
							<td class="text-center"><c:out value="${QnA.ce_id}"/></td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise><div class="center__nothing"><p class="h2 text-center">문의 내역이 존재하지 않습니다.</p></div></c:otherwise>
		</c:choose>
	</div>
	<!-- 페이지 처리 Start -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="pagination justify-content-center center__paging">
					<ul>
						<c:if test="${pageMaker.prev }">
							<li class="frm paginate_button previous"><a href="${pageMaker.startPage-1 }">
							<i class="fa fa-chevron-left" aria-hidden="true"></i></a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="frm paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''}">
							<a href="${num }">${num }</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="frm paginate_button next"><a href="${pageMaker.endPage+1 }">
							<i class="fa fa-chevron-right" aria-hidden="true"></i></a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 페이지 처리 End -->
</section>

<form id="QnA_form">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<input type="hidden" name="us_id" value="${login.us_id}">
</form>

<script type="text/javascript">
	//폼 실행
	$(document).ready(function() {
		//로그인 풀리면 로그인창으로 넘어가게
		var Id = $("input[name='us_id']").val();
		console.log(Id);
		if(Id === ''){
			alert('로그인이 필요한 서비스입니다.');
			$(location).attr("href","/login");
		}
		
		//페이징
		var formObj = $("#QnA_form");
		
		$(".paginate_button a").on("click", function(e){
			e.preventDefault(); //페이지가 바로 넘어가는것을 방지하기 위한 코드
			console.log('click');
			formObj.find("input[name='pageNum']").val($(this).attr("href"));
			
			formObj.submit();
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