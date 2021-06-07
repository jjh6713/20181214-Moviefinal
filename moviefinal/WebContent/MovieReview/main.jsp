<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE HTML>
<html>
<head>
	<!-- 기본틀 -->
	<link rel="stylesheet" href="StyleSheet/StyleSheet.css" />
	<!-- 한글 -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- jquery bootstrap -->
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
	<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"> </script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
 	
 	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
	
	<title> MovieReview </title>
	<style>
	</style>
	<% String contentPage = request.getParameter("CONTENTPAGE");
		if(contentPage == null){
			contentPage="frame/main_section.jsp";
		}
		
		String loginId = (String)session.getAttribute("loginId");
		String loginLv = (String)session.getAttribute("loginLv");
		
	%>
</head>
<body>
	<jsp:include page="frame/main_header.jsp" flush="false"/>
	<jsp:include page='<%=contentPage %>' flush="false" />
	<jsp:include page="frame/main_footer.jsp" flush="false"/>
</body>
</html>