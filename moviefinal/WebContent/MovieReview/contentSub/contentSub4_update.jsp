<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="movie.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="item" class="movie.ItemMethod"/>
<% MovieItem temp = item.SearchItem(request.getParameter("KEY")); %>

<script type="text/javascript">
	function checkInsert()
	{
	    if(!document.itemInsert.item_name.value){
	        document.itemInsert.item_name.focus();
	        alert("영화제목을 입력해주세요.");
	        return false;
	    }
	    if(!document.itemInsert.item_director.value){
	        document.itemInsert.item_director.focus();
	        alert("영화감독을 입력해주세요.");
	        return false;
	    }
	    if(!document.itemInsert.item_actor.value){
	        document.itemInsert.item_actor.focus();
	        alert("영화배우를 입력해주세요.");
	        return false;
	    }
	    if(!document.itemInsert.item_date.value){
	        document.itemInsert.item_date.focus();
	         alert("영화개봉일을 입력해주세요.");
	         return false;
	    }
	    if(!document.itemInsert.item_info.value){
	        document.itemInsert.item_info.focus();
	         alert("영화정보를 입력해주세요.");
	         return false;
	    }
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<h1 style="text-align: center"> 영화 수정 </h1>
<div class="container justify-content-center border border-dark rounded" style="padding-bottom:60px;"">
	<form action="contentSub/contentSub4_updateok.jsp" name="itemUpdate" class="form-horizontal justify-content-center" onsubmit="return checkInsert();" method="post" enctype="Multipart/form-data">
	  	<div class="form-group">
			<label for="item_name" class="col-sm-2 control-label">영화 이름</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="item_name" id="item_name" value="<%=temp.getItem_name()%>">
			</div>
		</div>
		
		<div class="form-group">
			<label for="item_director" class="col-sm-2 control-label">영화 감독</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="item_director" id="item_director" value="<%=temp.getItem_director()%>">
			</div>
		</div>
		
		<div class="form-group">
			<label for="item_actor" class="col-sm-2 control-label">영화 배우</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="item_actor" id="item_actor" value="<%=temp.getItem_actor()%>">
			</div>
		</div>

		<div class="form-group">
			<label for="item_info" class="col-sm-2 control-label">영화 줄거리</label>
			<div class="col-sm-8">
				<textarea class="form-control" rows="10" name="item_info" id="item_info"><%=temp.getItem_info()%></textarea>
			</div>
		</div>

		<div class="form-group">
			<label for="item_date" class="col-sm-2 control-label">영화 개봉일</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="item_date" id="item_date" value="<%=temp.getItem_date() %>">
			</div>
		</div>
		
		<div class="form-group">
			<label for="item_date" class="col-sm-2 control-label">영화 링크</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="item_link" id="item_link" value="https://www.youtube.com/watch?v=<%=temp.getItem_link() %>">
			</div>
		</div>
		
		<div class="form-group">
			<label for="item_image" class="col-sm-2 control-label">영화 이미지</label>
			<input type="file" class="btn btn-dark btn-sm btn-block" name="item_image"/>
		</div>
		<br>
		<input type="submit" value="업로드" class="btn btn-dark" />  
	</form>
</div>


