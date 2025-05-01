<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>MyPortFolio</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Main CSS File -->
<link href="assets/css/main.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: iPortfolio
  * Template URL: https://bootstrapmade.com/iportfolio-bootstrap-portfolio-websites-template/
  * Updated: Jun 29 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<style>
#form_layout {
	/* border:1px solid red; */
	margin-top: 130px;
	margin-bottom: 50px;
	margin-left: 580px
}

.form-group {
	margin-top: 20px;
	margin-bottom: 20px;
}
</style>


<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" user="C##dbexam"
	password="m1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM member WHERE ID=?
   <sql:param value="${sessionId}" />
</sql:query>
</head>

<body>

	<!-- header include-->
	 <%@ include file="nav.jsp" %>

	<div class="container" id="form_layout">
		<div class="mb-3">
			<div class="col">
				<h1 class="display-3 mb-3">회원 수정</h1>
			</div>
		</div>


		<c:forEach var="row" items="${resultSet.rows}">
			<c:set var="mail" value="${row.mail}" />
			<c:set var="mail1" value="${mail.split('@')[0]}" />
			<c:set var="mail2" value="${mail.split('@')[1]}" />

			<c:set var="birth" value="${row.birth}" />
			<c:set var="year" value="${birth.split('-')[0]}" />
			<c:set var="month" value="${birth.split('-')[1]}" />
			<c:set var="day" value="${birth.split('-')[2]}" />

			<form name="newMember" class="form-horizontal"
				action="processEdit.jsp" method="post">
				<div class="form-group row">
					<label class="col-sm-2 ">아이디</label>
					<div class="col-sm-3">
						<input readonly name="id" type="text" class="form-control" placeholder="id"
							required autofocus value="<c:out value='${row.id}'/>" >
					</div>
				</div>
				<div class="form-group  row ">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-3">
						<input name="password" type="password" class="form-control"
							placeholder="password">
					</div>
				</div>
				<div class="form-group  row">
					<label class="col-sm-2">비밀번호확인</label>
					<div class="col-sm-3">
						<input name="password_confirm" type="password"
							class="form-control" placeholder="password confirm">
					</div>
				</div>
				<div class="form-group  row">
					<label class="col-sm-2">성명</label>
					<div class="col-sm-3">
						<input name="name" type="text" class="form-control"
							value="<c:out value='${row.name}'/>">
					</div>
				</div>
				<div class="form-group  row">
					<label class="col-sm-2">성별</label>
					<div class="col-sm-10">
					<c:set var="gender" value='${row.gender}'/>
						<input name="gender" type="radio" value="남"
						<c:if test="${gender.equals('남')}"><c:out value="checked"/></c:if>
						> 남 
							<input name="gender" type="radio" value="여"/
							<c:if test="${gender.equals('여')}"><c:out value="checked"/></c:if>
							> 여
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">생일</label>
					<div class="col-sm-6">
						<!-- <input type="number" min="1900" max="2023" value="1980" class="form-control" placeholder="ID" name='id'> -->
						<input type="text" name="birthyy" maxlength="4"
							placeholder="년(4자)" size="6" class="form-control w-25 d-inline"
							value="<c:out value='${year}'/>"> <select name="birthmm"
							class="form-control w-25 d-inline" id="birthmm">
							<option value="">월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select> <input type="text" name="birthdd" maxlength="2" placeholder="일"
							size="4" class="form-control w-25 d-inline"
							value="<c:out value='${day}'/>">
					</div>
				</div>
				<div class="form-group  row ">
					<label class="col-sm-2">이메일</label>
					<div class="col-sm-10">
						<input type="text" name="mail1" maxlength="50" value="${mail1}">@
						<select name="mail2" id="mail2">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>
						</select>
					</div>
				</div>
				<div class="form-group  row">
					<label class="col-sm-2">전화번호</label>
					<div class="col-sm-3">
						<input name="phone" type="text" class="form-control"
							placeholder="phone" value="<c:out value='${row.phone}'/>">

					</div>
				</div>
				<div class="form-group  row">
					<label class="col-sm-2 ">주소</label>
					<div class="col-sm-5">
						<input name="address" type="text" class="form-control"
							placeholder="address" value="<c:out value='${row.address}'/>">
					</div>
				</div>
				<div class="form-group  row">
					<div class="col-sm-offset-2 col-sm-10 ">
						<input type="button" class="btn btn-primary " value="등록"
							onclick="checkForm()"> <input type="reset"
							class="btn btn-primary " value="취소" onclick="reset()">
					</div>
				</div>
			</form>
		</c:forEach>
	</div>





	

	<!-- Scroll Top -->
	<a href="#" id="scroll-top"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Preloader -->
	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/typed.js/typed.umd.js"></script>
	<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

	<!-- Main JS File -->
	<script src="assets/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"
		integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
		crossorigin="anonymous"></script>
	<script>
		$(function() {

			init();

			function init() {
				setMailValue("${mail2}");
				setBirthValue("${month}");
			}

			function setMailValue(val) {
				var selectMail = document.getElementById("mail2");
				for (i = 0, j = selectMail.length; i < j; i++) {
					if (selectMail.options[i].value == val) {
						selectMail.options[i].selected = true;
						break;
					}
				}
			}

			function setBirthValue(val) {
				var selectBirth = document.getElementById("birthmm");
				for (i = 0, j = selectBirth.length; i < j; i++) {
					if (selectBirth.options[i].value == val) {
						selectBirth.options[i].selected = true;
						break;
					}
				}
			}

		})
		
		const form = document.newMember;
		
		function checkForm(){
    		if(!form.id.value){
    			alert("아이디를 입력하세요");
    			form.id.focus();
    			return false;
    		}
    		if(!form.password.value){
    			alert("비밀번호를 입력하세요");
    			form.password.focus();
    			return false;
    		}
    		if(!form.password_confirm.value){
    			alert("비밀번호 확인란을 확인하세요");
    			form.password_confirm.focus();
    			return false;
    		}
    		if(form.password.value != form.password_confirm.value){
    			alert("비밀번호확인란의 비밀번호를 동일하게 입력해주세요")
    			form.password_confirm.focus();
    			return false;
    		}
    		form.submit();
    	}
	</script>

</body>

</html>