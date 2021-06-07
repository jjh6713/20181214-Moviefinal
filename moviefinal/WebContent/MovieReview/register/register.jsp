<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회 원  가 입</title>
	<link rel="stylesheet" href="../StyleSheet/LoginRegisterStyleSheet.css" />
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
	
	<script type="text/javascript">
	    function checkInsert()
	    {
	        if(!document.registerInfo.member_id.value){
	        	document.registerInfo.member_id.focus();
	            alert("아이디를 입력해주세요.");
	            return false;
	        }
	        if(!document.registerInfo.member_pw.value){
	        	document.registerInfo.member_pw.focus();
	            alert("비밀번호를 입력해주세요.");
	            return false;
	        }
	        if(!document.registerInfo.member_name.value){
	        	document.registerInfo.member_name.focus();
	            alert("이름를 입력해주세요.");
	            return false;
	        }
	        if(!document.registerInfo.member_tel.value){
	        	document.registerInfo.member_tel.focus();
	            alert("전화번호를 입력해주세요.");
	            return false;
	        }
	    }
	</script>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3>회원가입</h3>
				</div>
				<div class="card-body">
				<!-- form start!! -->
					<form action="register_ok.jsp" name="registerInfo" method="post" onsubmit="return checkInsert();">
						<div class="input-group form-group">
						<!-- id, pw, name, tel -->
							<input type="text" class="form-control" name="member_id" placeholder="id">
						</div>
						<div class="input-group form-group">
							<input type="password" class="form-control" name="member_pw" placeholder="password">
						</div>
						<div class="input-group form-group">
							<input type="text" class="form-control" name="member_name" placeholder="name">
						</div>
						<div class="input-group form-group">
							<input type="text" class="form-control" name="member_tel" placeholder="tel">
						</div>
						<div class="form-group d-flex justify-content-center">
							<input type="submit" value="가입하기" class="btn float-right login_btn ">
						</div>
					</form>
					<div class="d-flex justify-content-center links">
						<a href="../login/login.jsp" ><font color="#ffffff">돌아가기</font></a>
					</div>
				<!-- fomr end!! -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>