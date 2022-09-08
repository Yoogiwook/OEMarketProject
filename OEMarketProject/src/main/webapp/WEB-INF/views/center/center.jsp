<%@	page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>고객센터</title>
</head>
<%@ include file="../includes/center_header.jsp" %>
<section id="centerMainpage">
	<div class="container center__header__bottom">
		<p class="h6"><strong title="공지사항 목록으로" onclick="document.getElementById('goToNoticeList').submit();">공지사항&nbsp;&nbsp;<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#559977" class="bi bi-megaphone-fill" viewBox="0 0 20 20">
		<path d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-11zm-1 .724c-2.067.95-4.539 1.481-7 1.656v6.237a25.222 25.222 0 0 1 1.088.085c2.053.204 4.038.668 5.912 1.56V3.224zm-8 7.841V4.934c-.68.027-1.399.043-2.008.053A2.02 2.02 0 0 0 0 7v2c0 1.106.896 1.996 1.994 2.009a68.14 68.14 0 0 1 .496.008 64 64 0 0 1 1.51.048zm1.39 1.081c.285.021.569.047.85.078l.253 1.69a1 1 0 0 1-.983 1.187h-.548a1 1 0 0 1-.916-.599l-1.314-2.48a65.81 65.81 0 0 1 1.692.064c.327.017.65.037.966.06z"/>
		</svg></strong>&nbsp;&nbsp;|&nbsp;&nbsp;<c:choose>
		<c:when test="${login.us_id != null }"><a href='/center/noticeDetails?us_id=<c:out value="${login.us_id }"/>&no_num=<c:out value="${noticeCenter.no_num }"/>'
		 ><c:out value="${noticeCenter.no_title }" /></a></c:when>
		<c:otherwise><a href='/center/noticeDetails?no_num=<c:out value="${noticeCenter.no_num }"/>'
		 ><c:out value="${noticeCenter.no_title }" /></a></c:otherwise>
		</c:choose></p>
	</div>
	<div style="border-bottom: 1px solid #999;"></div>
	<div class="container center__body">
		<div>
			<p class="h4"><strong>자주 하는 질문</strong></p>
			<p class="h6 center__body__explanation">오이마켓의 이용자분들께 가장 많이 받은 질문을 통해 만들어진 도움말입니다.</p>
		</div>
		<table class="table table-bordered table-secondary table-hover">
			<thead>
				<tr>
					<th class="center__thead column__width__160" scope="col">조회수</th>
					<th class="center__thead" scope="col">제목</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listCenter }" var="center">
					<tr>
						<td class="text-center"><c:out value="${center.no_readcount }" /></td>
						<td class="center__table__widecolumn"><c:choose>
						<c:when test="${login.us_id != null }"><a href='/center/FAQDetails?us_id=<c:out value="${login.us_id }"/>&no_num=<c:out value="${center.no_num }"/>'
						><c:out value="${center.no_title }" /></a></c:when>
						<c:otherwise><a href='/center/FAQDetails?no_num=<c:out value="${center.no_num }"/>'
						><c:out value="${center.no_title }" /></a></c:otherwise>
						</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div style="padding-top: 10px;">
			<p class="h6 text-right"><a class="center__hyperlink" onclick="document.getElementById('goToFAQList').submit();">+더보기</a></p>
		</div>
	</div>
	<div class="container center__body">
		<c:choose>
			<c:when test="${login.us_grade == 0 }">
				<div>
					<p class="h4"><strong>관리자 메뉴</strong></p>
				</div>
				<div class="container" style="padding-top: 15px; padding-bottom: 40px;">
					<div class="row card-group">
						<div class="card mb-3 card__admin" onclick="location.href='/center/QnA_admin'">
							<div class="card__imgArea"><img src="/resources/assets/images/center_QnA.png" class="card-img" alt="Q&A"></div>
							<div class="card-body"><h5 class="text-center card-title card__admin__title">1:1 문의 내역 확인</h5></div>
						</div>
						<div class="card mb-3 card__admin" onclick="location.href='/center/suggest'">
							<div class="card__imgArea"><img src="/resources/assets/images/center_suggest.png" class="card-img" alt="Suggest"></div>
							<div class="card-body"><h5 class="text-center card-title card__admin__title">오이마켓 건의함 확인</h5></div>
						</div>
						<div class="card mb-3 card__admin" onclick="location.href='/center/noticeInsert'">
							<div class="card__imgArea"><img src="/resources/assets/images/center_notice.png" class="card-img" alt="notice"></div>
							<div class="card-body"><h5 class="text-center card-title card__admin__title">새 공지 등록</h5></div>
						</div>
						<div class="card mb-3 card__admin" onclick="location.href='/center/FAQInsert'">
							<div class="card__imgArea"><img src="/resources/assets/images/center_FAQ.png" class="card-img" alt="FAQ"></div>
							<div class="card-body"><h5 class="text-center card-title card__admin__title">새 도움말 등록</h5></div>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<p class="h4"><strong>고객의 소리</strong></p>
				</div>
				<div class="container" style="padding-top: 15px;">
					<div class="row">
						<div class="col-6">
							<div class="card mb-3 card__user" title="1:1 문의 작성 페이지로" style="margin-left: -15px;">
								<div class="row no-gutters center-btn" data-oper="goQnAInsertBtn">
									<div class="col-md-4" style="padding: 30px 0 30px 30px;">
										<img src="/resources/assets/images/center_QnA.png" class="card-img" alt="Q&A">
									</div>
									<div class="col-md-8">
										<div class="card-body" style="padding: 30px;">
											<p class="h3 font-weight-bold card-title">1:1 문의하기</p>
											<p class="card-text">도움말로 문제를 해결하지 못하셨나요?<br>1:1 문의를 통해 회원님께서 얼마든지 질문을<br>
											 남겨주시면 저희 오이마켓이 맞춤 해결책을<br>제시해드리겠습니다.</p>
										</div>
									</div>
								</div>
							</div>
							<form role="form">
								<input type="hidden" name="us_id" value="<c:out value='${login.us_id}'/>">
								<input type="hidden" name="us_nickname" value="<c:out value='${login.us_nickname}'/>">
							</form>
							<div style="padding-top: 10px;" class="center-btn" data-oper="goQnABtn">
								<p class="h6 text-right"><a class="center__hyperlink" style="margin-right: 2px;">＞1:1 문의 내역 바로가기</a></p>
							</div>
						</div>
						<div class="col-6">
							<div class="card mb-3 card__user" title="건의 사항 작성 페이지로" style="margin-right: -15px;">
								<div class="row no-gutters center-btn" data-oper="goSuggestInsertBtn">
									<div class="col-md-4" style="padding: 20px 0 20px 20px;">
										<img src="/resources/assets/images/center_suggest.png" class="card-img" alt="Suggest">
									</div>
									<div class="col-md-8">
										<div class="card-body" style="padding: 30px;">
											<p class="h3 font-weight-bold card-title">건의하기</p>
											<p class="card-text">오이마켓을 이용하면서 불편하신 점이나<br>개선해야 할 점이 있다고 느끼셨나요?<br>
											 건의하기를 통해 자유롭게 의견을 들려주시면<br>최대한 반영하여 발전하도록 노력하겠습니다.</p>
										</div>
									</div>
								</div>
							</div>
							<div style="padding: 10px 0 40px 0;">
								<p class="h6 text-right"><a class="center__hyperlink" onclick="location.href='/center/suggest'" style="margin-right: -13px;">＞오이마켓 건의함 바로가기</a></p>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</section>

<script type="text/javascript">
	//폼 실행
	$(document).ready(function() {
		$('.center-btn').on("click",function(e) {
			e.preventDefault();
			
			var operation = $(this).data('oper');
			console.log(operation);
			
			var formObj = $("form");
			var us_IdTag = $("input[name='us_id']").val();
			var us_NicknameTag = $("input[name='us_nickname']").val();
			console.log(us_IdTag);
			
			if(us_IdTag === ''){
				alert('로그인이 필요한 서비스입니다.');
				$(location).attr("href","/login");
			}else{
				if(operation === 'goQnAInsertBtn'){
					$(location).attr("href","/center/QnAInsert");
				}else if(operation === 'goSuggestInsertBtn'){
					$(location).attr("href","/center/suggestInsert");
				}else if(operation === 'goQnABtn'){
					formObj.attr("action","/center/QnA").attr("method","get");
					formObj.submit();
				}
			}// else
		});//$('.card-body')
	});//
	
	//뒤로가기가 감지되면 현재 페이지 새로고침
	window.onpageshow = function(e) {
		if (e.persisted || (window.performance && window.performance.navigation.type == 2)) {
			location.reload();
		}
	}
</script>

<%@ include file="../includes/footer.jsp" %>