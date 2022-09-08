<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>찜 목록</title>
<meta charset="UTF-8">
<style type="text/css">
#board_list{padding-top: 150px;}
#heartBoard__top{padding-bottom: 45px;}
.item{width:350px;}
.hover-content ul{margin-top: 32.5%;}
.hover-content ul li{margin-left: 42.5%; margin-top: 5%; width: 50px; height: 50px; background-color: white; opacity: 0.9;}
.hover-content ul li a{color: black;}
.hover-content ul li a i{margin-top: 16px;}
#heartBoard__nothing{padding: 120px 0 120px 0;}
</style>
</head>
<%@ include file="../includes/header.jsp" %>
<input type="hidden" name="logged_in_id" value='<c:out value="${login.us_id }"/>'>
<input type="hidden" name="logged_in_grade" value='<c:out value="${login.us_grade }"/>'>
<input type="hidden" name="my_id" value='<%=request.getParameter("my_id") %>'>
<section class="section" id="board_list">
	<div class="container" id="heartBoard__top">
		<div class="row">
			<div class="col-12">
				<div class="text-center">
					<h1><strong>찜 목록</strong></h1>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<c:choose>
				<c:when test="${fn:length(heartList) > 0 }">
					<c:forEach items="${heartList}" var="heart" varStatus="status">
						<form action="/mypage/removeHeart" method="post" id="removingForm">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
							<input type="hidden" name="he_bo_num" value='<c:out value="${heartList[status.index].he_bo_num}" />'>
							<input type="hidden" name="he_id" value='<c:out value="${heartList[status.index].he_id}" />'>
							<input type="hidden" name="align" value="regdate">
							<div class="col-lg-4">
								<div class="item">
									<div class="thumb">
										<div class="hover-content">
											<ul>
												<li><a href='/board/boardDetail?bo_num=<c:out value="${heart.mvo.bo_num }"/>&align=&bo_id=<c:out value="${heart.mvo.bo_id }"/>'
												 title="상품 상세보기"><i class="fa fa-search"></i></a></li>
												<li><a title="찜 취소하기" onclick="removeChk();"><i class="fa fa-heart"></i><strong>-</strong></a></li>
				 							</ul>
										</div>
										<c:choose>
											<c:when test="${heart.mvo.bo_id=='crawling'}">
												<img src="<spring:url value='/img/no-photo-gray.png'/>" width="250" height="250">
											</c:when>
											<c:otherwise>
												<img src="<spring:url value='/img/${heart.mvo.bo_image1 }'/>" width="250" height="250">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="down-content">
										<p class="h4"><strong><c:out value="${heart.mvo.bo_title}"/></strong></p>
										<p class="h5 text-muted"><c:out value="${heart.mvo.bo_price}"/>&nbsp;원</p>
										<p class="h6 text-muted"><strong><c:out value="${heart.mvo.bo_address1}"
										/>&nbsp;<c:out value="${heart.mvo.bo_address2}"/></strong></p>
										<br><br>
									</div>
								</div>
							</div>
						</form>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="container" id="heartBoard__nothing">
						<div class="row justify-content-md-center">
							<div class="col-md-auto">
								<p class="h3 text-center">찜한 상품이 존재하지 않습니다.</p>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="pagination justify-content-center">
					<ul>
						<c:if test="${pageMaker.prev }">
							<li class="frm paginate_button previous"><a href="${pageMaker.startPage-1 }">
							<i class="fa fa-chevron-left" aria-hidden="true"></i></a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''}">
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
	</div>
</section>

<form role="form" id="pagingForm">
	<input type="hidden" name="my_id" value="${heartList[0].he_id}">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
</form>

<script>
	//페이징 폼
	$(document).ready(function() {
		var formObj = $("#pagingForm");
	
		$(".paginate_button a").on("click",function(e) {
			e.preventDefault();
	
			formObj.attr("action", "/mypage/heartBoard").attr("method", "get");
			var my_IdTag = $("input[name='my_id']").clone();
			var pageNumTag = formObj.find("input[name='pageNum']").val($(this).attr("href"));
			formObj.empty();
			formObj.append(my_IdTag);
			formObj.append(pageNumTag);
	
			formObj.submit();
		});
	});
	
	//찜목록에서 삭제 전 확인
	function removeChk() {
		if (!confirm("해당 상품을 찜 목록에서 삭제하시겠습니까?")) {
			return;
		} else {
			alert("삭제되었습니다.");
			document.getElementById('removingForm').submit();
		}
	}
	
	//관리자 or 본인만 접근 가능하도록 비정상적인 접근을 차단
	var logged_in_id = $("input[name='logged_in_id']").val();
	var logged_in_grade  = $("input[name='logged_in_grade']").val();
	var my_id = $("input[name='my_id']").val();

	if((logged_in_grade != 0 && logged_in_id != my_id) || logged_in_id === ''){
		alert('비정상적인 접근입니다.');
		$(location).attr("href","/");
	}
</script>

<%@ include file="../includes/footer.jsp" %>