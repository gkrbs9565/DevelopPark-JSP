<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


<style type="text/css">
.addPf {
	margin-bottom: 290px;
	padding-top: 100px;
}
</style>


</head>

<body class="index-page">

	<%@ include file="nav.jsp"%>
	<main class="main">
		<div class="container addPf">
			<h1>Add Portfolio</h1>
			<br>
			<div class="row">
				<form action="addProcessPortFolio.jsp" method="post" enctype="multipart/form-data">
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">포트폴리오
							타이틀</label> <input name="newPortfolio" type="text" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp">
					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">설명</label>
						<textarea class="form-control" name="description" rows="10"
							id="message-field" required=""></textarea>
					</div>
					<div class="mb-3">
					<label for="exampleInputPassword1" class="form-label">카테고리</label>
						<div class="col-3">
							<input type="radio" id="Web" placeholder="" value="Web"
								name="category" checked> <label for="Web"> Web </label>
							<input type="radio" id="PhotoShop" placeholder=""
								value="PhotoShop" name="category"> <label
								for="PhotoShop"> PhotoShop </label>
						</div>
					</div>
					<div class="mb-3">
						<label for="subject-field" class="pb-2"></label> <input
							type="file" class="form-control" name="fileName"
							id="subject-field" value="파일선택">
					</div>

					<button type="submit" class="btn btn-success">완료</button>
				</form>
			</div>
		</div>
	</main>

	<%@ include file="footer.jsp"%>

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