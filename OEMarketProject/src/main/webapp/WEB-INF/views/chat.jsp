<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>채팅방 :: <%=request.getParameter("cr_seller") %></title>
<style>
#chat{
	padding: 125px 0 60px 0;
	margin-bottom: -60px;
	-webkit-user-select:none;
	-moz-user-select:none;
	-ms-user-select:none;
	user-select:none;
	}
#chat svg{margin-top: -4px;}
#chat_main{max-width: 600px; height: 750px;}
#chat_body{max-width: 600px; height: 750px;}
#chat_inner{padding: 20px 20px 20px 20px;}
#chat_room_name{margin-left: 10px; font-weight: bold; font-size: 23px;}
#chat_go_back{margin-top: -7.5px; width: 33px; height: 30px; cursor: pointer;}
#chat_start_img{margin-right: 8px; width: 36px; height: 36px; cursor: pointer;}
#chat_chatingArea{
	background-color: black; border: 2px solid #999; border-radius: 5px;
	margin: 25px auto; max-width: 490px; height: 540px; overflow: auto;
}
#chat_tikitaka p{margin-top:10px; margin-left: 12.5px; color:#EEE; font-size: 15px;}
#chat_sendArea{margin-top: -0.25%; margin-left: -2%;}
#chat_send{margin-top: 3px; width: 93.5%; display: none;}
#chat_send_img{margin-top: 4px; width: 48px; height: 48px; display: none; cursor: pointer;}
</style>
</head>

<script type="text/javascript">
	var ws;

	function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/chating");
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		
		ws.onmessage = function(data) {
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				$("#chat_tikitaka").append("<p>" + msg + "</p>");
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

/* 	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	} */

	function send() {
		var uN = $("#us_nickname").val();
		var msg = $("#chat_send").val();
		ws.send(uN+" : "+msg);
		$('#chat_send').val("");
	}
	
	//뒤로가기가 감지되면 현재 페이지 새로고침
	window.onpageshow = function(e) {
		if (e.persisted || (window.performance && window.performance.navigation.type == 2)) {
			location.reload();
		}
	}
</script>

<%@ include file="includes/header.jsp" %>
<input type="hidden" value="${us_nickname}" name="us_nickname" id="us_nickname">
<section class="bg-light" id="chat">
	<div class="container">
		<div class="row justify-content-md-center">
			<p class="h6 font-weight-light text-muted">※ 채팅을 시작하시려면 우측 상단의&nbsp;<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-power" viewBox="0 0 16 16">
			<path d="M7.5 1v7h1V1h-1z"/><path d="M3 8.812a4.999 4.999 0 0 1 2.578-4.375l-.485-.874A6 6 0 1 0 11 3.616l-.501.865A5 5 0 1 1 3 8.812z"/>
			</svg>버튼을 눌러주세요.</p>
		</div>
	</div>
	<main  role="main" class="container" id="chat_main">
		<div class="my-3 p-3 bg-white rounded shadow-sm" id="chat_body">
			<div class="container" id="chat_inner">
				<div class="row">
					<div class="col-auto mr-auto" style="height: 44px;">
						<img src="/resources/assets/images/chat_go_back.png" id="chat_go_back" title="뒤로가기" onclick="history.back();">
						<span id="chat_room_name"><c:out value="${cr_seller }"/></span>
					</div>
					<div class="col-auto">
						<img src="/resources/assets/images/chat_start.png" id="chat_start_img" title="채팅 시작하기" onclick="wsOpen()">
					</div>
				</div>
				<div class="row" id="chat_chatingArea">
					<div id="chat_tikitaka"></div>
				</div>
				<div class="row" id="chat_sendArea">
					<div class="col-11"><input class="form-control" id="chat_send" placeholder="여기에 메시지를 입력하세요."></div>
					<div class="col-1" style="margin-left: -7.5%;">
						<img src="/resources/assets/images/chat_sendBtn.png" id="chat_send_img" title="전송" onclick="send()">
					</div>
				</div>
			</div>
		</div>
	</main>
	<%-- <div id="yourName">
		<table class="inputTable">
			<tr>
				<th>사용자명</th>
				<th><input type="hidden" value="${user}" name="userName" id="userName"></th>
				<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
			</tr>
		</table>
	</div> --%>
</section>

<script type="text/javascript">
	//채팅 시작 버튼(이미지)을 누르고 나면
	$(document).ready(function(){
		$('#chat_start_img').on("click", function(e){
			document.getElementById('chat_send').style.display = "block"; //채팅 메세지 입력란과
			document.getElementById('chat_send_img').style.display = "block"; //전송 버튼(이미지)이 보여지고
			document.getElementById('chat_start_img').style.display = "none"; //채팅 시작 버튼(이미지)이 사라짐
		})
	});
	
	//로그인 풀린채로 넘어갔을 때 로그인창으로 넘어가게
	var Id = $("input[name='us_nickname']").val();
	console.log("id================"+Id);
	if(Id === ''){
	   alert('로그인 후 이용바랍니다.');
	   $(location).attr("href","/login");
	}
</script>

<%@ include file="includes/footer.jsp" %>