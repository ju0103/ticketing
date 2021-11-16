<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>회원가입</title>
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
						<h5 class="card-title text-center mb-5 fw-light fs-5">회원가입</h5>
						<form id="contactForm" method="post" action="./member_RegisterOk.jsp">
							<div class="mb-3">
								<label class="form-label" for="id">아이디</label>
								<input class="form-control" id="member_id" name="member_id" type="text" placeholder="아이디">
							</div>
							<div class="mb-3">
								<label class="form-label" for="pwd">비밀번호</label>
								<input class="form-control" id="member_pwd" name="member_pwd" type="password" placeholder="Passwowrd">
							</div>
							<div class="mb-3">
								<label class="form-label" for="pwd">비밀번호 확인</label>
								<input class="form-control" id="check_pwd" name="check_pwd" type="password" placeholder="Passwowrd">
							</div>
							<div class="mb-3">
								<label class="form-label" for="name">이름</label>
								<input class="form-control" id="member_name" name="member_name" type="text" placeholder="Name">
							</div>
							<div class="mb-3">
								<label class="form-label" for="email">이메일</label>
								<input class="form-control" id="member_email" name="member_email" type="email" placeholder="Email Address">
							</div>
							<hr class="my-4">
							<div class="d-grid">
								<button class="btn btn-primary text-uppercase fw-bold" type="submit">회원가입</button>
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