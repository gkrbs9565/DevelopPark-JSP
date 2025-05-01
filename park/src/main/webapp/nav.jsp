<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
        String sessionId = (String) session.getAttribute("sessionId");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header id="header" class="header dark-background d-flex flex-column">
		<i class="header-toggle d-xl-none bi bi-list"></i>

		<div class="profile-img">
			<img src="assets/img/smallProfile.jpg" alt=""
				class="img-fluid rounded-circle">
		</div>

		<a href="index.jsp"
			class="logo d-flex align-items-center justify-content-center"> <!-- Uncomment the line below if you also wish to use an image logo -->
			
			<h1 class="sitename">Hakyun Park</h1>
		</a>

		<div class="social-links text-center">
			<a href="https://www.facebook.com/profile.php?id=100032130522654"
				class="facebook"><i class="bi bi-facebook"></i></a> <a
				href="https://www.instagram.com/h.xyn_07" class="instagram"><i
				class="bi bi-instagram"></i></a> <a
				href="https://www.github.com/gkrbs9565" class="github"><i
				class="bi bi-github"></i></a>
		</div>

		<nav id="navmenu" class="navmenu">
			<ul>
				<li><a href="index.jsp" class="active"><i
						class="bi bi-house navicon"></i>Home</a></li>
				<li><a href="#about"><i class="bi bi-person navicon"></i>
						About</a></li>
				<li><a href="#skills"><i class="bi bi-hdd-stack navicon"></i>
						Skills</a></li>
				<li><a href="#resume"><i
						class="bi bi-file-earmark-text navicon"></i> Resume</a></li>
				<li class="dropdown"><a href="#portfolio"><i
						class="bi bi-images navicon"></i> <span>Portfolio</span> <i
						class="bi bi-chevron-down toggle-dropdown"></i></a>
					<ul>
						<li><a href="AddPortFolio.jsp">Add PortFolio</a></li>
						<li><a href="index.jsp?edit=update">Edit PortFolio</a></li>
						<li><a href="index.jsp?edit=delete">Delete PortFolio</a></li>
					</ul></li>


				<li class="dropdown"><c:choose>
						<c:when test="${not empty sessionScope.sessionId}">
							<a href="#"> <i class="bi bi-door-open navicon"></i> <span><span
									style="color: #149ddd;">${sessionScope.sessionId}</span>님 로그인
									중</span> <i class="bi bi-chevron-down toggle-dropdown"></i>
							</a>
							<ul>
								<li><a href="logoutMember.jsp">Logout</a></li>
								<li><a href="editMember.jsp">Edit Information</a></li>
							</ul>
						</c:when>

						<c:otherwise>
							<a href="#"> <i class="bi bi-door-open navicon"></i> <span>
									Log In</span> <i class="bi bi-chevron-down toggle-dropdown"></i>
							</a>
							<ul>
								<li><a href="loginMember.jsp">Sign In</a></li>
								<li><a href="addMember.jsp">Sign Up</a></li>
							</ul>
						</c:otherwise>
					</c:choose></li>

				<li><a href='<c:url value="/BoardList.do?pageNum=1"/>'><i
						class="bi bi-file-earmark-text navicon"></i>Forum</a></li>
			</ul>
		</nav>

	</header>

</body>
</html>