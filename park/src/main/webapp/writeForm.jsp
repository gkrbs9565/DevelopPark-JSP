<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap"
	rel="stylesheet">

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
<%
String name = (String) request.getAttribute("name");
%>
<style>
html, body {
	padding-top: 60px;
}

.write {
	margin-left: 400px;
	margin-bottom: 140px;
}
.writeTitle{
	margin-left: 400px;
}
</style>
<script>
	function checkForm() {

		if (!document.newWrite.name.value) {
			alert("성명을 입력하세요")
			document.newWrite.name.focus();
			return false;
		}
		if (!document.newWrite.subject.value) {
			alert("제목을 입력하세요")
			document.newWrite.subject.focus();
			return false;
		}
		if (!document.newWrite.content.value) {
			alert("내용을 입력하세요")
			document.newWrite.content.focus();
			return false;
		}
	}
</script>
</head>

<body>

	<!-- header include-->
	<%@ include file="nav.jsp"%>

	<!-- Section Title -->
	<div class="container section-title writeTitle">
		<h2>게시판</h2>
	</div>
	<!-- End Section Title -->
	<div class="container write" algin="center">
		<form name="newWrite" action="./BoardWriteAction.do"
			onsubmit="return checkForm()" method="post">
			<input type="hidden" name="id" value="${sessionId}">
			<div class="mb-3">
				<label for="exampleInputName" class="form-label">이름</label> <input
					type="text" class="form-control" id="exampleInputName"
					aria-describedby="emailHelp" value="<%=name%>" name="name">

			</div>
			<div class="mb-3">
				<label for="exampleInputTitle" class="form-label">제목</label> <input
					type="text" class="form-control" id="exampleInputTitle"
					aria-describedby="emailHelp" name="subject">

			</div>
			<div class="mb-3">
				<label for="exampleInputContent" class="form-label">내용</label>
				<textarea class="form-control mb-3" id="exampleInputContent"
					rows="10" name="content"></textarea>

				<input type="submit" class="btn btn-success" value="등록"> <input
					type="reset" class="btn btn-danger" value="취소"> <input
					type="button" class="btn btn-primary" value="이전"
					onclick="history.back()">
			</div>
		</form>
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

</body>

</html>