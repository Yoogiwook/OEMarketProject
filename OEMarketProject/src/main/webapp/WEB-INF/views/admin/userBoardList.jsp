<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<%@ include file="../includes/header.jsp"%>


<!-- UserList -->

<div class="container">
   <div class="row">
      <div class="admin_board_list">
         <div class="col-lg-12">
            <h6>
               <B>회원 게시글</B>
            </h6>
            <div class="inner-content">
                  <table>
                     <thead class="admin_head">
                        <tr>
                           <th>아이디</th>
                           <th>제목</th>
                           <th>작성자</th>
                           <th>내용</th>
                           <th>카테고리</th>
                           <th>작성 일</th>
                           <th>수정 일</th>
                           <th>&nbsp;&nbsp;</th>
                        </tr>
                     </thead>
                     <tbody class="admin_body">
                        <c:forEach items="${ad_boardList}" var="board" >
                           <tr>
                              <td>
                                 <a href="#" value="${board.bo_id}" class="Id" id="${board.bo_id}" onclick="userInfo_click(this.id)">
                                 <c:out value="${board.bo_id}" /></a>
                              </td>
                              <td>
                                 <a href="${contextPath }/board/boardDetail?bo_num='${board.bo_num}'&align=&bo_id='${board.bo_id}'" value="${board.bo_title}" class="Title" >
                                 <c:out value="${board.bo_title}" /></a>
                              </td>
                              <td>
                                 <c:out value="${board.bo_nickname}" />
                              </td>
                              <td>
                                 <c:out value="${board.bo_content}" />
                              </td>
                              <td>
                                 <c:out value="${board.bo_category}" />
                              </td>
                              <c:set var="regdate" value="${board.bo_regdate}"></c:set>
                              <td>
                                 <fmt:formatDate pattern="yyyy년 MM월 mm일" value="${regdate}" />
                              </td>
                              <c:set var="updatedate" value="${board.bo_updatedate}"></c:set>
                              <td>
                                 <fmt:formatDate pattern="yyyy년 MM월 mm일"  value="${updatedate}" />
                              </td>
                              <c:choose>
                                   <c:when test="${board.bo_grade == 0}">
                                      <td>블라인드 처리된 게시글입니다</td>
                                   </c:when>
                                   <c:when test="${board.bo_grade == 1}">
                                    <td>
                                       <button value="${board.bo_num}" class="btn btn-danger center__tinybutton"
                                          id="${board.bo_num}" onclick="blind_click(this.id)"> 블라인드 처리</button>
                                      </td>
                                   </c:when>
                               </c:choose>
                           </tr>
                        </c:forEach>
                           <form id="goAdmin"><input type="hidden" name="bo_num" id="bo_num" value=""></form>
                        <div id="myModal" class="modal fade" role="dialog" tabindex="-1">
                           <div class="modal-dialog">
                              <div class="modal-content">
                                 <div class="modal-header">
                                    <h5 class="modal-title">
                                       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
                                          <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
                                       </svg>
                                       &nbsp;알림
                                    </h5>
                                    <button type="button" class="close" data-dismiss="modal"   aria-label="Close">
                                       <span aria-hidden="true">&times;</span>
                                    </button>
                                 </div>
                                 <div class="modal-body text-center"><p></p> </div>
                                 <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                    <button type="button" class="btn btn-primary modal-btn" id="modal-ok-btn">확인</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </tbody>
                  </table>
            </div>
         </div>
      </div>
   </div>
</div>




<%@ include file="../includes/footer.jsp"%>

<script>
function blind_click(bo_num){
   var formObj = $("#goAdmin"); 
   var modal = $("#myModal"); 
   var bo_NumTag = $("input[name='bo_num']").val(bo_num);
   console.log(bo_NumTag);
modal.find("p").text("게시글을 차단 하시겠습니까?");
$("#myModal").modal("show");
$("#modal-ok-btn").on('click',function(){ 
   $("#myModal").modal("hide");
formObj.attr("action","/admin/userBoardBlind").attr("method","post");
formObj.empty();
formObj.append(bo_NumTag); 
formObj.submit();
alert("차단되었습니다."); 
}); 
};

</script>