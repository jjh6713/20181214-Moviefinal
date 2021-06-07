<%@page import="movie.ItemMethod"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="item" class="movie.ItemMethod"/>

<%
	request.setCharacterEncoding("UTF-8");

	item.InsertItem(request);

	out.println("<script>");
	out.println("alert('Insert OK')");
	out.println("location.href='../main.jsp?CONTENTPAGE=contentSub/contentSub1.jsp'");
	out.println("</script>");
	
%>



