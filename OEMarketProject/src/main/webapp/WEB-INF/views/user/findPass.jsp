<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${path}/resources/js/join.js"></script>
    <meta charset="UTF-8">
    <title>비밀번호찾기</title>
    <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/assets/css/font-awesome.css">
    <link rel="stylesheet" href="/resources/assets/css/basic.css">
    <link rel="stylesheet" href="/resources/assets/css/main.css">

</head>

<body>


    <section class="insert-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <div class="insert-wrap">
                        <img src="/resources/assets/images/cucumber.png">
                        <form action="/user/findPass" id="join_frm" method="post" name="form">
                            <h1>비밀번호 찾기</h1>
                            <h3>이름과 아이디와 이메일을 입력하세요.</h3>
                            <table>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="이름" required name="us_name">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="아이디" required name="us_id">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="us_email" id="us_email"
                                        placeholder="이메일">
                                    <button type="button" class="form-control findid_email"
                                        id="mail-Check-Btn">인증번호받기</button>
                                </div>
                                <div class="mail-check-box">
                                    <input type="text" class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!"
                                         maxlength="6" id="email_auth_key" >
                                </div><br>
                                <div class="form-group submit">
                                    <button type="submit" id="join" class="form-control btn btn-primary"
                                        onclick="return join()">비밀번호 찾기</button>
                                </div>
                                <div class="form-group submit fr">
                                    <button type="button" class="form-control btn btn-primary"
                                        onclick="location.href='/'">홈 화면으로</button>
                                </div>

                                <div class="form-group hidepass">
	                        		<button type="button" class="form-control btn btn-primary" id="login_btn"
	                        			onclick="location.href='${contextPath}/login'">로그인 하기</button><br>
	                        		<input type="text" readonly="readonly" id="hidepass" class="form-control" value="회원님의 비밀번호는 <c:out value='${us_pass}'/> 입니다.">
                                </div>
                            </table>
                        </form>
							<c:if test="${empty us_pass}">                  
    							<script>
    								$("#hidepass").hide();
    								$("#login_btn").hide();
    							</script>                    	
                        	</c:if>
                    </div>
                </div>
            </div>
        </div>
<script>

	 $(function() { 
	    
	    var email_auth_cd = '';
	 
	   $('#join').click(function(){
	      
	      if($('#us_name').val() == ""){
	         alert("이름을 입력해주세요.");
	         return false;
	      }
	      
	      if($('#us_id').val() == ""){
	         alert("아이디를 입력해주세요.");
	         return false;
	      }
	      
	      if($('#email_auth_key').val() != email_auth_cd){
	         alert("인증번호가 일치하지 않습니다.");
	         return false;
	      }
	   
	   });
		
		$('#mail-Check-Btn').click(function() {
			var email = $('#us_email').val();

			if (email == '') {
				alert("이메일을 입력해주세요.");
				return false;
			}

			$.ajax({
				type : "POST",
				url : "/user/emailAuth",
				data : {
					email : email
				},
				success : function(data) {
					alert("인증번호가 발송되었습니다.");
					email_auth_cd = data;
				},
				error : function(data) {
					alert("메일 발송에 실패했습니다.");
				}
			});
		});
	})
</script>

	<!-- jQuery -->
    <script src="/resources/assets/js/jquery.min.js"></script>

    <!-- Bootstrap -->
    <script src="/resources/assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="/resources/assets/js/owl-carousel.js"></script>
    <script src="/resources/assets/js/slick.js"></script>

    <!-- custom -->
    <script src="/resources/assets/js/custom.js"></script>
</body>
</html>