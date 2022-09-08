<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@	taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>

<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.css">
<link rel="stylesheet" href="/resources/assets/css/owl.theme.default.css">
<link rel="stylesheet" href="/resources/assets/css/owl-carousel.css">
<link rel="stylesheet" href="/resources/assets/css/basic.css">
<link rel="stylesheet" href="/resources/assets/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<style type="text/css">
.center__header{height: 150px; padding-top: 50px; border-bottom: 1px solid #999;}
.center__notice__highway img{margin-top: 12px; width: 40px; height: 40px;}
.center__logoNtitle{cursor: pointer; font-size: 46px; font-family: 'Jua' !important;}
.center__logoNtitle img{width: 60px; height: 60px; margin-top: -9px; cursor: inherit;}
.center__search{margin-top: 7px; margin-right: -7px; max-width: 500px; float: right;}
.center__searchIcon{margin-top: 7px; margin-right: 7px; width: 45px; height: 45px; cursor: pointer;}
@media screen and (max-width: 1000px) {
    .center__search{
        display: none;
    }
    .center__searchIcon{
        display: none;
    }
}

.center__header__bottom{
	padding-top: 12px; padding-bottom: 12px;
	-webkit-user-select:none;
	-moz-user-select:none;
	-ms-user-select:none;
	user-select:none;
}
.center__header__bottom *{display: inline;}
.center__header__bottom p *{cursor: pointer; color: #333; text-decoration: none;}
.center__header__bottom p *:hover{color: #597;}

.center__button__top__right{margin-top: 2px; min-width: 150px; min-height: 50px; border: 2px solid #BBB; border-radius: 20px;}
.center__button__top__right p{font-size: 17px; color: white;}

tbody{background-color: white;}
.center__body{padding-top: 90px;}
.center__body__explanation{padding: 10px 0 40px 0;}
.center__table{margin-top: -50px;}
.center__thead{text-align: center;}
.column__width__80{width: 80px;}
.column__width__160{width: 160px;}
.center__table__widecolumn{padding-left: 15px;}
.center__table__widecolumn a{text-decoration: none; color: black;}
.center__select__form{margin: -5px 0 0 30px; width: 200px;}
.center__select__text{margin: 5px 0 0 -30px; min-width: 120px;}

.center__hyperlink{text-decoration: none; font-weight: bold; color: #597; cursor: pointer;}
.center__hyperlink:hover{text-decoration: none; font-weight: bold; color: #375;}

.card__admin{cursor: pointer;}
.card__imgArea{margin: 30px 60px -10px 60px;}
.card__admin .card__imgArea .card-img{min-width: 60px; max-width: 160px;}
.card__admin__title{padding: 20px 0 10px 0; font-size: 20px; font-weight: bold;}

.card__user{max-width: 540px; min-height: 210px; cursor: pointer;}
.card__user img{min-width: 60px; max-width: 160px;}

.center__insert__ce{background-color: #FDFDFD;}
.center__insert__title{padding-top: 80px; padding-bottom: 40px;}
.center__insert__title .text-muted{margin: 6.5px 0 0 10.5px;}
.center__insert__label{margin-bottom: 18px;}
#suggestInsert .center__insert__label{margin-top: -10px;}
.center__insert__label label{margin:12px 0 0 -36px;}
.center__insert__input{margin:2px 0 0 20px; width: 895px;}
#suggestInsert .center__insert__input{margin-top: -10px;}
.center__insert__textCount{margin:22px 120px 0 0; float: right; font-size: 70%;}
.center__insert__textarea {margin-left: -9px; min-width: 910px; max-width: 1020px;}
.center__savearea{padding: 30px 0 30px 10px;}
.center__savearea .upload-name{width: 250px; padding: 10px 15px 10px 15px; border-radius: 12.5px;}
.center__savearea .input-file-button img{margin-top: 7px; width: 29px; height: 30px;}
.center__buttonarea{
	margin: 12px 85px 0 0;
	-webkit-user-select:none;
	-moz-user-select:none;
	-ms-user-select:none;
	user-select:none;
}
.center__buttonarea button{padding: 7.5px 15px 7.5px 15px; border: 2.25px solid #AAA; border-radius: 15px;}
.center__hr{margin: 50px 1px 50px 1px; height: 1.65px; background-color: #CCC; border: 0;}
.center__details__content{margin: 0 22.5px 0 22.5px; min-width: 500px; font-size: 17.5px;}
.center__details__content img{
	min-width: 200px; min-height: 100px; max-width : 800px; max-height: 400px;
	margin-top: 40px;
}
.center__details__goToList{margin:-1px 1px 40px 0;}
.center__admin__emailarea{cursor: pointer;}
.center__admin__emailarea:hover{color:#3E7E5E;}
.center__admin__dropdown{margin-left: 105px;}
.center__admin__dropdown .dropdown-item:active{background-color: #4E8E6E;}
.center__admin__buttonarea{padding: 20px 0 35px 0;}
.center__nothing{padding: 80px 0 100px 0;}
.center__qna__table{margin-top: 15px;}
.center__b_l_c{
	color: #999;
	-webkit-user-select:none;
	-moz-user-select:none;
	-ms-user-select:none;
	user-select:none;
}
#FAQ .center__b_l_c{margin-top: -10px; margin-bottom: -9px;}
.center__b_l_c .filter{cursor: pointer; color:#333;}
.center__b_l_c .filter:hover{color:#4E8E6E;}
.center__tinybutton{margin-top:-2.75px; padding:1.5px 10px 2px 10px; font-size: 12.5px; border-radius: 7.5px;}

.center__paging{margin-bottom: 45px;}
.center__paging ul li{margin: 45px 3px 0 3px; width: 45px; height: 45px; border: 1.5px solid #999; border-radius: 3px; display: inline-block;}
.center__paging ul li:hover{background-color: #4E8E6E;}
.center__paging ul li:hover a{color: white;}
.center__paging ul li a{
	margin-left: -2.5px; padding: 17.5px 17.5px 17.5px 17.5px;
	color: #777; font-size: 20px; font-family: 'Jua' !important;
	vertical-align: -10px; text-align: center;
}
.modal-title svg{margin-top: -5px;}
</style>
</head>
<body>
<form action="/center/FAQ" method="get" id="goToFAQList">
	<c:if test="${login.us_id != null }"><input type="hidden" name="us_id" value='<c:out value="${login.us_id }" />'></c:if>
	<c:if test="${pageMaker.cri.pageNum != null }"><input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }" />'></c:if>
	<c:if test="${pageMaker.cri.amount != null }"><input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }" />'></c:if>
	<header class="center__header">
		<div class="container">
			<div class="row">
				<div class="col-auto mr-auto">
					<span class="center__logoNtitle" title="오이마켓 메인페이지로" onclick="location.href='/'">
					<img src="/resources/assets/images/cucumber.png">&nbsp;오이마켓</span>
					<span style="font-size: 42px;">&nbsp;고객센터</span>
				</div>
				<div class="col-5">
					<input class="form-control center__search" name="keyword" value='<c:out value="${cri.keyword }" />' type="text"
					 placeholder="도움말을 검색하여 궁금한 점을 해결해보세요." onfocus="this.placeholder=''" onblur="this.placeholder='도움말을 검색하여 궁금한 점을 해결해보세요.'">
				</div>
				<div class="col-auto">
					<img class="center__searchIcon" src="/resources/assets/images/search.png"
					 title="검색하기" onclick="document.getElementById('goToFAQList').submit();">
				</div>
			</div>
		</div>
	</header>
</form>

<form action="/center/notice" method="get" id="goToNoticeList">
	<c:if test="${login.us_id != null }"><input type="hidden" name="us_id" value='<c:out value="${login.us_id }" />'></c:if>
	<c:if test="${pageMaker.cri.pageNum != null }"><input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }" />'></c:if>
	<c:if test="${pageMaker.cri.amount != null }"><input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }" />'></c:if>
</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>