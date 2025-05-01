<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<!DOCTYPE html>
<html>
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
<%
BoardDTO notice = (BoardDTO) request.getAttribute("board");
int num = (Integer) request.getAttribute("num");
int nowpage = (Integer) request.getAttribute("pageNum");
%>
<style>
html, body {
	padding-top: 100px;	

}
.view{
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
		if (!document.newWrite.title.value) {
			alert("제목을 입력하세요")
			document.newWrite.title.focus();
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
	<div class="container section-title view">
		<h2>게시판</h2>
	</div>
	<!-- End Section Title -->
	<div class="container view">
		<form name="newWrite"
			action="./BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"
			onsubmit="return checkForm()" method="post">
			<div class="mb-3">
				<label for="exampleInputName" class="form-label">이름</label> <input
					type="text" class="form-control" id="exampleInputName"
					aria-describedby="emailHelp" value="<%=notice.getName()%>"
					name="name">

			</div>
			<div class="mb-3">
				<label for="exampleInputTitle" class="form-label">제목</label> <input
					type="text" class="form-control" id="exampleInputTitle"
					aria-describedby="emailHelp" name="title"
					value="<%=notice.getSubject()%>">

			</div>
			<div class="mb-3">
				<label for="exampleInputContent" class="form-label">내용</label>
				<textarea class="form-control mb-3" id="exampleInputContent"
					rows="10" name="content"><%=notice.getContent()%></textarea>
				<c:set var="userId" value="<%=notice.getId()%>" />
				<c:if test="${sessionId == userId}">
					<input type="submit" class="btn btn-success" value="수정">
					<a href="./BoardDeleteAction.do?pageNum=<%=nowpage%>&num=<%=notice.getNum()%>" class="btn btn-danger">삭제</a>
				</c:if>
				<a href="./BoardList.do?pageNum=<%=nowpage%>" class="btn btn-primary">목록</a>
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
