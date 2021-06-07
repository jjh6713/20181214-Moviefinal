<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("loginId");
	session.removeAttribute("loginLv");
	%><script type="text/javascript"> alert("로그아웃 되었습니다.");</script><%
	response.sendRedirect("../main.jsp");	
%>

