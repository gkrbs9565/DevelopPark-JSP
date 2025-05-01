<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="mvc.model.BoardDTO" %>      
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


<%
  	int pageNum = ((Integer)request.getAttribute("pageNum")).intValue();
  	List boardList = (List)request.getAttribute("boardlist");
  	int total_record = (Integer)request.getAttribute("total_record");
  	int total_page = (Integer)request.getAttribute("total_page");
%>
<style>
 html,body{
 padding-top:60px;
 }
 .total_record{
 padding-left:1100px;
 }
 
 .forum{
 	margin-left: 400px;
 	margin-bottom: 160px;
 }
 .forumTitle{
 	margin-left: 400px;
 }
 </style>
 
</head>

<body>
  
  <!-- header include-->
  <%@ include file="nav.jsp" %>
<script >
 	function checkForm(){
 		if(${sessionId == null}){
 			alert("로그인 해주세요")
 			location.href="loginMember.jsp"
 			return false;
 		}
 		location.href="./boardWrite.do?id=<%=sessionId%>";
 	}
 	
 </script>
	<!-- Section Title -->
	<div class="container section-title forumTitle">
		<h2>게시판</h2>

	</div>
	<!-- End Section Title -->
    <div class="container forum">
        <form action='<c:url value="/BoardList.do"/>' method="post">
            <div class="text-center">
                <span ><h3 class="total_record"><b>전체 <%=total_record %>건</b></h3></span>
            </div>
            <div style="padding-top:100px">
                <table class="table table-hover" border="1">
                    <tr>
                       <th>번호</th>
                       <th>제목</th>
                       <th>작성일</th>
                       <th>수정일</th>
                       <th>조회</th>
                       <th>글쓴이</th>
                    </tr>
                    <%
                       for(int i=0; i<boardList.size(); i++){
                    	   BoardDTO boardDTO = (BoardDTO)boardList.get(i);
                    %>
                    <tr>
                        <td><%=boardDTO.getNum() %></td>
                        <td><a href="./BoardViewAction.do?num=<%=boardDTO.getNum()%>&pageNum=<%=pageNum%>">
                        <%=boardDTO.getSubject() %></a></td>
                        <td><%=boardDTO.getRegistDay() %></td>
                        <td><%=boardDTO.getUpdateDay() %></td>
                        <td><%=boardDTO.getHit()%></td>
                        <td><%=boardDTO.getName()%></td>
                    </tr>	 
                    <%  
                       }
                    %>
                </table>
            </div>
            
            <div class="text-center">
                <table width="100%">
                    <tr>
                       <td width="150px" align="left">
                           <select name="items" class="txt">
                              <option value="subject">제목에서</option>
                              <option value="content">본문에서</option>
                              <option value="name">글쓴이에서</option>
                           </select>
                           <input type="text" name="text"/>
                           <input type="submit"  class="btn btn-primary" value="검색"/>
                           <a class="btn btn-success" href="<c:url value='/BoardList.do?pageNum=1'/>">검색 초기화</a>

                       </td>
                       <td width="100" align="right">
                          <a class="btn btn-warning" onclick="checkForm()">글쓰기</a>
                       </td>
                    </tr>
                </table>
            </div>
            
            <!-- 페이징 구조 추가 -->
            <div align="center">
                <c:set var="pageNum" value="<%=pageNum %>"/>
                <c:forEach var="i" begin="1" end="<%=total_page %>">
                    <c:if test="${items != null && text != null}">
                       <a href="<c:url value="/BoardList.do?pageNum=${i}&items=${items}&text=${text}"/>">
                          <c:choose>
                             <c:when test="${pageNum==i}">
                                 <b>[${i}]</b>
                             </c:when>
                             <c:otherwise>
                                  [${i}]
                             </c:otherwise>
                          </c:choose>
                       </a>
                    </c:if>
                    <c:if test="${items == null && text == null}">
                       <a href="<c:url value="/BoardList.do?pageNum=${i}"/>">
                          <c:choose>
                             <c:when test="${pageNum==i}">
                                 <b>[${i}]</b>
                             </c:when>
                             <c:otherwise>
                                  [${i}]
                             </c:otherwise>
                          </c:choose>
                       </a>
                    </c:if>
                </c:forEach>
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