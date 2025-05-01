<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="dbconn.jsp"%>
<%
String productId = request.getParameter("id");

String sql = "select * from product where p_productId=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, productId);
rs = pstmt.executeQuery();
if (rs.next()) {

}
%>
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
	padding-top: 100px;
}
</style>
<script>
	function updateFileName() {
		const input = document.getElementById("pImg")
		const fileNameLabel = document.getElementById("file-name")
		if (input.files.length > 0) {
			fileNameLabel.textContent = input.files[0].name;
		} else {
			fileNameLabel.textContent = "선택된 파일 없음"
		}
	}
</script>

</head>

<body class="index-page">

	<%@ include file="nav.jsp"%>
	<main class="main">
		<div class="container addPf">
			<h1>Edit Portfolio</h1>
			<br>
			<div class="row">
				<form action="processEditPortFolio.jsp" method="post"
					enctype="multipart/form-data">
					
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">포트폴리오
							타이틀</label> <input name="productId" type="text" class="form-control" readonly="readonly"
							id="exampleInputEmail1" aria-describedby="emailHelp"
							value="<%=rs.getString("p_productId")%>">
					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">설명</label>
						<textarea class="form-control" name="description" rows="10"
							id="message-field" required=""><%=rs.getString("p_description")%></textarea>
					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">카테고리</label>
						<div class="col-3">
							<input type="radio" id="Web" placeholder="" value="Web"
								name="category"
								<%if ("Web".equals(rs.getString("p_category"))) {%> checked
								<%}%>> <label for="Web"> Web </label> <input
								type="radio" id="PhotoShop" placeholder="" value="PhotoShop"
								name="category"
								<%if ("PhotoShop".equals(rs.getString("p_category"))) {%>
								checked <%}%>> <label for="PhotoShop"> PhotoShop
							</label>
						</div>
					</div>
					<div class="mb-3">
						<label for="subject-field" class="pb-2"></label> <input
							type="file" class="form-control" name="fileName"
							id="subject-field" value="파일선택">
					</div>

					<input type="submit" class="btn btn-success" value="완료">
				</form>
			</div>
		</div>
	</main>


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