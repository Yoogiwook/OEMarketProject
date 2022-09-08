<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오이마켓 건의함</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section id="suggest">
	<div class="container center__header__bottom">
		<p class="h6"><a href="/center/center?us_id=${login.us_id}">고객센터</a
		>&nbsp;&nbsp;＞&nbsp;&nbsp;<a href="/center/suggestInsert">건의하기</a
		>&nbsp;&nbsp;＞&nbsp;&nbsp;<a href="/center/suggest">오이마켓 건의함</a></p>
	</div>
	<div style="border-bottom: 1px solid #999;"></div>
	<form id="suggest_form">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="us_id" value="${login.us_id}">
		<%
			String category = request.getParameter("category");
		%>
		<input type="hidden" name="category" id="category" value="<%=category%>">
		<div class="container center__body">
			<div class="row">
				<div class="col-auto mr-auto">
					<p class="h4"><strong>오이마켓 건의함</strong></p>
					<p class="h6 center__body__explanation">오이마켓의 이용자분들께서 남겨주신 소중한 의견들입니다.</p>
				</div>
				<div class="col-auto">
					<c:if test="${login.us_grade != 0 }">
						<div class="board_list_category center__b_l_c">
							<div class="inner-content">
								<span class="filter frm" data-oper="all">전체보기</span
								>&nbsp;&nbsp;|&nbsp;&nbsp;<span class="filter n frm" data-oper="onlyme">내가 작성한 게시글만 보기</span>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</form>
	<div class="container center__qna__table">
		<c:choose>
			<c:when test="${fn:length(suggest) > 0}">
				<table class="table table-bordered table-secondary table-hover">
					<thead>
						<tr>
							<th class="center__thead column__width__160" scope="col">등록일</th>
							<th class="center__thead" scope="col">제목</th>
							<th class="center__thead column__width__160" scope="col">작성자 아이디</th>
							<c:if test="${login.us_grade == 0 }"><th class="center__thead column__width__160" scope="col">바로 삭제</th></c:if>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${suggest}" var="suggestList" varStatus="status">
						<tr>
							<td class="text-center"><fmt:formatDate value="${suggestList.ce_date}" pattern="yyyy-MM-dd"/></td>
							<td class="center__table__widecolumn"><a href='/center/suggestDetails?ce_num=${suggestList.ce_num}'>
							<c:out value="${suggestList.ce_title}"/></a></td>
							<c:choose>
					        <c:when test="${login.us_grade == 0 }">
	                              <td class="text-center"><c:out value="${suggestList.ce_id }" /></td>
	                              <td class="text-center"><button value="${suggestList.ce_num}" class="btn btn-danger center__tinybutton" 
	                              id="${suggestList.ce_num}" onclick="delete_click(this.id)">삭제하기</button></td>
	                              <form id="godeleteSuggest">
	                                 <input type="hidden" name="ce_num" id="ce_num" value="">
	                              </form>
	                           </c:when>
								<c:otherwise>
									<td class="text-center"><c:out value="${fn:substring(suggestList.ce_id,0,3) }****"/></td>
								</c:otherwise>
							</c:choose>
					    </tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise><div class="center__nothing"><p class="h2 text-center">건의 내역이 존재하지 않습니다.</p></div></c:otherwise>
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

<script type="text/javascript">
	//폼 실행
	$(document).ready(function() {
		//페이징
		var formObj = $("#suggest_form");
		var category = $("input[name='category']");
		var operation = $(this).data('oper');
		console.log(operation);			
		
		$(".paginate_button a").on("click", function(e){
			e.preventDefault(); //페이지가 바로 넘어가는것을 방지하기 위한 코드
			console.log('click');
			formObj.find("input[name='pageNum']").val($(this).attr("href"));
			formObj.submit();
		});
		
		//카테고리 필터링
		$('.frm').on("click",function(e) {
			e.preventDefault();
			var operation = $(this).data('oper');
			console.log(operation);
			if (operation === 'all') {
				formObj.attr("action","/center/suggest").attr("method", "get");
				category.val('');
				formObj.submit();
			}else if(operation === 'onlyme'){
				formObj.attr("action","/center/suggest").attr("method", "get");
				category.val('onlyme');
				formObj.submit();
			}
		});
		
		// 로그인 체크 후 카테고리 유무
		var id_chk = $("input[name=us_id]").val();
		console.log("id_chk : "+id_chk);
		if(id_chk === ''){
			$(".inner-content").hide();
		}
	});
	
	// 모달 & 글 삭제
	function delete_click(ce_Num){
		var formObj = $("#godeleteSuggest");
		var modal = $("#myModal");
		var Num = $("input[name='ce_num']").val(ce_Num);
		
		console.log("ce_Num : " + ce_Num);
		console.log("Num : " + Num);
		
		modal.find("p").text("게시글을 삭제하시겠습니까?");
		$("#myModal").modal("show");
		$("#modal-ok-btn").on('click',function(){
			$("#myModal").modal("hide");
			formObj.attr("action","/center/suggestAdminDelete").attr("method","post");
			formObj.append(Num);
			formObj.submit();
			alert("삭제되었습니다.");
		});
	} 
	
	//뒤로가기가 감지되면 현재 페이지 새로고침
	window.onpageshow = function(e) {
		if (e.persisted || (window.performance && window.performance.navigation.type == 2)) {
			location.reload();
		}
	}
</script>

<%@ include file="../includes/footer.jsp" %>