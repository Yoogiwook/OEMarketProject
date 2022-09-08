<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<%@ include file="../includes/header.jsp"%>
<style>
table{width:100%;}
</style>

<!-- UserList -->

<div class="container">
   <div class="row">
      <div class="admin_user_list">
         <div class="col-lg-12">
            <h6>
               <B>회원 댓글</B>
            </h6>
            <div class="inner-content">
                  <table>
                        <tr>
                           <th>아이디</th>
                           <th>게시글 번호</th>
                           <th>내용</th>
                           <th>작성자</th>
                           <th>작성 일</th>
                           <th>수정 일</th>
                           <th>&nbsp;&nbsp;</th>
                        </tr>
                        <c:forEach items="${ad_replyList}" var="user" >
                                  
                           <tr>
                              <td>
                                 <a href="#" value="${user.re_id}" class="Id" id="${user.re_id}" onclick="userInfo_click(this.id)">
                                 <c:out value="${user.re_id}" /></a>
                              </td>
                              <td>
                                 <a href="${contextPath }/board/boardDetail?bo_num='${user.bo_num}'&align=&bo_id='${user.re_id}'" value="${user.bo_num}" class="Title" >
                                 <c:out value="${user.bo_num}" /></a>
                              </td>
                              <td>
                                 <c:out value="${user.re_reply}" />
                              </td>
                              <td>
                                 <c:out value="${user.re_name}" />
                              </td>
                              <c:set var="regdate" value="${user.re_regdate}"></c:set>
                              <td>
                                 <fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${regdate}" />
                              </td>
                              <c:set var="updatedate" value="${user.re_updateDate}"></c:set>
                              <td>
                                 <fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${updatedate}" />
                              </td>
                                 <td>
                                      <input type="hidden" value="${user.re_id}" name="us_id1">
                                       <button type="button" value="${user.re_num}" class="btn btn-danger center__tinybutton"
                                          id="${user.re_num}" onclick="delete_click(this.id)"> 삭제</button>
                                   </td>
                              </tr>
                        </c:forEach>
                           <form id="goAdmin"><input type="hidden" name="re_num" id="re_num" value=""></form>
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
                  </table>
            </div>
         </div>
      </div>
   </div>
</div>




<%@ include file="../includes/footer.jsp"%>

<script>
   function delete_click(re_num){
      var formObj = $("#goAdmin"); 
      var modal = $("#myModal"); 
      var re_NumTag = $("input[name='re_num']").attr('value', re_num);
      var us_IdTag = $("input[name='us_id1']");
      
   console.log(re_num);
   modal.find("p").text("댓글을 삭제 하시겠습니까?");
   $("#myModal").modal("show");
   $("#modal-ok-btn").on('click',function(){ 
         $("#myModal").modal("hide");
         formObj.attr("action","/admin/deleteUserReply").attr("method","post");
         formObj.empty();
         formObj.append(re_NumTag); 
         formObj.append(us_IdTag); 
         formObj.submit();
         alert("삭제되었습니다."); 
      }); 
   };

</script>