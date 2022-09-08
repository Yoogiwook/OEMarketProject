<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- Header Include -->
<%@ include file="includes/header.jsp"%>
	
	<!-- Banner -->
	<div class="main-banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="left-content">
						<div class="thumb">
							<div class="inner-content">
								<h3>
									우리 동네, <strong>오이마켓</strong>
								</h3>
								<span>중고 거래부터 동네 정보까지,이웃과 함께해요.<br> 가깝고 따뜻한 당신의 근처를
									만들어요.
								</span>
								<div class="main-border-button">
									<a href="#">오이마켓 보기</a>
								</div>
							</div>
							<img src="/resources/assets/images/background.png">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--// Banner -->
	
	<!-- Board - popular -->
	<section class="section" id="popular">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section-heading">
						<h2>인기 상품 순 &nbsp;&nbsp;&nbsp;<a href="board/boardListOrderByHeart.do">더보기 > </a>
						</h2>
					</div>
				</div>
				<div class="col-lg-6">
					<a href="board/boardInsert.do" class="plus-button" id="test"
						onclick="test('${login.us_id}')"><i class="fa fa-plus"></i> 새 글</a>
				</div>
			</div>
		</div>
	
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="popular-item-carousel">
						<div class="owl-popular-item owl-carousel">
	
							<c:forEach items="${he_list}" var="he_list" begin="1" end="6" varStatus="status">
								<!-- 인기 게시글 01 -->
								<div class="item">
									<div class="thumb">
										<div class="hover-content">
											<a onclick="location.href='board/boardDetail?bo_num=${he_list.bo_num}&align=&bo_id=${login.us_id}'"><img src="/resources/assets/images/search-white.png" /></a>
										</div>
										
										<c:choose>
											<c:when test="${he_list.bo_category != null}">
												<img src="<spring:url value='/img/${he_list.bo_image1}'/>">
											</c:when>
											<c:otherwise>
												<img src="<c:out value="${he_list.bo_image1}"/>">
											</c:otherwise>
										</c:choose>
										
									</div>
	
									<div class="down-content">
										<h4>
											<c:out value="${he_list.bo_title}" />
										</h4>
										<span><c:out value="${he_list.bo_price}" />원</span>
										<h5>
											<c:out value="${he_list.bo_address1}" />
										</h5>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--// Board - popular -->
	
	<!-- Board - New -->
	<section class="section" id="new">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section-heading">
						<h2>
							최근 등록 순 &nbsp;&nbsp;&nbsp;<a
								href="board/boardListOrderByRegdate?align=regdate">더 보기 > </a>
						</h2>
					</div>
				</div>
				<div class="col-lg-6">
					<a href="board/boardInsert.do" class="plus-button" id="test"
						onclick="test('${login.us_id}')"><i class="fa fa-plus"></i> 새 글</a>
				</div>
			</div>
		</div>
	
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="new-item-carousel">
						<div class="owl-new-item owl-carousel">
	
	
							<!-- 새 게시글 01 -->
							<c:forEach items="${rg_list}" var="rg_list" begin="1" end="6"
								varStatus="status">
								<div class="item">
									<div class="thumb">
									
										<div class="hover-content">
											<a onclick="location.href='board/boardDetail?bo_num=${rg_list.bo_num}&align=regdate&bo_id=${login.us_id}&bo_nickname=${login.us_nickname}'"><img src="/resources/assets/images/search-white.png" /></a>
										</div>
										
										<c:choose>
											<c:when test="${rg_list.bo_category != null}">
												<img src="<spring:url value='/img/${rg_list.bo_image1}'/>">
											</c:when>
											<c:otherwise>
												<img src="<c:out value="${rg_list.bo_image1}"/>">
											</c:otherwise>
										</c:choose>
										
									</div>
	
									<!-- <img src="/resources/assets/images/board-05.jpg" alt="게시판 / 상품 등록 시 그림이 src에 올라가야한다."> -->
									<div class="down-content">
										<h4>
											<c:out value="${rg_list.bo_title}" />
										</h4>
										<span><c:out value="${rg_list.bo_price}" />원</span>
										<h5>
											<c:out value="${rg_list.bo_address1}" />
										</h5>
									</div>
								</div>
							</c:forEach>
	
	
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--// Board - New -->
	
	<!-- 검색 바 -->
	<div class="searchBar" id="searchBar">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h2>찾으시는 상품이 있으신가요?</h2>
				</div>
			</div>
		    <div class="row">
		        <div class="search-wrapper col-lg-12">
		            <div class="input-holder">
		                <form id="searchForm" action="/board/boardListOrderByHeart" method="get">
		                 <select name="type">
					<option value="" <c:out value="${pageMaker.cri.type==null? 'selected' : ''}"/>></option>
					<option value="T" <c:out value="${pageMaker.cri.type=='T'? 'selected' : ''}"/>>제목</option>
					<option value="C" <c:out value="${pageMaker.cri.type=='C'? 'selected' : ''}"/>>내용</option>
					<option value="W" <c:out value="${pageMaker.cri.type=='W'? 'selected' : ''}"/>>작성자</option>
					<option value="TC" <c:out value="${pageMaker.cri.type=='TC'? 'selected' : ''}"/>>제목+내용</option>
					<option value="TW" <c:out value="${pageMaker.cri.type=='TW'? 'selected' : ''}"/>>제목+작성자</option>
					<option value="TCW" <c:out value="${pageMaker.cri.type=='TCW'? 'selected' : ''}"/>>제목+내용+작성자</option>
				</select>
				
		                 <input type="text" class="search-input" placeholder="검색어를 입력하세요" name="keyword" />
		                 <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"/>
						 <input type="hidden" name="amount" value="${pageMaker.cri.amount }"/>
		                 <button class="search-icon" title="검색하기"><i class="fa fa-search" aria-hidden="true"></i></button>
		             </form>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
	<!-- //검색 바 -->
	
	
	
	<!-- Footer Include -->
	<%@ include file="includes/footer.jsp"%>
	
	
	<!-- Script -->
	<script>
		/* 새 글 등록 클릭 시 회원/비회원 구분 스크립트 */
		function test(us_id) {
			if (us_id != "") {
				return true;
			} else {
				alert("로그인이 필요한 서비스입니다.")
				$("#test").attr("href", "${contextPath}/login.do");
				$("#new #test").attr("href", "${contextPath}/login.do");
			}
		}
		
	</script>
	
	<script>
		$(document).ready(function() {
			// 검색처리 =============================================================================================================
		      
		      var searchForm = $("#searchForm");
		      var order = '<c:out value="${order}"/>';
		      var align = '<input type="hidden" value="<c:out value="${order}"/>" name="align">';
		      if(order === ""){
		    	  
		      $("#searchForm button").on("click",function(e) {
		    	  e.preventDefault();
		    	  
		    	  if(!searchForm.find("option:selected").val()){
		    		  alert("검색종류를 선택하세요.")
		    		  return false;
		    	  }
		    	  if(!searchForm.find("input[name='keyword']").val()){
		    		  alert("키워드를 입력하세요.")
		    		  return false;
		    	  }
		    	  searchForm.find("input[name='pageNum']").val(1);
		    	  searchForm.submit();
		      });
		      }
		      if(order ===  "regdate") {
		          $("#searchForm button").on("click",function(e) {
		        	  e.preventDefault();
		        	  
		        	  if(!searchForm.find("option:selected").val()){
		        		  alert("검색종류를 선택하세요.")
		        		  return false;
		        	  }
		        	  if(!searchForm.find("input[name='keyword']").val()){
		        		  alert("키워드를 입력하세요.")
		        		  return false;
		        	  }
		        	  searchForm.find("input[name='pageNum']").val(1);
		        	  searchForm.append(align);
		        	  searchForm.attr("action","/board/boardListOrderByRegdate");
		        	  searchForm.submit();
		      	   });
		        } if(order ===  "lowPrice") {
		        	$("#searchForm button").on("click",function(e) {
		          	  e.preventDefault();
		          	  
		          	  if(!searchForm.find("option:selected").val()){
		          		  alert("검색종류를 선택하세요.")
		          		  return false;
		          	  }
		          	  if(!searchForm.find("input[name='keyword']").val()){
		          		  alert("키워드를 입력하세요.")
		          		  return false;
		          	  }
		          	  searchForm.find("input[name='pageNum']").val(1);
		          	  searchForm.append(align);
		          	  searchForm.attr("action","/board/boardListOrderByLowPrice");
		          	  searchForm.submit();
		        	   });
		         } if(order ===  "highPrice") {
		         	$("#searchForm button").on("click",function(e) {
		            	  e.preventDefault();
		            	  
		            	  if(!searchForm.find("option:selected").val()){
		            		  alert("검색종류를 선택하세요.")
		            		  return false;
		            	  }
		            	  if(!searchForm.find("input[name='keyword']").val()){
		            		  alert("키워드를 입력하세요.")
		            		  return false;
		            	  }
		            	  searchForm.find("input[name='pageNum']").val(1);
		            	  searchForm.append(align);
		            	  searchForm.attr("action","/board/boardListOrderByHighPrice");
		            	  searchForm.submit();
		          	   });
		      }
		      // 검색처리 =============================================================================================================
		});
	</script>

