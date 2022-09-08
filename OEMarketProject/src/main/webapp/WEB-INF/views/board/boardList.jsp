<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../includes/header.jsp" %>

   <!-- 검색 바 -->
   <section id="boardListSearch">
    <div class="container">
    	<div class="row">
			<div class="col-lg-12 boardListSearch-align">
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
						
	                    <input type="text" class="search-input" placeholder="검색어를 입력하세요" value="${pageMaker.cri.keyword}" name="keyword" />
	                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"/>
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }"/>
	                    <button class="search-icon" title="검색하기"><i class="fa fa-search" aria-hidden="true"></i></button>
	                </form>
                </div>
            </div>
        </div>
    </div>
    <!-- //검색 바 -->
    </section>

    <!-- BoardList -->
    <section class="section" id="board_list">
        <div class="container">
            <div class="row">
                <div class="board_list_category">
                    <div class="col-lg-12">
                        <div class="inner-content">
                           <!-- 상품 정렬 버튼 -->
                           <c:choose>
                              <c:when test="${order=='regdate'}">
                                  <a id="heart" href="boardListOrderByHeart.do"> 인기 상품 순</a>
                                  <a id="regdate" href="boardListOrderByRegdate.do?align=regdate" ><i class="fa fa-check"></i> 최신 등록 순</a>
                                  <a id="lowPrice" href="boardListOrderByLowPrice.do?align=lowPrice"> 낮은 가격 순</a>
                                  <a id="highPrice" href="boardListOrderByHighPrice.do?align=highPrice"> 높은 가격 순</a>
                                  <a id="align_category" href="boardListOrderByHighPrice.do?align=align_category"> 카테고리 별 보기</a>
                              </c:when>
                              <c:when test="${order=='lowPrice'}">
                                  <a id="heart" href="boardListOrderByHeart.do"> 인기 상품 순</a>
                                  <a id="regdate" href="boardListOrderByRegdate.do?align=regdate" > 최신 등록 순</a>
                                  <a id="lowPrice" href="boardListOrderByLowPrice.do?align=lowPrice"><i class="fa fa-check"></i> 낮은 가격 순</a>
                                  <a id="highPrice" href="boardListOrderByHighPrice.do?align=highPrice"> 높은 가격 순</a>
                                  <a id="align_category" href="boardListOrderByHighPrice.do?align=align_category"> 카테고리 별 보기</a>
                              </c:when>
                              <c:when test="${order=='highPrice'}">
                                  <a id="heart" href="boardListOrderByHeart.do"> 인기 상품 순</a>
                                  <a id="regdate" href="boardListOrderByRegdate.do?align=regdate" > 최신 등록 순</a>
                                  <a id="lowPrice" href="boardListOrderByLowPrice.do?align=lowPrice"> 낮은 가격 순</a>
                                  <a id="highPrice" href="boardListOrderByHighPrice.do?align=highPrice"><i class="fa fa-check"></i> 높은 가격 순</a>
                              	  <a id="align_category" href="boardListOrderByHighPrice.do?align=align_category"> 카테고리 별 보기</a>
                              </c:when>
                              <c:when test="${order=='align_category'}">
                                  <a id="heart" href="boardListOrderByHeart.do"> 인기 상품 순</a>
                                  <a id="regdate" href="boardListOrderByRegdate.do?align=regdate" > 최신 등록 순</a>
                                  <a id="lowPrice" href="boardListOrderByLowPrice.do?align=lowPrice"> 낮은 가격 순</a>
                                  <a id="highPrice" href="boardListOrderByHighPrice.do?align=highPrice"> 높은 가격 순</a>
                              	  <a id="align_category" href="boardListOrderByHighPrice.do?align=align_category"><i class="fa fa-check"></i> 카테고리 별 보기</a>
                              </c:when>
                              <c:otherwise>
                                  <a id="heart" href="boardListOrderByHeart.do"><i class="fa fa-check"></i> 인기 상품 순</a>
                                  <a id="regdate" href="boardListOrderByRegdate.do?align=regdate" > 최신 등록 순</a>
                                  <a id="lowPrice" href="boardListOrderByLowPrice.do?align=lowPrice"> 낮은 가격 순</a>
                                  <a id="highPrice" href="boardListOrderByHighPrice.do?align=highPrice"> 높은 가격 순</a>
                                  <a id="align_category" href="boardListOrderByHighPrice.do?align=align_category"> 카테고리 별 보기</a>
                              </c:otherwise>
                           </c:choose>
                           <!-- //상품 정렬 버튼 -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
	                
        <!-- 카테고리 -->
        <c:choose>
        	<c:when test="${order=='align_category'}">
			    <div class="container">
			        <div class="row">
			
			            <div class="col-lg-12">
				            <form id="categoryForm" action="/board/categoryBook" method="get">
		                    	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"/>
								<input type="hidden" name="amount" value="${pageMaker.cri.amount }"/>
								<input type="hidden" name="type" value="${pageMaker.cri.type}"/>
								<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"/>
				                
				                <table class="category_tb">
				                    <tr>
				                        <td><a class="book">도서/티켓/문구</a></td>
				                        <td><a class="music">음반/악기</a></td>
				                        <td><a class="art">예술/희귀/수집품</a></td>
				                        <td><a class="woman">여성의류</a></td>
				                        <td><a class="man">남성의류</a></td>
				                    </tr>
				
				                    <tr>
				                        <td><a class="shoes">신발</a></td>
				                        <td><a class="bag">가방</a></td>
				                        <td><a class="watch">시계</a></td>
				                        <td><a class="jewelry">쥬얼리</a></td>
				                        <td><a class="funiture">가구/인테리어</a></td>
				                    </tr>
				
				                    <tr>
				                        <td><a class="car">차량/오토바이</a></td>
				                        <td><a class="kidult">키덜트</a></td>
				                        <td><a class="food">생활/가공식품</a></td>
				                        <td><a class="pet">반려동물용품</a></td>
				                        <td><a class="etc">기타</a></td>
				                    </tr>
				                </table>
			                </form>
			            </div>
			        </div>
			    </div>
		    </c:when>
     </c:choose>
			    <!-- //카테고리 -->

	
	        <div class="container board-list-margintop">
	            <div class="row">
	                <div class="col-lg-6">
	                    <div class="section-heading">
	                       <c:choose>
	                           <c:when test="${order=='regdate'}">
	                                <h2>최신 등록 순</h2>
	                           </c:when>
	                           <c:when test="${order=='lowPrice'}">
	                                <h2>낮은 가격 순</h2>
	                           </c:when>
	                           <c:when test="${order=='highPrice'}">
	                                <h2>높은 가격 순</h2>
	                           </c:when>
	                           <c:when test="${order=='align_category'}">
	                                <h2>카테고리 별 보기</h2>
	                           </c:when>
	                            <c:otherwise>
	                               <h2>인기 상품 순</h2>
	                            </c:otherwise>
	                          </c:choose>
	                    </div>
	                </div>
	                <div class="col-lg-6 plus">
	                    <a href="boardInsert.do" class="plus-button" id="test" onclick="test('${login.us_id}')"><i class="fa fa-plus"></i>&nbsp;&nbsp; 새 글</a>
	                </div>
	            </div>
	        </div>
      
        <div class="container">
            <div class="row">
                <c:choose>
                	<c:when test="${fn:length(mb_list) > 0}">
                
		                <!-- 인기 게시글 -->
		                <c:forEach items="${mb_list}" var="mb_board">
		                <div class="col-lg-4">
		                    <div class="item">
		                        <div class="thumb">
		                            <div class="hover-content">
		                            	<a class="move" href='<c:out value="${mb_board.bo_num}"/>'><img src="/resources/assets/images/search-white.png" /></a>
		                            </div>
		                            
		                            <c:choose>
		                        <c:when test="${mb_board.bo_category != null}">
		                           <img src="<spring:url value='/img/${mb_board.bo_image1}'/>">
		                        </c:when>
		                        <c:otherwise>
		                           <img src="<c:out value="${mb_board.bo_image1}"/>">
		                        </c:otherwise>
		                     </c:choose>
		                        
		                        </div>
		                       <div class="down-content">
		                          <h4><c:out value="${mb_board.bo_title}"/></h4>
		                          <span><c:out value="${mb_board.bo_price}"/>원</span>
		                          <h5><c:out value="${mb_board.bo_address1}"/>&nbsp;<c:out value="${mb_board.bo_address2}"/></h5>
		                       </div>
		                    </div>
		                </div>
		                </c:forEach>
		                
		                <!-- pagination 페이징 -->
		                <div class="col-lg-12">
		                    <div class="pagination">
		                        <ul>
		                            <c:if test="${pageMaker.prev}">
		                      <li class="paginate_button previous"><a href="${pageMaker.startPage-1}"><i class="fa fa-chevron-left" aria-hidden="true"></i></a></li>
		                    </c:if>
		                    
		                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
		                      <li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" }">
		                         <a href="${num}">${num}</a>
		                      </li>
		                    </c:forEach>
		                    
		                    <c:if test="${pageMaker.next}">
		                      <li class="paginate_button next"><a href="${pageMaker.endPage+1}"><i class="fa fa-chevron-right" aria-hidden="true"></i></a></li>
		                    </c:if>
		                        </ul>
		                    </div>
		                </div>
		               
		                <form id="actionForm" action="/board/boardListOrderByHeart" method="get" >
		                   <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		                    <input type="hidden" name="type" value="${pageMaker.cri.type}">
		                    <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		                </form>
		                           
		                <!-- Modal 창 추가 -->
		                <div id="myModal" class="modal" tabindex="-1" role="dialog">
			              <div class="modal-dialog" role="document">
			                <div class="modal-content">
			                  <div class="modal-header">
			                    <h5 class="modal-title">알림</h5>
			                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                      <span aria-hidden="true">&times;</span>
			                    </button>
			                  </div>
			                  <div class="modal-body">
			                    <c:if test="${result == '등록'}">
				                    게시물이 성공적으로 등록되었습니다.
			                    </c:if>
			                    <c:if test="${result == '수정'}">
				                    게시물이 성공적으로 수정되었습니다.
			                    </c:if>
			                    <c:if test="${result == '삭제'}">
				                    게시물이 성공적으로 삭제되었습니다.
			                    </c:if>
			                  </div>
			                  <div class="modal-footer">
			                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			                  </div>
			                </div>
			              </div>
			            </div>
		               <!-- //Modal 창 추가 -->
	               </c:when>
	               
	               <c:otherwise>
					<div class="container" id="boardList__nothing">
						<div class="row justify-content-md-center">
							<div class="col-md-auto">
								<p class="h3 text-center">검색한 상품이 존재하지 않습니다.</p>
							</div>
						</div>
					</div>
				</c:otherwise>
				</c:choose>
            </div>
        </div>
    </section>
    <!--// BoardList -->
    
    <%@ include file="../includes/footer.jsp" %>

