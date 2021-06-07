<%@ page contentType = "text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="movie.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css" />
<link rel="stylesheet" href="StyleSheet/cards-gallery.css">

<h1 style="text-align: center"> 예고편 </h1>

<%
	ArrayList<MovieItem> item = BoardMethod.ItemCreate(); 
%>


<section class="gallery-block cards-gallery">
	<div class="container">
		<div class="row">
	        <%
			for(int i=0;i<item.size();i++){
	            out.println("<div class=\"col-md-6 col-lg-4\">");
	                out.println("<div class=\"card border-0 transform-on-hover\">");
	                	out.println("<a class=\"lightbox\" href=\"https://www.youtube.com/watch?v="+ item.get(i).getItem_link()+"\">");
	                		out.println("<img src=\"https://img.youtube.com/vi/"+ item.get(i).getItem_link()+"/sddefault.jpg\" class=\"card-img-top\">");
	                	out.println("</a>");
	                    out.println("<div class=\"card-body\">");
	                        out.println("<h6>"+item.get(i).getItem_name()+"</h6>");
	                    out.println("</div>");
	                out.println("</div>");
	            out.println("</div>");
			}
	        %>
	        
		</div>
	</div>
</section>
