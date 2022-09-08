<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ include file="../includes/header.jsp"%>
<style type="text/css">
#sell_list .sell_list_thumb:hover {
	opacity: 0.5;
	cursor: pointer;
}

#sell_list .filter:hover {
	opacity: 0.5;
	cursor: pointer;
}
#sell_list .table {
    width: 97%;
    margin-left: auto;
    margin-right: auto;
}
#sell_list .table td{vertical-align: middle;}

.sell_list_thumb{width:200px; height:80px;}
.sell_list_thumb img{max-width: 40%; min-height: 100%; margin-right: 10px; float:left;}
.sell_list_thumb .title_padding{padding:28px;}


</style>
<section class="section" id="sell_list">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="text-center">
					<h1>
						<strong>판매 목록</strong>
					</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="board_list_category">
				<div class="col-lg-12">
					<div class="inner-content">
						<span class="filter frm" data-oper="sell_btn">전체보기</span>&nbsp;&nbsp;
						ㅣ&nbsp;&nbsp;
						<span class="filter n frm" data-oper="sell_N_btn">판매중</span>&nbsp;&nbsp;
						ㅣ
						&nbsp; <span class="filter y frm" data-oper="sell_Y_btn">판매완료</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<form role="form" class="table">
				<input type="hidden" name="my_id" value="${login.us_id}">
				<%
				String filter = request.getParameter("filter");
				%>
				<input type="hidden" name="filter" id="filter" value="<%=filter%>">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				<table>
				<c:choose>
					<c:when test="${fn:length(sell) > 0 }">
					<thead>
						<tr>
							<th scope="col">상품번호</th>
							<th scope="col">상품</th>
							<th scope="col">가격</th>
							<th scope="col">판매상태</th>
							<th scope="col">등록날짜</th>
						</tr>
					</thead>
					<tbody>
							<c:forEach items="${sell}" var="sellList" varStatus="status">
								<%
									String bo_ok = "";
								%>
								<c:if test="${sellList.bo_ok == 0}">
									<%
										bo_ok = "판매중";
									%>
								</c:if>
								<c:if test="${sellList.bo_ok == 1}">
									<%
										bo_ok = "판매완료";
									%>
								</c:if>
								<tr>
									<td scope="row" width="10%">
										<c:out value="${sellList.bo_num}" />
									</td>
									<td scope="row" width="20%">
										<div class="sell_list_thumb"  
										onclick="location.href='/board/boardDetail?bo_num=${sellList.bo_num}&align=regdate&bo_id=${login.us_id}'">
											<img src="<spring:url value='/img/${sellList.bo_image1}'/>"
												width="40%" height="10%">
											<div class="title_padding"><c:out value="${sellList.bo_title}" /></div>
										</div>
									</td>
									<td scope="row" width="20%"><c:out value="${sellList.bo_price}" />원</td>
									<td scope="row" width="20%"><c:out value="<%=bo_ok%>" /></td>
									<td scope="row" width="20%"><fmt:formatDate
											pattern="yyyy/MM/dd" value="${sellList.bo_regdate}" /></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="container" style="padding: 120px 0 120px 0;">
								<div class="row justify-content-md-center">
									<div class="col-md-auto">
										<p class="h3 text-center">판매 상품이 존재하지 않습니다.</p>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<!-- 페이지 처리 Start -->
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="pagination">
								<ul>
									<c:if test="${pageMaker.prev }">
										<li class="frm paginate_button previous"><a href="${pageMaker.startPage-1 }">
										<i class="fa fa-chevron-left" aria-hidden="true"></i></a></li>
									</c:if>
									<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
										<li class="frm paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''}">
											<a href="${num }">${num }</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.next }">
										<li class="frm paginate_button next"><a href="${pageMaker.endPage+1 }">
											<i class="fa fa-chevron-right" aria-hidden="true"></i></a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div> <!-- 페이지 처리 End -->
			</form>
		</div>
	</div>

</section>

<script type="text/javascript">
	//폼 실행
	$(document).ready(
		function() {
			var formObj = $("form");
			$('.frm').on("click",function(e) {
				e.preventDefault();
				var operation = $(this).data('oper');
				console.log(operation);
				if (operation === 'sell_N_btn') {
						  formObj.attr("action","/mypage/sellBoard").attr("method", "get");
				var my_IdTag = $("input[name='my_id']").clone();
				var filterTag = $('#filter').val('판매중').clone();
					formObj.empty();
					formObj.append(my_IdTag);
					formObj.append(filterTag);
				} else if (operation === 'sell_Y_btn') {
							formObj.attr("action","/mypage/sellBoard").attr("method", "get");
				var my_IdTag = $("input[name='my_id']").clone();
				var filterTag = $('#filter').val('판매완료').clone();
					formObj.empty();
					formObj.append(my_IdTag);
					formObj.append(filterTag);
				} else if (operation === 'sell_btn') {formObj.attr("action","/mypage/sellBoard").attr("method", "get");
				var my_IdTag = $("input[name='my_id']").clone();
				var filterTag = $('#filter').val('').clone();
					formObj.empty();
					formObj.append(my_IdTag);
					formObj.append(filterTag);
				}
					formObj.submit();
			});

			$(".paginate_button a").on(
					"click",
					function(e) {
						e.preventDefault(); //페이지가 바로 넘어가는것을 방지하기 위한 코드

						formObj.attr("action", "/mypage/sellBoard")
								.attr("method", "get");
						var my_IdTag = $("input[name='my_id']")
								.clone();
						var filterTag = $('#filter').clone();
						var pageNumTag = formObj.find(
								"input[name='pageNum']").val(
								$(this).attr("href"));
						formObj.empty();
						formObj.append(my_IdTag);
						formObj.append(filterTag);
						formObj.append(pageNumTag);

						formObj.submit();
					});
	
			
		});//

	//뒤로가기가 감지되면 현재 페이지 새로고침
	window.onpageshow = function(e) {
		if (e.persisted
				|| (window.performance && window.performance.navigation.type == 2)) {
			location.reload();
		}
	}
					
					
					
</script>

<%@ include file="../includes/footer.jsp"%>