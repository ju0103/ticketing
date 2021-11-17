<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>로그인</title>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- navbar -->
	<jsp:include page="../memberMain/member_Header.jsp" />
	
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-4 p-sm-5">
						<h5 class="card-title text-center mb-5 fw-light fs-5">로그인</h5>
						<form id="contactForm" method="post" action="./member_LoginOk.jsp">
							<div class="form-group mb-3">
								<label class="form-label" for="id">아이디</label>
								<input class="form-control" id="login_id" name="login_id" type="text" placeholder="아이디">
							</div>
							<div class="form-group mb-3">
								<label class="form-label" for="pwd">비밀번호</label>
								<input class="form-control" id="login_pwd" name="login_pwd" type="password" placeholder="Passwowrd">
							</div>
							<div class="d-grid">
								<button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">로그인</button>
							</div>
							<hr class="my-4">
							<div class="d-grid">
								<a href="../member/member_RegisterForm.jsp">회원이 아니신가요?</a>
		              		</div>
						</form>
	            	</div>
	        	</div>
	      	</div>
	    </div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../memberMain/member_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>