<script>
    /* 새 글 등록 클릭 시 회원/비회원 구분 스크립트 */
	function test(us_id){
	   if(us_id != "") {
	      return true;
	   }else{
	      alert("로그인이 필요한 서비스입니다.")
	      $("#test").attr("href","${contextPath}/login.do");
	      $("#new #test").attr("href", "${contextPath}/login.do");
	   }
	}
    
    /* ================================================================================== */
   // 새로고침해서 등록이 계속 되는것을 방지
   $(document).ready(function() {

      var result = '<c:out value="${result}"/>';
      console.log("result" + result);
      
      checkModal(result);
      
      //뒤로가기 모달창 문제 해결
      history.replaceState({},null,null);
      
      function checkModal(result){
         if(result === '' || history.state){
            return;
         }
         
         if(parseInt(result) > 0){
            $(".modal-body").html("게시글" + parseInt(result) + "번이 등록됐습니다.");
         }
         
         $("#myModal").modal("show");
      }
      
      $("#regBtn").on("click", function(){
         self.location = "/board/boardRegister";
      });
      
      // <<,>> 페이지 값 넘기기 처리 ============================================================================================
      
      var actionForm = $("#actionForm");
      var order = '<c:out value="${order}"/>';
      var align = '<input type="hidden" value="<c:out value="${order}"/>" name="align">';
	 
      $(".paginate_button a").on("click", function(e){
	     	 e.preventDefault();
	     	 actionForm.find("input[name='bo_num']").remove();
	     	 actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	     	 actionForm.attr("action","/board/boardListOrderByHeart");
	     	 actionForm.submit();
	       });
     
      if(order ===  "regdate") {
   	   $(".paginate_button a").on("click", function(e){
   	   	  e.preventDefault();
   	      actionForm.find("input[name='bo_num']").remove();
   	      actionForm.find("input[name='pageNum']").val($(this).attr("href"));
   	      actionForm.append(align);
   	      actionForm.attr("action","/board/boardListOrderByRegdate");
   	      actionForm.submit();
   	   });
     } if(order ===  "lowPrice") {
    	   $(".paginate_button a").on("click", function(e){
    	   	  e.preventDefault();
    	      actionForm.find("input[name='bo_num']").remove();
    	      actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    	      actionForm.append(align);
    	      actionForm.attr("action","/board/boardListOrderByLowPrice");
    	      actionForm.submit();
    	   });
      } if(order ===  "highPrice") {
   	   $(".paginate_button a").on("click", function(e){
 	   	  e.preventDefault();
 	      actionForm.find("input[name='pageNum']").val($(this).attr("href"));
 	      actionForm.append(align);
 	      actionForm.attr("action","/board/boardListOrderByHighPrice");
 	      actionForm.submit();
 	   });
   }
      
      // <<,>> 페이지 값 넘기기 처리 끝============================================================================================

    	// boardList 게시글 눈 모양 눌렀을 때 상세보기로 이동
    	  $(".move").on("click",function(e){
    	  e.preventDefault();
    	  
       	  actionForm.find("input[name='bo_num']").remove();
       	  actionForm.find("input[name='align']").remove();
          actionForm.find("input[name='bo_id']").remove();
       	  
    	  actionForm.append("<input type = 'hidden' name = 'bo_num' value='"+$(this).attr("href")+"'>");
    	  
    	  var bo_id = '<input type="hidden" name="bo_id" value="<c:out value="${login.us_id}"/>" >'; 
    	  actionForm.append(bo_id); 
    	  
    	  var align = '<input type="hidden" value="<c:out value="${order}"/>" name="align">';
    	  actionForm.append(align);
    	  
    	  actionForm.attr("action","/board/boardDetail");
      	  actionForm.submit();
      });
      
      
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
   
      // 0815 카테고리 색상 토글
      var keyword = '<c:out value="${pageMaker.cri.keyword}"/>';
      if(keyword === "도서/티켓/문구"){
    	  $("#categoryForm a.book").toggleClass("active");
      }
      if(keyword === "음반/악기"){
    	  $("#categoryForm a.music").toggleClass("active");
      }
      if(keyword === "예술/수집품"){
    	  $("#categoryForm a.art").toggleClass("active");
      }
      if(keyword === "여성의류"){
    	  $("#categoryForm a.woman").toggleClass("active");
      }
      if(keyword === "남성의류"){
    	  $("#categoryForm a.man").toggleClass("active");
      }
      if(keyword === "신발"){
    	  $("#categoryForm a.shoes").toggleClass("active");
      }
      if(keyword === "가방"){
    	  $("#categoryForm a.bag").toggleClass("active");
      }
      if(keyword === "시계"){
    	  $("#categoryForm a.watch").toggleClass("active");
      }
      if(keyword === "쥬얼리"){
    	  $("#categoryForm a.jewelry").toggleClass("active");
      }
      if(keyword === "가구/인테리어"){
    	  $("#categoryForm a.funiture").toggleClass("active");
      }
      if(keyword === "차량/오토바이"){
    	  $("#categoryForm a.car").toggleClass("active");
      }
      if(keyword === "키덜트"){
    	  $("#categoryForm a.kidult").toggleClass("active");
      }
      if(keyword === "생활용품"){
    	  $("#categoryForm a.food").toggleClass("active");
      }
      if(keyword === "반려동물용품"){
    	  $("#categoryForm a.pet").toggleClass("active");
      }
      if(keyword === "기타"){
    	  $("#categoryForm a.etc").toggleClass("active");
      }
      
      // 0815 카테고리 페이징 처리
      var categoryForm = $("#categoryForm");
      var order = '<c:out value="${order}"/>';
      var align = '<input type="hidden" value="<c:out value="${order}"/>" name="align">';
    	  
   	  categoryForm.find("input[name='type']").val("G");
      categoryForm.append(align);
      
   	  $("#categoryForm a.book").on("click",function(e) {
    	  e.preventDefault();
    	  
    	  categoryForm.find("input[name='keyword']").val("도서/티켓/문구");
    	  categoryForm.submit();
      });
   	  
	  $("#categoryForm a.music").on("click",function(e) {
	  	  e.preventDefault();
	  	  
	  	  categoryForm.find("input[name='keyword']").val("음반/악기");
	  	  categoryForm.attr("action","/board/categoryMusic");
	  	categoryForm.submit();
	  });
	  
	  $("#categoryForm a.art").on("click",function(e) {
	  	  e.preventDefault();
	  	  
	  	  categoryForm.find("input[name='keyword']").val("예술/수집품");
	  	  categoryForm.attr("action","/board/categoryArt");
	  	categoryForm.submit();
	  });
	  
	  $("#categoryForm a.woman").on("click",function(e) {
	  	  e.preventDefault();
	  	  
	  	  categoryForm.find("input[name='keyword']").val("여성의류");
	  	  categoryForm.attr("action","/board/categoryWoman");
	  	categoryForm.submit();
	  });
	  
	  $("#categoryForm a.man").on("click",function(e) {
	  	  e.preventDefault();
	  	  
	  	  categoryForm.find("input[name='keyword']").val("남성의류");
	  	  categoryForm.attr("action","/board/categoryMan");
	  	categoryForm.submit();
	  });
	  
	  $("#categoryForm a.shoes").on("click",function(e) {
	  	  e.preventDefault();
	  	  
	  	  categoryForm.find("input[name='keyword']").val("신발");
	  	  categoryForm.attr("action","/board/categoryShoes");
	  	categoryForm.submit();
	  });
	  
	  $("#categoryForm a.bag").on("click",function(e) {
	  	  e.preventDefault();
	  	  
	  	  categoryForm.find("input[name='keyword']").val("가방");
	  	  categoryForm.attr("action","/board/categoryBag");
	  	categoryForm.submit();
	  });
	  
	  $("#categoryForm a.watch").on("click",function(e) {
	  	  e.preventDefault();
	  	  
	  	  categoryForm.find("input[name='keyword']").val("시계");
	  	  categoryForm.attr("action","/board/categoryWatch");
	  	categoryForm.submit();
	  });
	  
	  $("#categoryForm a.jewelry").on("click",function(e) {
	  	  e.preventDefault();
	  	  
	  	  categoryForm.find("input[name='keyword']").val("쥬얼리");
	  	  categoryForm.attr("action","/board/categoryJewelry");
	  	categoryForm.submit();
	  });
	  
	  $("#categoryForm a.funiture").on("click",function(e) {
	  	  e.preventDefault();
	  	  
	  	  categoryForm.find("input[name='keyword']").val("가구/인테리어");
	  	  categoryForm.attr("action","/board/categoryFuniture");
	  	categoryForm.submit();
	  });
	  
	  $("#categoryForm a.car").on("click",function(e) {
	  	  e.preventDefault();
	  	  
	  	  categoryForm.find("input[name='keyword']").val("차량/오토바이");
	  	  categoryForm.attr("action","/board/categoryCar");
	  	categoryForm.submit();
	  });
	  
	  $("#categoryForm a.kidult").on("click",function(e) {
	  	  e.preventDefault();
	  	  
	  	  categoryForm.find("input[name='keyword']").val("키덜트");
	  	  categoryForm.attr("action","/board/categoryKidult");
	  	categoryForm.submit();
	  });
	  
	  $("#categoryForm a.food").on("click",function(e) {
	  	  e.preventDefault();
	  	  
	  	  categoryForm.find("input[name='keyword']").val("생활용품");
	  	  categoryForm.attr("action","/board/categoryFood");
	  	categoryForm.submit();
	  });
	  
	  $("#categoryForm a.pet").on("click",function(e) {
	  	  e.preventDefault();
	  	  
	  	  categoryForm.find("input[name='keyword']").val("반려동물용품");
	  	  categoryForm.attr("action","/board/categoryPet");
	  	  categoryForm.submit();
	  });
	  
	  $("#categoryForm a.etc").on("click",function(e) {
	  	  e.preventDefault();
	  	  
	  	  categoryForm.find("input[name='keyword']").val("기타");
	  	  categoryForm.attr("action","/board/categoryEtc");
		  categoryForm.submit();
	  });
	  
	  
      
      
      // //0815 카테고리 페이징 처리
      
    	  
   });//end
    
   </script>
    