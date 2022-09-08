<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="moveTopBtn" title="상단으로"><i class="fa fa-arrow-up" aria-hidden="true"></i></div>
    
<!--footer-->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="first-item">
                        <div class="logo">
                            <h2>오이마켓</h2>
                        </div>
                        <ul>
                            <li><a href="#">경기 수원시 팔달구 덕영대로 방탄오이단 (오이서비스)</a></li>
                            <li><a href="#">사업자 등록번호 : 52-52-525252</a></li>
                            <li><a href="#">010-123-4567</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-3">
                    <ul>
                        <li><a href="#">자주 묻는 질문</a></li>
                        <li><a href="#">믿을 수 있는 중고거래</a></li>
                        <li><a href="#">광고주센터</a></li>
                    </ul>
                </div>

                <div class="col-lg-2">
                    <ul>
                        <li><a href="#">회사 소개</a></li>
                        <li><a href="#">동네 가게</a></li>
                        <li><a href="#">채용</a></li>
                    </ul>
                </div>

                <div class="col-lg-3">
                    <ul>
                        <li><a href="#">이용약관</a></li>
                        <li><a href="#">개인정보처리방침</a></li>
                        <li><a href="#">위치기반서비스 이용약관</a></li>
                    </ul>
                </div>

                <div class="col-lg-12">
                    <div class="under-footer">
                        <p>Copyright © 2022 52CucumberMarket Co., All Rights Reserved. 
                        <ul>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-behance"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--// footer-->


	<script src="/resources/assets/js/admin.js"></script>
    <!-- jQuery -->
    <script src="/resources/assets/js/jquery.min.js"></script>
    
	<!-- Popper -->
    <script src="/resources/assets/js/popper.min.js"></script>
    <!-- Bootstrap -->
    <script src="/resources/assets/js/bootstrap0819.min.js"></script>

    <!-- Plugins -->
    <script src="/resources/assets/js/owl-carousel.js"></script>
    <script src="/resources/assets/js/slick.js"></script>

    <!-- custom -->
    <script src="/resources/assets/js/custom.js"></script>
    
    <!-- Script -->
    <script>
    /* header의 카테고리 */
	$('.custom-dropdown').on('show.bs.dropdown', function() {
	   var that = $(this);
	  setTimeout(function(){
		  that.find('.dropdown-menu').addClass('active');
	  }, 100);
	  
  
	});
	$('.custom-dropdown').on('hide.bs.dropdown', function() {
	  $(this).find('.dropdown-menu').removeClass('active');
	});
	/* //header의 카테고리 */
    </script>
    
    <script>
     const $topBtn = document.querySelector(".moveTopBtn");

    // 버튼 클릭 시 맨 위로 이동
    $topBtn.onclick = () => {
      window.scrollTo({ top: 0, behavior: "smooth" });  
    }
    </script>

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

      var order = '<c:out value="${result}"/>';
      console.log("result" + result);
      
      checkModal(result);
      
      //뒤로가기 모달창 문제 해결
      history.replaceState({},null,null);
      
      function checkModal(result){
         if(result === '' || history.state){
            return ;
         }
         
         if(parseInt(result) > 0){
            $(".modal-body").html("게시글" + parseInt(result) + "번이 등록됐습니다.");
         }
         
         $("#myModal").modal("show");
      }
      
      /* $("#regBtn").on("click", function(){
         self.location = "/board/boardRegister";
      }); */
      
// <<,>> 페이지 값 넘기기 처리 ============================================================================================
      
      var actionForm = $("#actionForm");
      var order = '<c:out value="${order}"/>';
      var align = '<input type="text" value="<c:out value="${order}"/>" name="align">';
    
      $(".paginate_button a").on("click", function(e){
            e.preventDefault();
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
          });
     
      if(order ===  "regdate") {
         $(".paginate_button a").on("click", function(e){
              e.preventDefault();
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.append(align);
            actionForm.attr("action","/board/boardListOrderByRegdate");
            actionForm.submit();
         });
     } if(order ===  "lowPrice") {
          $(".paginate_button a").on("click", function(e){
               e.preventDefault();
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
      
         
 // 검색처리 =============================================================================================================
      
      var searchForm = $("#searchForm");
      var order = '<c:out value="${order}"/>';
      var align = '<input type="text" value="<c:out value="${order}"/>" name="align">';
      
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
      }if(order ===  "regdate") {
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
   
        
     
/*===========================*/
        
/*===========================*/
      
      
     }); // end for $(document)
     </script>
     
        

</body>
</html>