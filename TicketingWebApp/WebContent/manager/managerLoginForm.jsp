<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>로그인</title>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="../managerMain/managerHeader.jsp" />
	
	<div class="container py-4">
		<div class="text-center mb-5">
			<h2 class="fw-bolder">로그인</h2>
		</div>
		<form id="contactForm" method="post" action="./managerLoginOk.jsp">
			<div class="mb-3">
				<label class="form-label" for="id">아이디</label>
				<input class="form-control" id="login_id" name="login_id" type="text" placeholder="아이디">
			</div>
			<div class="mb-3">
				<label class="form-label" for="pwd">비밀번호</label>
				<input class="form-control" id="login_pwd" name="login_pwd" type="password" placeholder="Passwowrd">
			</div>
			<div class="d-grid">
				<button class="btn btn-primary btn-lg" type="submit">로그인</button>
			</div>
		</form>
	</div>	
	
<jsp:include page="../memberMain/footer.jsp" />


	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>