<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login test</title>
	<link rel="stylesheet" href="../StyleSheet/LoginRegisterStyleSheet.css" />
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
	
	<script type="text/javascript">
	        function checkInsert()
	        {
	            if(!document.userInfo.id.value){
	            	document.userInfo.id.focus();
	                alert("아이디를 입력해주세요.");
	                return false;
	            }
	            
	            if(!document.userInfo.pw.value){
	            	document.userInfo.pw.focus();
	                alert("비밀번호를 입력해주세요.");
	                return false;
	            }
	        }
	</script>
	<%
		String pass=request.getParameter("pass");
		if(pass!=null&&pass.equals("0")){
			%><script type="text/javascript"> alert("비밀번호를 확인해주세요.");</script><%
		}else if(pass!=null&&pass.equals("-1")){
			%><script type="text/javascript"> alert("아이디를 확인해주세요.");</script><%
		}
	%>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3>로그인</h3>
				</div>
				<div class="card-body">
				<!-- fomr start!! id pw -->
					<form action="login_ok.jsp" method="post" name="userInfo" onsubmit="return checkInsert();">
						<!-- 폼 그룹 -->
						<div class="input-group form-group">
							<!-- 아이콘 영역임 -->
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<!-- 아이콘 영역임 -->
							<input type="text" class="form-control" name="id" placeholder="id">
						</div>
						<!-- 폼 그룹 -->
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control" name="pw" placeholder="password">
						</div>
						<div class="form-group d-flex justify-content-center">
							<input type="submit" value="Login" class="btn float-right login_btn">
						</div>
					</form>
				<!-- fomr end!! -->
				</div>
				<div class="card-footer">
					<div class="d-flex justify-content-center links">
						Don't have an account?<a href="../register/register.jsp" >회원가입</a>
						/<a href="../main.jsp" >돌아가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>