<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String edit=request.getParameter("edit");
	if(edit==null) {
		edit="";
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
.btn2 {
	margin-top: 10px;
}
</style>
<script>
function deleteConfirm(id){
	if(confirm("해당 상품을 삭제하시겠습니까?") == true){
		location.href="./DeletePortFolio.jsp?id="+id;
	}else{
		return
	}
}
</script>
</head>

<body class="index-page">

	<%@ include file="nav.jsp"%>
	<main class="main">

		<!-- Hero Section -->
		<section id="hero" class="hero section dark-background">

			<img src="assets/img/jbs.JPG" alt="" data-aos="fade-in" class="">

			<div class="container" data-aos="fade-up" data-aos-delay="100">
				<h2>Hakyun Park</h2>
				<p>
					I'm <span class="typed"
						data-typed-items="Developer, Designer, Developer, Designer">Developer</span><span
						class="typed-cursor typed-cursor--blink" aria-hidden="true"></span><span
						class="typed-cursor typed-cursor--blink" aria-hidden="true"></span>
				</p>
			</div>

		</section>
		<!-- /Hero Section -->

		<!-- About Section -->
		<section id="about" class="about section">

			<!-- Section Title -->
			<div class="container section-title" data-aos="fade-up">
				<h2>About</h2>

			</div>
			<!-- End Section Title -->

			<div class="container" data-aos="fade-up" data-aos-delay="100">

				<div class="row gy-4 justify-content-center">
					<div class="col-lg-4">
						<img src="assets/img/profile.jpg" class="img-fluid" alt="">
					</div>
					<div class="col-lg-8 content">
						<h2>웹 개발자 &amp; 디자이너</h2>
						<p class="fst-italic py-3">저는 고등학생 웹 개발자 박하균입니다. 웹 개발에 열정을 가지고
							다양한 프로젝트를 통해 실력을 쌓아가고 있습니다.</p>
						<div class="row">
							<div class="col-lg-6">
								<ul>
									<li><i class="bi bi-chevron-right"></i> <strong>생년월일:</strong>
										<span>2007.03.10</span></li>
									<li><i class="bi bi-chevron-right"></i> <strong>GitHub:</strong>
										<span>www.github.com/gkrbs9565</span></li>
									<li><i class="bi bi-chevron-right"></i> <strong>연락처:</strong>
										<span>010-3101-9565</span></li>
									<li><i class="bi bi-chevron-right"></i> <strong>주거지:</strong>
										<span>경기도 수원시</span></li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul>
									<li><i class="bi bi-chevron-right"></i> <strong>나이:</strong>
										<span>18</span></li>
									<li><i class="bi bi-chevron-right"></i> <strong>학력:</strong>
										<span>고등학교 재학중</span></li>
									<li><i class="bi bi-chevron-right"></i> <strong>이메일:</strong>
										<span>gkrbs9565@gmail.com</span></li>
									<li><i class="bi bi-chevron-right"></i> <strong>취업현황:</strong>
										<span>취업 준비중</span></li>
								</ul>
							</div>
						</div>
						<p class="py-3 AboutContents">
							저는 고등학생 웹 개발자로서, 다양한 기술을 배우고 창의적인 웹 애플리케이션을 개발하는 것을 목표로 하고 있습니다.<br>
							앞으로 프론트엔드와 백엔드 모두에 대한 이해를 깊이 있게 쌓아, 사용자에게 더 나은 경험을 제공하는 <br>
							개발자가 되고 싶습니다. 열정과 노력으로 지속적으로 성장하며, 실력을 향상시켜 나갈 것입니다.
						</p>
					</div>
				</div>

			</div>

		</section>
		<!-- /About Section -->


		<!-- Skills Section -->
		<section id="skills" class="skills section light-background">

			<!-- Section Title -->
			<div class="container section-title" data-aos="fade-up">
				<h2>Skills</h2>
			</div>
			<!-- End Section Title -->

			<div class="container" data-aos="fade-up" data-aos-delay="100">

				<div class="row skills-content skills-animation">

					<div class="col-lg-6">

						<div class="progress">
							<span class="skill"><span>HTML</span> <i class="val">95%</i></span>
							<div class="progress-bar-wrap">
								<div class="progress-bar" role="progressbar" aria-valuenow="95"
									aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
						<!-- End Skills Item -->

						<div class="progress">
							<span class="skill"><span>CSS</span> <i class="val">90%</i></span>
							<div class="progress-bar-wrap">
								<div class="progress-bar" role="progressbar" aria-valuenow="90"
									aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
						<!-- End Skills Item -->

						<div class="progress">
							<span class="skill"><span>JavaScript</span> <i class="val">65%</i></span>
							<div class="progress-bar-wrap">
								<div class="progress-bar" role="progressbar" aria-valuenow="65"
									aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
						<!-- End Skills Item -->

					</div>

					<div class="col-lg-6">

						<div class="progress">
							<span class="skill"><span>Java</span> <i class="val">40%</i></span>
							<div class="progress-bar-wrap">
								<div class="progress-bar" role="progressbar" aria-valuenow="40"
									aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
						<!-- End Skills Item -->

						<div class="progress">
							<span class="skill"><span>BootStrap</span> <i class="val">90%</i></span>
							<div class="progress-bar-wrap">
								<div class="progress-bar" role="progressbar" aria-valuenow="90"
									aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
						<!-- End Skills Item -->

						<div class="progress">
							<span class="skill"><span>Photoshop</span> <i class="val">65%</i></span>
							<div class="progress-bar-wrap">
								<div class="progress-bar" role="progressbar" aria-valuenow="65"
									aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
						<!-- End Skills Item -->

					</div>

				</div>

			</div>

		</section>
		<!-- /Skills Section -->

		<!-- Resume Section -->
		<section id="resume" class="resume section">

			<!-- Section Title -->
			<div class="container section-title" data-aos="fade-up">
				<h2>Resume</h2>

			</div>
			<!-- End Section Title -->

			<div class="container">

				<div class="row">

					<div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
						<h3 class="resume-title">저를 소개합니다!</h3>

						<div class="resume-item pb-0">
							<h4>박하균</h4>
							<p>
								<em>저는 노력과 끈기가 강한 신입 웹 개발자로, 항상 새로운 기술을 배우고 성장하려는<br>
									자세로 임하고 있습니다. 뛰어난 문제 해결 능력을 바탕으로 프로젝트를<br> 성공적으로 이끌어 가고있습니다.<br> 끊임없이 도전하며, 웹 개발 분야에서 더 나은 전문가로
									성장할 것입니다.
								</em>
							</p>
							<ul>
								<li>경기도 수원시 영통구 매탄동</li>
								<li>010-3101-9565</li>
								<li>gkrbs9565@gmail.com</li>
							</ul>
						</div>
						<!-- Edn Resume Item -->

						<h3 class="resume-title">학력</h3>
						<div class="resume-item">
							<h4>산남초등학교</h4>
							<h5>2014 ~ 2019</h5>
							<p>
								<em>졸업</em>
							</p>

						</div>
						<div class="resume-item">
							<h4>매원중학교</h4>
							<h5>2020 - 2022</h5>
							<p>
								<em>졸업</em>
							</p>

						</div>
						<!-- Edn Resume Item -->

						<div class="resume-item">
							<h4>수원정보과학고등학교</h4>
							<h5>2023 ~ 현재</h5>
							<p>
								<em>재학중</em>
							</p>

						</div>
						<!-- Edn Resume Item -->

					</div>

					<div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
						<h3 class="resume-title">제 학교생활을 소개합니다!</h3>
						<div class="resume-item">
							<h4>웹 디자인 기능사 취득반</h4>
							<h5>2023</h5>
							<p>
								<em>수원정보과학고등학교</em>
							</p>
							<ul>
								<li>웹 디자인 기능사의 실기 시험 문제를 풀어보며 기초 학습을 하였습니다.</li>
								<li>JQuery로 동적인 요소를 표현하며 상세 기능을 구현하는법을 배웠습니다.</li>


							</ul>
						</div>

						<!-- Edn Resume Item -->

						<div class="resume-item">
							<h4>미래유망 사업</h4>
							<h5>2023 ~ 현재</h5>
							<p>
								<em>수원정보과학고등학교</em>
							</p>
							<ul>
								<li>Html, Css, JavaScript의 기초와 심화학습을 하였습니다.</li>
								<li>부트스트랩의 이론을 학습 후 포트폴리오를 작업하였습니다.</li>
								<li>Java의 이론을 배운 후 현재 포트폴리오 작업을 하고있습니다.</li>

							</ul>
						</div>

						<!-- Edn Resume Item -->

						<div class="resume-item">
							<h4>방송부</h4>
							<h5>2023 ~ 현재</h5>
							<p>
								<em>수원정보과학고등학교</em>
							</p>
							<ul>
								<li>2023년 학교 입학후 바로 면접후 입단하게되었습니다.</li>
								<li>코딩과 관련된 업무를 배우진 않았지만 작은 사회로써 사회생활과 리더십을 <br>배운 소중한
									추억입니다.
								</li>
								<li>현재는 기장으로써 사업 진행과 부서 관리를 총괄하고있습니다.</li>
								<li>제가 가장 아끼는 가족들이자 친구들입니다❤️</li>

							</ul>
						</div>

						<!-- Edn Resume Item -->

					</div>

				</div>

			</div>

		</section>
		<!-- /Resume Section -->

		<!-- Portfolio Section -->
		<section id="portfolio" class="portfolio section light-background">

			<!-- Section Title -->
			<div class="container section-title" data-aos="fade-up">
				<h2>Portfolio</h2>
			</div>
			<!-- End Section Title -->

			<div class="container">

				<div class="isotope-layout" data-default-filter="*"
					data-layout="masonry" data-sort="original-order">

					<ul class="portfolio-filters isotope-filters" data-aos="fade-up"
						data-aos-delay="100">
						
					</ul>
					<!-- End Portfolio Filters -->

					<div class="row gy-4 isotope-container" data-aos="fade-up"
						data-aos-delay="200">

						<%@ include file="dbconn.jsp"%>
						<%
						//PreparedStatement pstmt = null;
						//ResultSet rs = null;
						String sql = "select * from product";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						while (rs.next()) {
						%>

						<div
							class="col-lg-4 col-md-6 portfolio-item isotope-item">
							<div class="portfolio-content h-100">
								<img src="assets/img/portfolio/<%=rs.getString("p_filename")%>"
									class="img-fluid" alt="">
								<div class="portfolio-info">
									<h4><%=rs.getString("p_productId")%></h4>
									<p><%=rs.getString("p_description")%></p>
								</div>
							</div>
							<%
                        if(edit.equals("update")){
                    	%>
							<a class="btn btn-success btn2"
								href="EditPortFolio.jsp?id=<%=rs.getString("p_productId") %>">수정
								&raquo;</a>
							<%
                        }else if(edit.equals("delete")){
             			%>
							<a href="#" class="btn btn-danger btn2"
								onclick="deleteConfirm('<%=rs.getString("p_productId") %>')">삭제
								&raquo;</a>
							<%
                  			}
              			%>
						</div>



						<%
                  			}
              			%>

					</div>
					<!-- End Portfolio Container -->

				</div>

			</div>

		</section>
		<!-- /Portfolio Section -->



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