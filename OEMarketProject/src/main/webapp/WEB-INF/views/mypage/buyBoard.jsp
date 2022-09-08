<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ include file="../includes/header.jsp"%>
<style type="text/css">
.sell_list_thumb:hover {
	opacity: 0.5;
	cursor: pointer;
}
</style>
<section class="section" id="board_list" style="padding-top: 150px;">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="text-center" style="padding-bottom: 45px;">
					<h1>
						<strong>구매 목록</strong>
					</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row justify-content-md-center">
			<form role="form">
				<c:choose>
					<c:when test="${fn:length(buy) > 0 }">
						<table border="1">
							<c:forEach items="${buy}" var="buy">
								<tr>
									<th><c:out value="대표사진1장" /></th>
									<th><c:out value="${buy.buy_title}" /></th>
									<th><c:out value="${buy.buy_price}" /></th>
									<th><c:out value="${buy.buy_seller}" /></th>
									<th><fmt:formatDate pattern="yyyy/MM/dd"
											value="${buy.buy_buydate}" /></th>
								</tr>
							</c:forEach>
						</table>
					</c:when>
					<c:otherwise>
						<div style="padding: 120px 0 120px 0;">
							<div class="col-md-auto">
								<p class="h3 text-center">구매한 상품이 존재하지 않습니다.</p>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</form>
		</div>
	</div>
</section>


<%@ include file="../includes/footer.jsp"%>