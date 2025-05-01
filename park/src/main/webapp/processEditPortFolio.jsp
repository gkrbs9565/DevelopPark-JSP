<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %> --%>
<%@ include file="dbconn.jsp"%>
<%
request.setCharacterEncoding("UTF-8");

String filename = "";
String realFolder = application.getRealPath("/assets/img/portfolio/");
String encType = "utf-8";
int maxSize = 5 * 1024 * 1024; //5MB

//이미지 등록시 필요한 MultipartRequest의 생성자 함수를 이용하여 이미지 업로드에 대한 정보 설정
MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
String productTitle = multi.getParameter("productId");
String description = multi.getParameter("description");
String category = multi.getParameter("category");



Enumeration files = multi.getFileNames();
String fname = (String) files.nextElement();
String fileName = multi.getFilesystemName(fname);

String sql = "select * from product where p_productId =?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, productTitle);
rs = pstmt.executeQuery();

if (rs.next()) {
	if (fileName != null) {
		sql = "update product set p_description =?, p_category =?, p_filename =? where p_productId =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, description);
		pstmt.setString(2, category);
		pstmt.setString(3, fileName);
		pstmt.setString(4, productTitle);
		pstmt.executeUpdate();
	} else {
		sql = "update product set p_description =?, p_category =? where p_productId =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, description);
		pstmt.setString(2, category);
		pstmt.setString(3, productTitle);
		pstmt.executeUpdate();
	}
}

if(rs != null)
	rs.close();
if(pstmt != null)
	pstmt.close();
if(conn != null)
	conn.close();

response.sendRedirect("index.jsp?edit=update#products");
%>
