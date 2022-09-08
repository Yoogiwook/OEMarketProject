<%@	page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@	taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>마이페이지</title>
<meta charset="UTF-8">
<style type="text/css">
.mypage{padding-top: 150px; padding-bottom: 60px; margin-bottom: -60px;}
.mypage hr {margin: 15px 0 30px 0;}
.mypage .display-4{margin-bottom: 30px; font-weight: bold; color: #363636;}
.mypage__content__top{margin-top: 30px;}
.mypage__content__top .h3{font-weight: bold; color: #363636;}
.mypage__content__bottom{margin-top: 30px; margin-bottom: 15px;}
.mypage__content__bottom small{margin-top: -5px; margin-left: 150px; padding-bottom: 15px;}
.mypage__content__bottom button{min-width: 200px;}
.mypage__partition{padding-bottom: 6px;}
.profileLeftSide{margin-top: 18px}
.profileLeftSide .profilepic{position: relative; width: 300px; height: 300px; border-radius: 70%; overflow: hidden; background-color: #111;}
.profileLeftSide .profilepic:hover .profilepic__content{opacity: 1;}
.profileLeftSide .profilepic:hover .profilepic__image{opacity: .5;}
.profileLeftSide .profilepic__image{object-fit: cover; opacity: 1; transition: opacity .2s ease-in-out; width: 300px; height: 300px;}
.profileLeftSide .profilepic__content{
	position: absolute; display: flex; flex-direction: column;
	top: 0; right: 0; bottom: 0; left: -36px;
	justify-content: center; align-items: center;
	color: white; opacity: 0; transition: opacity .2s ease-in-out;
}
.profileLeftSide .profilepic__content img{width: 300px; height: 300px; padding: 100px; cursor: pointer; border-radius: 50%}
.profileLeftSide .profilepic #file{display: none;}
.profileRightSide small{margin-left: 36px; margin-bottom: 3px;}
.profileRightSide #currentNickname{display: none;}
.profileRightSide .introZone{margin-top: -7px}
.profileRightSide .introZone #introTextArea{margin-left: 17px; height:170px; min-width: 400px; resize: none; padding: 10px 20px;}
.profileRightSide #my_nickname{margin-left: 17px; min-width: 400px;}
#resetbutton button{background-color: #777;}
#nickNregDate{margin: 45px 0 15px 0;}
.aboutUserInfo{margin-top: -15px;}
.aboutUserInfo img{max-width: 105px; max-height: 105px;}
.mypage__content__bottom .card{width: 375px; border-radius: 25px;}
.mypage__content__bottom .card .runFrm{cursor: pointer;}
.mypage__content__bottom .card .runFrm img{margin:12px 0 0 24px;}
.goDetail{margin-top: 30px;}
.goDetail .runFrm{width: 240px; height:360px; border-radius: 25px; cursor: pointer;}
.bottomSmallMuted{padding-top: 20px;}
div.fr button{margin-left: 20px;}
</style>
</head>
<%@ include file="../includes/header.jsp" %>
<input type="hidden" name="logged_in_id" value='<c:out value="${login.us_id }"/>'>
<input type="hidden" name="logged_in_grade" value='<c:out value="${login.us_grade }"/>'>
<section class="bg-light mypage">
	<div class="container">
		<div class="row justify-content-md-center">
			<h1 class="display-4">마이페이지</h1>
		</div>
	</div>
	<form name="form" id="form" action="/mypage/profileEdit" method="post" enctype="multipart/form-data">
		<input type="hidden" name="my_image" value='<c:out value="${mypage.my_image }"/>'>
		<input type="hidden" name="my_id" value='<c:out value="${mypage.my_id }"/>'>
		<input type="hidden" name="us_id" value='<c:out value="${mypage.my_id }"/>'>
		<input type="hidden" name="he_id" value='<c:out value="${mypage.my_id }"/>'>
		<main role="main" class="container">
			<!-- 프로필 설정 영역 -->
			<div class="my-3 p-3 bg-white rounded shadow-sm">
				<div class="container">
					<div class="row justify-content-md-center">
						<div class="col-9">
							<div class="mypage__content__top"><p class="h3">프로필 설정</p><hr></div>
						</div>
					</div>
					<div class="row justify-content-md-center">
						<div class="col-md-auto profileLeftSide">
							<div class="profilepic">
								<input type="file" id="file" name="file" accept=".gif, .jpg, .jpeg, .png" onchange="readURL(this);">
								<img class="profilepic__image" id="preview" src="<spring:url value='/img/${mypage.my_image}'/>" alt="my_image" />
								<div class="profilepic__content">
									<label for="file"><img src="/resources/assets/images/mypageImgUpload.png"></label>
								</div>
							</div>
						</div>
						<div class="col-md-auto profileRightSide">
							<small class="form-text">닉네임 (필수)</small>
							<div class="form-group">
								<input type="text" class="form-control" name="my_nickname" id="my_nickname" oninput="nicknameChk()"
								 value='<c:out value="${mypage.my_nickname }"/>'>
								<div><span id="nicknameChk"><small></small></span></div>
							</div>
							<div class="form-group introZone">
								<small class="form-text">자기소개 (선택)</small>
								<textarea class="form-control" id="introTextArea" name="my_intro"
								 maxlength="500"><c:out value="${mypage.my_intro }"/></textarea>
								<small class="form-text text-muted textCount">※ 500자 이내로 입력해주세요.</small>
							</div>
						</div>
					</div>
					<div class="row justify-content-md-center">
						<div class="col-md-auto mypage__content__bottom">
							<div class="form-group submit" id="resetbutton">
								<button class="form-control btn btn-secondary" type="reset" onclick="return resetChk()">원래대로</button>
							</div>
							<div class="form-group submit fr">
								<button class="form-control btn btn-success runFrm" type="submit" data-oper='profileEdit_btn'>적용하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mypage__partition"></div>
			<!-- 개인 정보 보호 -->
			<div class="my-3 p-3 bg-white rounded shadow-sm">
				<div class="container">
					<div class="row justify-content-md-center">
						<div class="col-9">
							<div class="mypage__content__top"><p class="h3">개인 정보 보호</p><hr></div>
						</div>
					</div>
				</div>
				<div class="container mypage__content__bottom">
					<div class="row justify-content-md-center aboutUserInfo">
						<div class="col-md-auto">
							<div class="card mb-3">
								<div class="row g-0 runFrm" data-oper='goUserUpdate' onclick="document.getElementById('form').submit();"
								 title="회원 정보 수정 페이지로 이동">
									<div class="col-md-4">
										<img src="/resources/assets/images/mypage_userInfo.png" class="img-fluid rounded-start" alt="userInfo">
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title">회원 정보 수정</h5>
											<p class="card-text">개인 정보를 관리하거나<br>비밀번호를 수정할 수 있습니다.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-auto">
							<div class="card mb-3">
								<div class="row g-0 runFrm" data-oper='goWithdrawal' onclick="document.getElementById('form').submit();"
								 title="회원 탈퇴 페이지로 이동">
									<div class="col-md-4">
										<img src="/resources/assets/images/mypage_withdrawal.png" class="img-fluid rounded-start" alt="withdrawal">
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title">회원 탈퇴</h5>
											<p class="card-text">오이마켓을 떠나시려면<br>이 곳에서 탈퇴를 진행해주세요.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mypage__partition"></div>
			<!-- 활동 내역 보기 -->
			<div class="my-3 p-3 bg-white rounded shadow-sm">
				<div class="container">
					<div class="row justify-content-md-center">
						<div class="col-9">
							<div class="mypage__content__top"><p class="h3">활동 내역 보기</p><hr></div>
							<div id="nickNregDate">
								<p class="lead text-center text-muted"><strong><c:out value="${mypage.my_nickname }" /></strong
								>님은 <strong><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${user.us_joindate }" /></strong
								>부터 오이마켓과 함께했어요.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="container goDetail">
					<div class="row justify-content-md-center">
						<div class="col-md-auto">
							<div class="card runFrm" title="채팅방으로 이동" data-oper='goChatRoom'
							 onclick="document.getElementById('form').submit();">
								<img src="/resources/assets/images/mypage_chat.png" class="card-img-top" alt="chat">
								<h1 class="display-3 text-center"><strong><c:choose>
									<c:when test="${chatCount > 999 }">999+</c:when>
									<c:otherwise><c:out value="${chatCount }" /></c:otherwise>
								</c:choose></strong></h1>
								<div class="card-body">
									<p class="card-text text-center"><c:out value="${mypage.my_nickname }" />님의<br><strong>채팅방</strong> 수</p>
								</div>
							</div>
						</div>
						<div class="col-md-auto">
							<div class="card runFrm" title="찜 목록 페이지로 이동" data-oper='goHeartBoard'
							 onclick="document.getElementById('form').submit();">
								<img src="/resources/assets/images/mypage_heart.png" class="card-img-top" alt="heart">
								<h1 class="display-3 text-center"><strong><c:choose>
									<c:when test="${countingHeart > 999 }">999+</c:when>
									<c:otherwise><c:out value="${countingHeart }" /></c:otherwise>
								</c:choose></strong></h1>
								<div class="card-body">
									<p class="card-text text-center"><c:out value="${mypage.my_nickname }" />님이<br><strong>찜한 상품</strong> 수</p>
								</div>
							</div>
						</div>
						<div class="col-md-auto">
							<div class="card runFrm" title="판매 내역 페이지로 이동" data-oper='goSellBoard'
							 onclick="document.getElementById('form').submit();">
								<img src="/resources/assets/images/mypage_sell.png" class="card-img-top" alt="sell">
								<h1 class="display-3 text-center"><strong><c:choose>
									<c:when test="${sellCount > 999 }">999+</c:when>
									<c:otherwise><c:out value="${sellCount }" /></c:otherwise>
								</c:choose></strong></h1>
								<div class="card-body">
									<p class="card-text text-center"><c:out value="${mypage.my_nickname }" />님의<br><strong>판매</strong> 횟수</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="mypage__content__bottom">
					<small class="form-text text-muted bottomSmallMuted">※각 항목을 클릭하면 해당 항목의 상세 목록 페이지로 이동합니다.</small>
				</div>
			</div>
		</main>
	</form>
</section>

<script>
	//프로필 사진 변경 전 미리보기
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('preview').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
		document.getElementById('preview').src = "<spring:url value='/img/${mypage.my_image}'/>";
		}
	}
	
	//닉네임 유효성 체크
	$('#my_nickname').keyup(function nicknameChk() { //사용자가 입력한 값을 받음
		if($(this).val() === '' ) {
			$('#nicknameChk').html('<small style="color: #D00">닉네임을 입력해주세요.</small>');
		}else if($(this).val().length > 10) {
			$('#nicknameChk').html('<small style="color: #D00">10자 이내로 입력해주세요.</small>');
		}else{
			var my_nickname = $('#my_nickname').val();
			$.ajax({
				url:'./nicknameChk',
				type:'post',
				data:{my_nickname:my_nickname},
				success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받음
					if(cnt == 0){
						$('#nicknameChk').html('<small style="color: #090">사용 가능한 닉네임입니다.</small>');
					} else {
						$('#nicknameChk').html('<small style="color: #D00">이미 사용중인 닉네임입니다. (본인이 적용중이면 계속 사용 가능)</small>');
					}
				},
				error:function() {alert("ERROR");}
			});
		}
	});
	
	var myNick = document.getElementById('my_nickname');
	var nickChk = document.getElementById('nicknameChk');
	
	myNick.onfocus = function (e) {
		nickChk.style.setProperty("opacity", "1");
	};
	myNick.onblur = function(e) {
		nickChk.style.setProperty("opacity", "0");
	};
	
	//자기소개 글자수 체크
	$('#introTextArea').keyup(function (e) {
		let content = $(this).val();
		
		if (content.length == 0 || content == '') {
			$('.textCount').text('0' + '자/500자');
		}else{
			$('.textCount').text(content.length + '자/500자');
		}
		if (content.length > 500) {
			$(this).val($(this).val().substring(0, 500));
			alert('자기소개는 최대 500자까지 입력 가능합니다.');
		};
	});
	
	//원래대로 버튼 클릭 시 확인
	function resetChk(){
		if (!confirm("변경 내용이 모두 초기화되며, 현재 적용중인 프로필로 돌아갑니다.\n계속하시겠습니까?")){
			return false;
		}else{
			location.reload();
			return true;
		}
	}
	
	//폼 실행
	$(document).ready(function(){
		var formObj = $("form");
		
		$('.runFrm').on("click", function(e){
			e.preventDefault();
			
			var operation = $(this).data('oper');
			console.log(operation);
			
			if(operation === 'profileEdit_btn'){
				if (!confirm("변경 내용을 저장하시겠습니까?")){
					return;
				}else{
					if(document.form.my_nickname.value.length === 0){
						alert("닉네임은 필수 입력사항입니다.");
						document.form.my_nickname.focus();
						return;
					}else if(document.form.my_nickname.value.length > 10){
						alert("닉네임은 10자를 초과할 수 없습니다.");
						document.form.my_nickname.focus();
						return;
					}else if(document.form.my_intro.value.length > 500){
						alert("자기소개는 500자를 초과할 수 없습니다.");
						document.form.my_intro.focus();
						return;
					}else{
						alert("저장되었습니다.");
						formObj.attr( "enctype","multipart/form-data");
						var myIdTag = $("input[name='my_id']").clone();
						var myImageTag = $("input[name='my_image']").clone();
						var myNicknameTag = $("input[name='my_nickname']").clone();
						var fileTag = $("input[name='file']").clone();
						var myIntroTag = $("textarea[name='my_intro']").clone();
						formObj.empty();
						formObj.append(myIdTag);
						formObj.append(myImageTag);
						formObj.append(myNicknameTag);
						formObj.append(fileTag);
						formObj.append(myIntroTag);
					}
				}
			}else if(operation === 'goUserUpdate'){
				formObj.attr("action","/user/update").attr("method","get");
				var myIdTag = $("input[name='us_id']").clone();
				formObj.empty();
				formObj.append(myIdTag);
			}else if(operation === 'goWithdrawal'){
				formObj.attr("action","/mypage/withdrawal").attr("method","get");
				var myIdTag = $("input[name='my_id']").clone();
				formObj.empty();
				formObj.append(myIdTag);
			}else if(operation === 'goSellBoard'){
				formObj.attr("action","/mypage/sellBoard").attr("method","get");
				var myIdTag = $("input[name='my_id']").clone();
				formObj.empty();
				formObj.append(myIdTag);
			}else if(operation === 'goBuyBoard'){
				formObj.attr("action","/mypage/buyBoard").attr("method","get");
				var myIdTag = $("input[name='my_id']").clone();
				formObj.empty();
				formObj.append(myIdTag);
			}else if(operation === 'goHeartBoard'){
				formObj.attr("action","/mypage/heartBoard").attr("method","get");
				var myIdTag = $("input[name='my_id']").clone();
				formObj.empty();
				formObj.append(myIdTag);
			}else if(operation === 'goChatRoom'){
				formObj.attr("action","/chat/chatRoom").attr("method","get");
				var myIdTag = $("input[name='my_nickname']").clone();
				formObj.empty();
				formObj.append(myIdTag);
			}
			formObj.submit();
		});
	});
	
	//뒤로가기가 감지되면 현재 페이지 새로고침
	window.onpageshow = function(e) {
		if (e.persisted || (window.performance && window.performance.navigation.type == 2)) {
			location.reload();
		}
	}
	
	//관리자 or 본인만 접근 가능하도록 비정상적인 접근을 차단
	var logged_in_id = $("input[name='logged_in_id']").val();
	var logged_in_grade  = $("input[name='logged_in_grade']").val();
	var my_id = $("input[name='my_id']").val();

	if((logged_in_grade != 0 && logged_in_id != my_id) || logged_in_id === ''){
		alert('비정상적인 접근입니다.');
		$(location).attr("href","/");
	}
</script>

<%@ include file="../includes/footer.jsp" %>