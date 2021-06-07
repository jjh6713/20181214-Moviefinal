<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div id="main_header_nav">
	<!-- 네비바 -->
	<div id="nav_bar" style="height:100%; width:100%;">
		<nav class="navbar navbar-expand-lg navbar-dark" style="
			background-image: linear-gradient(to right, #434343 0%, black 100%); height:100%; width:100%;"><!-- 색상변경, 사이즈조절 -->
	      <div class="container">
	      	<!-- 로고부분 brand는 강조-->
	        <a class="navbar-brand" href="main.jsp" style="font-family: 'Gugi', cursive; font-size:30px;">무비조아</a>
	        <!-- 로고부분 -->
	        <!-- data-target는 모바일 설정 -->
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	          <span class="navbar-toggler-icon"></span>
	        </button>
        	<div class="collapse navbar-collapse" id="navbarResponsive">
	          <ul class="navbar-nav">
	          <!-- 메뉴1 -->
	            <li class="nav-item ">
			        <a class="nav-link" href="main.jsp?CONTENTPAGE=contentSub/contentSub1.jsp">영화 목록</a>
			    </li>
	          <!-- 메뉴2 -->
	            <li class="nav-item ">
			        <a class="nav-link" href="main.jsp?CONTENTPAGE=contentSub/contentSub2.jsp">예고편</a>
			    </li>
	          <!-- 메뉴3 -->
	            <li class="nav-item ">
			        <a class="nav-link" href="main.jsp?CONTENTPAGE=contentSub/contentSub3.jsp">영화 리뷰</a>
			    </li>
			  <!-- 어드민 -->
			  <% 
			  if(session.getAttribute("loginLv")!=null){
				  if(((String)session.getAttribute("loginLv")).equals("1")){      
				  // 메뉴4 
		            	out.println("<li class=\"nav-item \">");
				        	out.println("<a class=\"nav-link\" href=\"main.jsp?CONTENTPAGE=contentSub/contentSub4.jsp\">영화 관리</a>");
				    	out.println("</li>");
				  // 메뉴5 
		            	out.println("<li class=\"nav-item \">");
				        	out.println("<a class=\"nav-link\" href=\"main.jsp?CONTENTPAGE=contentSub/contentSub5.jsp\">유저 관리</a>");
				   		out.println("</li>");
				  }
			  }
			  %>
			  <!-- 로그인 -->
			  <%
			 	if(session.getAttribute("loginId")==null){
					out.println("<a href=\"login/login.jsp\" class=\"d-flex justify-content-center\">");
						out.println("<img style=\"height:38px;\" src='img/login.png'/>");
					out.println("</a>");
			 	}else{
			 		out.println("<a class=\"nav-link\" href=\"#\">"+(String)session.getAttribute("loginId")+"님 Welcome<span class=\"sr-only\">(current)</span></a>");
					out.println("<a href=\"login/logout.jsp\" class=\"d-flex justify-content-center\">");
						out.println("<img style=\"height:38px;\" src='img/logout.png'/>");
					out.println("</a>");
			 	}
				%>
	         </ul>
	        </div>
	      </div>
	   	</nav>
	 </div>
    <!-- 네비바 -->
</div>