<%@ page contentType = "text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="movie.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%
	ArrayList<MovieItem> item = BoardMethod.ItemCreate(); 
%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css" />
<link rel="stylesheet" href="StyleSheet/cards-gallery.css">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
<script>
    baguetteBox.run('.cards-gallery', { animation: 'slideIn'});
</script>
<h1 style="text-align: center"> 영화 목록 </h1>
   <section class="gallery-block cards-gallery">
	    <div class="container">
	        <div class="row">
	        <%
			int i=0;
			for(;i<item.size();i++){
	            out.println("<div class=\"col-md-6 col-lg-4\">");
	                out.println("<div class=\"card border-0 transform-on-hover\">");
	                	out.println("<img src=\"img/"+ item.get(i).getItem_image() +"  \" alt=\"Card Image\" class=\"card-img-top\">");
	                    out.println("<div class=\"card-body\">");
	                        out.println("<h6>"+item.get(i).getItem_name()+"</h6>");
	                        out.println("<p class=\"text-muted card-text\">"+ item.get(i).getItem_info() +"</p>");
	                    out.println("</div>");
	                out.println("</div>");
	            out.println("</div>");
			}
	        %>
	        </div>
	    </div>
    </section>