<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="movie.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="member" class="movie.MemberMethod"/>

<% MovieMember temp = member.SearchMember(request.getParameter("KEY")); %>

<script type="text/javascript">
	function checkInsert()
	{
	    if(!document.userUpdate.member_id.value){
	        document.userUpdate.member_id.focus();
	        alert("id를 수정해주세요.");
	        return false;
	    }
	    if(!document.userUpdate.member_pw.value){
	        document.userUpdate.member_pw.focus();
	        alert("비밀번호를 수정해주세요.");
	        return false;
	    }
	    if(!document.userUpdate.member_name.value){
	        document.userUpdate.member_name.focus();
	        alert("이름를 수정해주세요.");
	        return false;
	    }
	    if(!document.userUpdate.member_tel.value){
	        document.userUpdate.member_tel.focus();
	         alert("전화번호를 수정해주세요.");
	         return false;
	    }
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<h1 style="text-align: center"> 유저 수정 </h1>
<div class="container justify-content-center border border-dark rounded" style="padding-top:30px; padding-bottom:30px;">
	<form action="contentSub/contentSub5_updateok.jsp" name="userUpdate" class="form-horizontal justify-content-center" onsubmit="return checkInsert();">
	  	<div class="form-group">
			<label for="item_name" class="col-sm-2 control-label">유저 이름</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="member_id" id="member_id" value="<%=temp.getMember_id()%>">
			</div>
		</div>
		
		<div class="form-group">
			<label for="item_director" class="col-sm-2 control-label">유저 패스워드</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="member_pw" id="member_pw" value="<%=temp.getMember_pw()%>">
			</div>
		</div>
		
		<div class="form-group">
			<label for="item_actor" class="col-sm-2 control-label">유저 이름</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="member_name" id="member_name" value="<%=temp.getMember_name()%>">
			</div>
		</div>

		<div class="form-group">
			<label for="item_info" class="col-sm-2 control-label">유저 전화번호</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="member_tel" id="member_tel" value="<%=temp.getMember_tel()%>">
			</div>
		</div>

		<br>
		<input type="submit" value="업로드" class="btn btn-dark" />  
	</form>
</div>


