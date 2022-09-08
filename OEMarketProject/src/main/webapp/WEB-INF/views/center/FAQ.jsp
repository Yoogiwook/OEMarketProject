<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 하는 질문</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section id="FAQ">
	<div class="container center__header__bottom">
		<p class="h6"><a href="/center/center">고객센터</a>&nbsp;&nbsp;＞&nbsp;&nbsp;<c:choose>
		<c:when test="${login.us_id != null }"><a href='/center/FAQ?us_id=<c:out value="${login.us_id }"/>'>자주 하는 질문</a></c:when>
		<c:otherwise><a href='/center/FAQ'>자주 하는 질문</a></c:otherwise></c:choose></p>
	</div>
	<div style="border-bottom: 1px solid #999;"></div>
	<div class="container center__body">
		<div class="row">
			<c:choose>
				<c:when test="${login.us_grade == 0 }">
					<div class="col-auto mr-auto"><p class="h2"><strong>자주 하는 질문</strong></p></div>
					<div class="col-auto">
						<button class="btn btn-secondary center__button__top__right"
						 onclick="location.href='/center/FAQInsert'"><p>새 도움말 등록</p></button>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-auto mr-auto"><p class="h2"><strong>자주 하는 질문</strong></p></div>
					<div class="col-auto">
						<div class="board_list_category center__b_l_c">
							<div class="inner-content">
								<span class="filter frm" data-oper="date">최신 순으로 보기</span
								>&nbsp;&nbsp;|&nbsp;&nbsp;<span class="filter n frm" data-oper="readcount">조회수 순으로 보기</span>
							</div>
						</div>
					</div>
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
				<c:forEach items="${listFAQ }" var="faq" varStatus="status">
					<tr>
						<td class="text-center"><c:out value="${status.index + 1 }" /></td>
						<td class="center__table__widecolumn"><c:choose>
						<c:when test="${login.us_id != null }"><a href='/center/FAQDetails?us_id=<c:out value="${login.us_id }"/>&no_num=<c:out value="${faq.no_num }"/>'
						><c:out value="${faq.no_title }" /></a></c:when>
						<c:otherwise><a href='/center/FAQDetails?no_num=<c:out value="${faq.no_num }"/>'
						><c:out value="${faq.no_title }" /></a></c:otherwise></c:choose></td>
						<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${faq.no_date }"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
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
</section>

<form role="form" id="pagingForm">
	<c:if test="${login.us_id != null }"><input type="hidden" id="faq_us_id" name="us_id" value='<c:out value="${login.us_id }" />'></c:if>
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<% String sort = request.getParameter("sort"); %>
	<input type="hidden" name="sort" id="sort" value="<%= sort %>">
</form>

<script>
//페이징 폼
$(document).ready(function() {
	var formObj = $("#pagingForm");
	var sort = $("input[name='sort']");
	
	//카테고리 필터링
	$('.frm').on("click",function(e) {
		e.preventDefault();
		var operation = $(this).data('oper');
		console.log(operation);
		if (operation === 'date') {
			formObj.attr("action","/center/FAQ").attr("method", "get");
			sort.val('');
			formObj.submit();
		}else if(operation === 'readcount'){
			formObj.attr("action","/center/FAQ").attr("method", "get");
			sort.val('readcount');
			formObj.submit();
		}
	});
	
	$(".paginate_button a").on("click",function(e) {
		e.preventDefault();

		formObj.attr("action", "/center/FAQ").attr("method", "get");
		var my_IdTag = $("input[id='faq.no_id']").clone();
		var pageNumTag = formObj.find("input[name='pageNum']").val($(this).attr("href"));
		formObj.empty();
		formObj.append(my_IdTag);
		formObj.append(pageNumTag);

		formObj.submit();
	});
});
</script>

<%@ include file="../includes/footer.jsp" %>