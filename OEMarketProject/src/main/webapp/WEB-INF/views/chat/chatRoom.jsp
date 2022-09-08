<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title><%=request.getParameter("my_nickname") %>님의 채팅목록</title>
<style>
#chatRoom{padding : 165px 0 45px 0; margin-bottom: -60px;}
#chatRoom_title{font-size: 45px; font-weight: bold; margin-bottom: 35px;}
#chatRoom_title_sub{font-size: 20px; margin-bottom: 35px;}
#chatRoom_main{max-width: 540px; min-height: 620px;}
#chatRoom_main #chatRoom_body{min-height: 620px;}
#chatRoom_table{margin: 15px 15px 15px 0;}
#chatRoom_table th{width: 1%; padding-bottom: 35px;}
#chatRoom_table .chatRoom_table_wideColumn{font-size: 20px; width:55%;}
.chatRoom_index{
	width: 45px; height: 45px; border-radius: 50%;
	margin-left: 15px; margin-top: -5px; padding-top:6px;
	background-color: #4e8e6e; color: white;
	font-size: 22.5px; font-family: 'Jua' !important;
}
#chatRoom_table button{margin-top: -2.5px; margin-right: 22.5px; float: right;}
#chatRoom_table button span{font-size: 95%;}
.chatRoom_table_hr{margin-top: -15px;}
.chatRoom_nothing{padding: 60px 0 6px 0;}
</style>
</head>
<%@ include file="../includes/header.jsp" %>
<section class="bg-light" id="chatRoom">
	<div class="container">
		<div class="row justify-content-md-center">
			<p id="chatRoom_title">채팅목록</p>
		</div>
		<div class="row justify-content-md-center">
			<p id="chatRoom_title_sub"><strong><%=request.getParameter("my_nickname") %></strong>님, 자유롭게 채팅을 시작해보세요!</p>
		</div>
	</div>
	<main role="main" class="container" id="chatRoom_main">
		<div class="my-3 p-3 bg-white rounded shadow-sm" id="chatRoom_body">
			<c:choose>
				<c:when test="${fn:length(room) > 0 }">
					<table class="table table-borderless" id="chatRoom_table">
						<tbody>
							<c:forEach items="${room }" var="room" varStatus="status">
								<tr>
									<th class="text-center"><div class="chatRoom_index"><span>${status.index + 1 }</span></div></th>
									<td class="chatRoom_table_wideColumn"><strong><c:out value="${room.cr_roomName}"/></strong></td>
									<td><button type="button" class="btn btn-secondary" onclick="location.href='/chat?us_id=${login.us_id }&cr_seller=${room.cr_seller}'"
									 style="border: 2.25px solid #AAA; border-radius: 12.5px;" title="채팅방으로 이동"><span>입장</span></button></td>
							      	<%-- <td><input type="hidden" name="cr_buyer" value="${room.cr_buyer }"></td>
							      	<td><input type="hidden" name="my_nickname" value="${login.us_nickname }"></td>
							      	<td><input type="hidden" name="cr_seller" value="${room.cr_roomName }"></td> --%>
								</tr>
								<tr><td colspan="3"><hr class="chatRoom_table_hr"></tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<p class="h5 text-center text-muted chatRoom_nothing"><strong><%=request.getParameter("my_nickname") %></strong>님은</p>
					<p class="h5 text-muted text-center">아직 채팅방을 개설하지 않았습니다.</p>
				</c:otherwise>
			</c:choose>
		</div>
	</main>
</section>
<script type="text/javascript">

//폼 실행
/* $(document).ready(function(){
   var formObj = $("form");
   
   $('button').on("click", function(e){
      e.preventDefault();
      
      var operation = $(this).data('oper');
      console.log(operation);
      
      if(operation === 'move'){
         formObj.attr("action","/room").attr("method","post");
         // var NicknameTag = $("input[name='my_nickname']").clone();
          //formObj.empty();
          //formObj.append(NicknameTag);
      }
      formObj.submit();
   });
    */
	//뒤로가기가 감지되면 현재 페이지 새로고침
	window.onpageshow = function(e) {
		if (e.persisted || (window.performance && window.performance.navigation.type == 2)) {
			location.reload();
		}
	}
   
   
//
});
</script>

<%@ include file="../includes/footer.jsp" %>