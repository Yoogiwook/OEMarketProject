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
<title>회원정보--관리자</title>
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.css">
<link rel="stylesheet" href="/resources/assets/css/basic.css">
<link rel="stylesheet" href="/resources/assets/css/main.css">
</head>
<body>
<%@ include file="../includes/header.jsp"%>
   <section class="insert-section">
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
               <div class="Info-wrap">
               		
               	<table id= "userInfoTable">
               		<div class="title">
               		<h2><b>회원 정보</b></h2><br>
               		</div>
               	<c:forEach items="${user}" var="user">
                      <tr class="form-group">
                       <th>아이디 : </th>
                       		<td> 
                       		<input type="text" class="form-control"  name="us_id" 
                       		readonly="readonly" value='<c:out value="${user.us_id }"/>' >
                       		</td>
                       	</tr><br>
                    
                     	<tr class="form-group"><th>이름 : &nbsp; </th>
                        <td><input type="text" name="us_name"  
                        readonly="readonly" value='<c:out value="${user.us_name }"/>' class="form-control" ></td></tr>
                     	<tr class="form-group"><th>생년 월 일 : &nbsp; </th>
                        <td><input type="text" name="us_birth"  readonly="readonly" value='<c:out value="${user.us_birth }"/>'  class="form-control" ></td></tr>
                     	<tr class="form-group"><th>이메일 : &nbsp; </th>
                       <td> <input type="text" name="us_email"  readonly="readonly" value='<c:out value="${user.us_email }"/>' size="35" class="form-control" ></td></tr>
                        <tr class="form-group">
                        <th>성별 : &nbsp; </th>
                        <c:choose>
                     		   <c:when test="${user.us_gender == 'male'}"> 
                        			 <td> <input type="text" name="us_email"  readonly="readonly" value='<c:out value="남성"/>' size="35" class="form-control" ></td>
                  			  </c:when>
                     	 	  <c:when test="${user.us_gender == 'female' }"> 
                        			<td> <input type="text" name="us_email"  readonly="readonly" value='<c:out value="여성"/>' size="35" class="form-control" ></td>
          						</c:when>
                          </c:choose></tr>
                     </div>
                     <tr class="form-group"><th>도 / 시 / 로 : &nbsp; </th>
                        <td><input type="text" name="us_address1" value='<c:out value="${user.us_address1 }"/>' 
                           id="sggNm" class="form-control" readonly="readonly"></td></tr>
                     <tr class="form-group"><th>나머지 주소 : &nbsp; </th>
                       <td> <input type="text" name="us_address2" value='<c:out value="${user.us_address2 }"/>' 
                           id="emdNm" class="form-control"  readonly="readonly"></td></tr>
                     <tr class="form-group"><th>전화 번호 : &nbsp; </th>
                        <td><input type="text" class="form-control"  readonly="readonly" maxlength="13" onKeyup="addHypen(this);" value='<c:out value="${user.us_phone }"/>' required
                           name="us_phone"></td></tr>
                        
   					 <input type="hidden" name="us_id" value='<c:out value="${user.us_id }"/>'> 
                     </c:forEach>
                     </table>
                     <br><br>
                     <div class="button">
                        <div class="form-group submit frame">
                        <tr >
                           <button type="button" class="form-control btn btn-primary" onclick="goBack()">돌아가기</button>
                       </tr></div> </div>
              
               </div>
            </div>
         </div>
      </div>
   </section>
   <%@ include file="../includes/footer.jsp"%>
</body>

<!-- jQuery -->
<script src="/resources/assets/js/jquery.min.js"></script>

<!-- Bootstrap -->
<script src="/resources/assets/js/bootstrap.min.js"></script>

<!-- Plugins -->
<script src="/resources/assets/js/owl-carousel.js"></script>
<script src="/resources/assets/js/slick.js"></script>

<!-- custom -->
<script src="/resources/assets/js/custom.js"></script>

<script >
	function goBack(){
		window.history.back();
	}
</script>
</html>
