<%@page import="movie.ItemMethod"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<jsp:useBean id="item" class="movie.ItemMethod"/>

<%item.UpdateItem(request);%>


<script>
	alert('update OK');
	location.href='../main.jsp?CONTENTPAGE=contentSub/contentSub1.jsp';
</script>



