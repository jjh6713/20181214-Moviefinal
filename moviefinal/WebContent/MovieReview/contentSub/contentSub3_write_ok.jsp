<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page contentType = "text/html;" pageEncoding="UTF-8"%>
<%@page import="movie.*"%>
<%@page import="java.sql.*"%>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<!-- 미완 -->
<%
	request.setCharacterEncoding("UTF-8");

	String board_comment = request.getParameter("board_content");
	//100자
	String board_rating = request.getParameter("board_rating");
	//레이팅
	String item = request.getParameter("item_name");
	//아이템
	
	
	
	Boolean ck = BoardMethod.BoardInsert(board_comment, board_rating, (String)session.getAttribute("loginId"), item);
	
	
	if(ck==true){
		out.println("<script>");
		out.println("alert('Insert OK')");
		out.println("location.href='../main.jsp?CONTENTPAGE=contentSub/contentSub3.jsp'");
		out.println("</script>");
	}else if(ck==false){
		out.println("<script>");
		out.println("alert('Insert fail')");
		out.println("location.href='../main.jsp?CONTENTPAGE=contentSub/contentSub3.jsp'");
		out.println("</script>");
	}
%>