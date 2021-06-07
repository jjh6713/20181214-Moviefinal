<%@page import="movie.MemberMethod"%>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
<jsp:useBean id="member" class="movie.MovieMember">
	<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
//response.sendRedirect ë¡ ë³´ë´ë©´ìë¨!! 
//ì´ì  : out.print~~~ ë ì¶ë ¥ê°ë¥í html ì½ëë¥¼ ìì±íê² ì¦ ìë²ìì í´ë¼ì´ì¸í¸ì ë³´ë´ì¤ ë¬¸ìì´ë¤ì
//ë²í¼ì ê¸°ìíìë¿ ìì§ í´ë¼ì´ì¸í¸ì ì ë¬ëê²ì ìë ê·¸ë¬ë send~~ ë¥¼ ë§ëëìê° ë°ë¡ ì´ëí´ë²ë¦¬ê¸°ëë¬¸ì
//sendRe~~ ë³´ë¤ë location ì´ì©í´ì¼í¨!!
	request.setCharacterEncoding("EUC-KR");
	if(MemberMethod.overlapCheck(member.getMember_id())){
		MemberMethod.insertMember(member);
		
		out.println("<script>");
		out.println("alert('Register OK')");
		out.println("location.href='../login/login.jsp'");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('Your ID is already in use')");
		out.println("location.href='../register/register.jsp'");
		out.println("</script>");
	}
%>


