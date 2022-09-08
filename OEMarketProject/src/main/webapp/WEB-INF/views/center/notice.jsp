<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section id="notice">
	<div class="container center__header__bottom">
		<p class="h6"><a href="/center/center">고객센터</a>&nbsp;&nbsp;＞&nbsp;&nbsp;<a href="/center/notice">공지사항</a></p>
	</div>
	<div style="border-bottom: 1px solid #999;"></div>
	<div class="container center__body">
		<div class="row">
			<c:choose>
				<c:when test="${login.us_grade == 0 }">
					<div class="col-auto mr-auto"><p class="h2"><strong>공지사항</strong></p></div>
					<div class="col-auto"><button class="btn btn-secondary center__button__top__right" onclick="location.href='/center/noticeInsert'"><p>새 공지 등록</p></button></div>
				</c:when>
				<c:otherwise>
					<div class="col-12"><p class="h2"><strong>공지사항</strong></p></div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="container center__body center__table">
		<table class="table table-bordered table-secondary table-hover">
			<thead>
				<tr>
					<th class="center__thead column__width__80" scope="col">No.</th>
					<th class="center__thead" scope="col">제목</th>
					<th class="center__thead column__width__160" scope="col">등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listNotice }" var="notice" varStatus="status">
					<tr>
						<td class="text-center"><c:out value="${status.index + 1 }" /></td>
						<td class="center__table__widecolumn"><c:choose>
						<c:when test="${login.us_id != null }"><a href='/center/noticeDetails?us_id=<c:out value="${login.us_id }"/>&no_num=<c:out value="${notice.no_num }"/>'
						><c:out value="${notice.no_title }" /></a></c:when>
						<c:otherwise><a href='/center/noticeDetails?no_num=<c:out value="${notice.no_num }"/>'
						><c:out value="${notice.no_title }" /></a></c:otherwise></c:choose></td>
						<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.no_date }"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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
	<form id="notice_form">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="us_id" value="${login.us_id}">
	</form>	
</section>

<script type="text/javascript">
	//폼 실행
	$(document).ready(function(){
		//페이징
		var formObj = $("#notice_form");
		
		$(".paginate_button a").on("click", function(e){
			e.preventDefault(); //페이지가 바로 넘어가는것을 방지하기 위한 코드
			console.log('click');
			formObj.find("input[name='pageNum']").val($(this).attr("href"));
			formObj.submit();
		});
	});
	
	//뒤로가기가 감지되면 현재 페이지 새로고침
	window.onpageshow = function(e) {
		if (e.persisted || (window.performance && window.performance.navigation.type == 2)) {
			location.reload();
		}
	}
</script>

<%@ include file="../includes/footer.jsp" %>