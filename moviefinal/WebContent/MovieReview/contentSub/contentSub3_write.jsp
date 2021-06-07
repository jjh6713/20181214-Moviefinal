<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page contentType = "text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="movie.*"%>
<%@page import="java.sql.*"%>




<script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<style>
	input[type='radio'] {
	        display: none;    /* 실제 라디오버튼 없애기 */
	}
	input[type="radio"]+label{
	  	background:url('img/star1.png');
	  	background-size:contain;
	  	display: inline-block;
	  	width: 40px; 
        height: 40px;
	}
	input[type="radio"]:checked + label{ 
		background: url('img/star2.png');
	  	display: inline-block;
	  	background-size:contain;
	  	width: 40px; 
        height: 40px;
	}
</style>

<h1 style="text-align: center"> 글쓰기 </h1>

<div class="container">
	<form action="contentSub/contentSub3_write_ok.jsp" method="post">
	
		<div class="form-group row">
			<label for="item_name" class="col-sm-2 col-form-label">Movie Select</label> 
			<select id="item_name" class="custom-select my-1 mr-sm-2" name="item_name">
				<%
					ArrayList<MovieItem> item = BoardMethod.ItemCreate();
					int j=0;
					for(int i=0;i<item.size();i++){
			    		out.println("<option value=\""+item.get(i).getItem_name()+"\">"+item.get(i).getItem_name()+"</option>");
					}
			    %>
			</select>
				
			<!-- 미완 -->
			<%
				//out.println("<img src=\"img/"+ item.get(j).getItem_image() +"\" style=\"width:100px; height:100px;\" alt=\"Card Image\" class=\"card-img-top\">");
			%>
		</div>
		<div class="form-group row">
			<label for="content" class="col-sm-2 col-form-label">Movie Comment</label> 
			<textarea class="col-sm-10"  rows="4" name="board_content" id="content"></textarea>
		</div>
		
		<div class="form-group row">
			<label for="board_rating" class="col-sm-2 col-form-label">Movie Rating</label> 
			<input type="radio" id="starR1" name="board_rating" value="1">
			<label for="starR1"></label>
			<input type="radio" id="starR2" name="board_rating" value="2">
			<label for="starR2"></label>
			<input type="radio" id="starR3" name="board_rating" value="3">
			<label for="starR3"></label>
			<input type="radio" id="starR4" name="board_rating" value="4">
			<label for="starR4"></label>
			<input type="radio" id="starR5" name="board_rating" value="5">
			<label for="starR5"></label>
		</div>
		<button type="submit" class="btn btn-outline-dark">작성완료</button>
	</form>
</div>
	