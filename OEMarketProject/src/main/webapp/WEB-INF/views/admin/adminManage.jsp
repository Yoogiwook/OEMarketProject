<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 가입 페이지</title>
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.css">
<link rel="stylesheet" href="/resources/assets/css/basic.css">
<link rel="stylesheet" href="/resources/assets/css/main.css">
</head>
<body>
<%@ include file="../includes/header.jsp"%>
<style>
table{width:100%;}
</style>

<!-- registerAdmin -->

<section class="insert-section">
<!-- AdminList -->
      <div class="admin_board_list">
         <div class="container">
      
            <div class="col-lg-12">
               <div class="inner-content">
                  <table>
                        <th >아이디</th>
                        <th >이름</th>
                        <th>이름</th>
                        <th >전화번호</th>
                        <c:forEach items="${adminInfo}" var="admin">
                           <tr>
                              <td><c:out value="${admin.us_id}" /></td>
                              <td><c:out value="${admin.us_name}" /></td>
                              <td>등급   :   관리자 </td>
                              <td><c:out value="${admin.us_phone}" /></td>
                           </tr>
                        </c:forEach>
                  </table>
               </div>
            </div>
         </div>
      </div>
      
      
<div class="container">
   <div class="row justify-content-center">
      <div class="col-md-6 col-lg-5">
         <div class="col-lg-12">
<!--             <div class="inner-content"> -->
<!--             <div class="container board-list-margintop"> -->
               <div class="Info-wrap">
                  <div class="registerAdmin">
                  <div class="title" >
                     <h2><b>관리자 등록</b></h2><br><br><br>
                  </div>
                  <ul class="hide_page">
               <form role="form" action="/admin/adminJoin" method="post" name="form">
                  <table>
<!--                   <input type="hidden" id="us_num" name="us_num" value="us_num"> -->
                     <div class="form-group ">
                                    <input type="text" class="form-control" placeholder="아이디" required name="us_id">
                                    <input type="hidden" name="reid" size="20">
                                    <button type="button" class="form-control join_doubleck" onclick="return idCheck()">중복 확인</button>
                           </div>
                          <div class="form-group join_password">
                                    <input type="password" class="form-control" placeholder="비밀번호" required
                                        name="us_pass">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" placeholder="비밀번호확인" required
                                        name="passchk">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="이름" required name="us_name">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="관리자 @@@" required
                                        name="us_nickname">
                                    <input type="hidden" name="renickname" size="20" >
                                     <button type="button" class="form-control join_doubleck" onclick="return nicknameCheck()">중복 확인</button>
                                </div><div class="form-group">
                                    <input type="text" class="form-control" maxlength="13" onKeyup="addHypen(this);" placeholder="전화번호 ex)010-0000-0000" required
                                        name="us_phone">
                                </div>
                                <div class="form-group join_btn">
                                    <button type="submit" class="form-control btn btn-primary" onclick="return joinChk()">가입하기</button>
                                </div>
                               
                                <div class="form-group adminClose_btn">
                                    <button type="button" class="form-control btn btn-primary" id="closeButton">등록 창 닫기</button>
                                </div>
               </table>
               </form>
               </ul>
            </div>
            </div>
         </div>
      </div>
   </div>
</div>
</section>






<div class="container">
   <div class="row">


      
      <!-- Modal 창 추가 -->
      <div id="myModal" class="modal" tabindex="-1" role="dialog">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title">Modal title</h5>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">처리가 완료되었습니다.</div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary"
                     data-dismiss="modal">Close</button>
               </div>
            </div>
         </div>
      </div>
      <!-- //Modal 창 추가 -->

   </div>
</div>
<!--// BoardList -->

<%@ include file="../includes/footer.jsp"%>

<script>
 
    $(document).ready(function(){
       $('ul.hide_page').hide();
       $('button#closeButton').click(function(){
          $('ul.hide_page').slideUp();
       });
       $('.registerAdmin').mouseenter(function(){
          $('ul.hide_page').slideDown();
       });
    });
    
    function joinChk() {
        if(document.form.us_id.value.length === 0){
           alert("아이디를 입력해주세요.");
            form.us_id.focus();
           return false;
        }
        if(document.form.us_id.value.length < 4){
          alert("아이디는 4자 이상 입력 해 주세요..");
          form.us_id.focus();
          return false;
         }
        if(document.form.reid.value.length === 0){
          alert("아이디 중복체크를 하지 않았습니다.");
          form.us_id.focus();
          return false;
       }
        if(document.form.us_pass.value.length === 0){
           alert("비밀번호를 입력해주세요.");
            form.us_pass.focus();
           return false;
        }
        if( ( (document.form.us_pass.value.length > 0 ) && (document.form.us_pass.value.length < 8 ) ) || ( document.form.us_pass.value.length > 16) ){
          alert("비밀번호는 8자 이상 16자 이하로 입력해주세요.");
          form.us_pass.focus();
          return false;
         }
        if(document.form.passchk.value != document.form.us_pass.value){
           alert("비밀번호가 일치하지 않습니다. 비밀번호를 다시 입력해주세요.");
            form.passchk.focus();
              return false;
        }
        if(document.form.us_name.value.length === 0){
           alert("이름를 입력해주세요.");
            form.us_name.focus();
           return false;
        }
        if(document.form.us_phone.value.length === 0){
           alert("핸드폰를 입력해주세요.");
            form.us_phone.focus();
           return false;
        } 
      if(document.form.us_phone.value.length != 13) {
         alert("핸드폰번호를 정확하게 입력해주세요");
            form.us_phone.focus();
         return false;
      }
           alert("회원 가입이 완료되었습니다.");
           return true;
        }
    
    function idCheck(){
       if(document.form.us_id.value === ""){
          alert("아이디를 입력해주세요.");
          document.form.us_id.focus();
          return;   
       }
       
       var url = "/user/idCheck?us_id=" + document.form.us_id.value;
       window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizeable=no, width=450, height=200");   
    }
    
    function nicknameCheck(){
       if(document.form.us_nickname.value === ""){
          alert("닉네임를 입력해주세요.");
          document.form.us_nickname.focus();
          return;   
       }
       
       var url = "/user/nicknameCheck?us_nickname=" + document.form.us_nickname.value;
       window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizeable=no, width=450, height=200");   
    }
    
    function addHypen(obj) {
       var number = obj.value.replace(/[^0-9]/g, "");
       var phone = "";

       if(number.length < 4) {
           return number;
       } else if(number.length < 7) {
           phone += number.substr(0, 3);
           phone += "-";
           phone += number.substr(3);
       } else if(number.length < 11) {
           phone += number.substr(0, 3);
           phone += "-";
           phone += number.substr(3, 3);
           phone += "-";
           phone += number.substr(6);
       } else {
           phone += number.substr(0, 3);
           phone += "-";
           phone += number.substr(3, 4);
           phone += "-";
           phone += number.substr(7);
       }
       obj.value = phone;
   }
    </script>
    <script src="/resources/assets/js/join.js"></script>
</html>