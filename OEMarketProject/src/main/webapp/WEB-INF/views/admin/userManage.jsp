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
            <div class="inner-content">

                  <table>
                        <tr>
                           <th class="admin_th">아이디</th>
                           <th class="admin_th">닉네임</th>
                           <th class="admin_th">&nbsp;이름&nbsp;</th>
                           <th class="admin_th">가입일</th>
                           <th class="admin_th">게시글 수</th>
                           <th class="admin_th">댓글 수</th>
                           <th class="admin_th">&nbsp;&nbsp;</th>
                        </tr>
                        <c:forEach items="${ad_user}" var="user" varStatus="st">
                           <tr>
                              <td>
                                 <a href="#" value="${user.us_id}" class="UserInfo" id="${user.us_id}" onclick="userInfo_click(this.id)">
                                 <c:out value="${user.us_id}" /></a>
                              </td>
                              <td>
                                 <a href="${contextPath }/mypage/mypage?my_id='${user.us_id }'">
                                 <c:out value="${user.us_nickname}" /></a>
                              </td>
                              <td>
                                 <span><c:out value="${user.us_name}" /></span>
                              </td>
                              <c:set var="joindate" value="${user.us_joindate }"></c:set>
                              <td>
                                 <span><fmt:formatDate pattern="yyyy년 MM월 mm일"  value="${joindate}" /></span>
                              </td>
                              <td class = "count">
                                 <a href="#" value="${user.us_id}" class="UserBoard" id="${user.us_id}" onclick="userBoard_click(this.id)">
                                 <c:out value="${user.us_boardCnt}" /></a> 
                              </td>
                              <td class = "count">
                                 <a href="#" value="${user.us_id}" class="UserIReply" id="${user.us_id}" onclick="userReply_click(this.id)">
                                  <c:out value="${user.us_replyCnt}" /></a>
                              </td>
                               <c:choose>
                                   <c:when test="${user.us_userPass ==0}">
                                      <td>
                                    <button value="${user.us_id}" class="btn btn-danger center__tinybutton"
                                       id="${user.us_id}" onclick="delete_click(this.id)">회원 삭제</button>
                                    </td>
                                   </c:when>
                                   <c:when test="${user.us_userPass == 1 }">
                                       <td>탈퇴한 회원입니다</td>
                                   </c:when>
                                   <c:when test="${user.us_userPass == 2}">
                                       <td>관리자에 의해 삭제된 회원입니다</td><!-- modal 탈퇴 사유 보기 -->
                                   </c:when>
                               </c:choose>
                               </tr>
                        </c:forEach>
                        <form id="goAdmin">
                           <input type="hidden" name="us_id" id="us_id" value="">
                        </form>
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
	function delete_click(us_id) {
		var formObj = $("#goAdmin");
		var modal = $("#myModal");
		var us_IdTag = $("input[name='us_id']").attr('value', us_id);
		console.log(us_id);
		console.log("=====");
		console.log(us_IdTag);

		modal.find("p").text("게시글을 삭제하시겠습니까?");
		$("#myModal").modal("show");
		$("#modal-ok-btn").on('click', function() {
			$("#myModal").modal("hide");
			formObj.attr("action", "/admin/userDelete").attr("method", "post");
			formObj.empty();
			formObj.append(us_IdTag);
			formObj.submit();
			alert("삭제되었습니다.");

		});
	};
	function userInfo_click(us_id) {
		var formObj = $("#goAdmin");
		var us_IdTag = $("input[name='us_id']").attr('value', us_id);
		console.log(us_id);
		console.log("===");
		console.log(us_IdTag);
		formObj.attr("action", "/admin/adminUserInfo").attr("method", "get");
		formObj.empty();
		formObj.append(us_IdTag);
		formObj.submit();
	};
	function userBoard_click(us_id) {
		var formObj = $("#goAdmin");
		var us_IdTag = $("input[name='us_id']").attr('value', us_id);
		console.log(us_id);
		console.log("===");
		console.log(us_IdTag);
		formObj.attr("action", "/admin/adminUserBoard").attr("method", "get");
		formObj.empty();
		formObj.append(us_IdTag);
		formObj.submit();
	};
	function userReply_click(us_id) {
		var formObj = $("#goAdmin");
		var us_IdTag = $("input[name='us_id']").attr('value', us_id);
		console.log(us_id);
		console.log("===");
		console.log(us_IdTag);
		formObj.attr("action", "/admin/adminUserReply").attr("method", "get");
		formObj.empty();
		formObj.append(us_IdTag);
		formObj.submit();
	};
</script>