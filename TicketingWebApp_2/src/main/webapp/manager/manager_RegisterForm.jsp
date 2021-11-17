<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>회원가입</title>
	<script type="text/javascript" src="../js/check.js" charset="utf-8" ></script>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../managerMain/manager_Header.jsp" />

	<!-- manager register form -->
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-4 p-sm-5">
						<h5 class="card-title text-center mb-5 fw-light fs-5">관리자 등록</h5>
						<form id="contactForm" method="post" action="./manager_RegisterOk.jsp" name="reg_frm">
							<div class="mb-3">
								<label class="form-label" for="id">아이디</label>
								<input class="form-control" id="manager_id" name="manager_id" type="text" placeholder="아이디">
							</div>
							<div class="mb-3">
								<label class="form-label" for="pwd">비밀번호</label>
								<input class="form-control" id="manager_pwd" name="manager_pwd" type="password" placeholder="Passwowrd">
							</div>
							<div class="mb-3">
								<label class="form-label" for="pwd">비밀번호 확인</label>
								<input class="form-control" id="check_pwd" name="check_pwd" type="password" placeholder="Passwowrd">
							</div>
							<div class="mb-3">
								<label class="form-label" for="name">이름</label>
								<input class="form-control" id="manager_name" name="manager_name" type="text" placeholder="Name">
							</div>
							<div class="d-grid">
								<button class="btn btn-secondary btn-lg" type="button" onclick="check_ok()">관리자 등록</button>
							</div>
						</form>
	            	</div>
	        	</div>
	      	</div>
	    </div>
	</div>
	
	<jsp:include page="../managerMain/manager_Footer.jsp" />	
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>