<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>�α���</title>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- navbar -->
	<jsp:include page="../memberMain/member_Header.jsp" />
	
	<!-- member login form -->
	<div class="container py-4">
		<div class="text-center mb-5">
			<h2 class="fw-bolder">�α���</h2>
		</div>
		<form id="contactForm" method="post" action="./member_LoginOk.jsp">
			<div class="mb-3">
				<label class="form-label" for="id">���̵�</label>
				<input class="form-control" id="login_id" name="login_id" type="text" placeholder="���̵�">
			</div>
			<div class="mb-3">
				<label class="form-label" for="pwd">��й�ȣ</label>
				<input class="form-control" id="login_pwd" name="login_pwd" type="password" placeholder="Passwowrd">
			</div>
			<div class="d-grid">
				<button class="btn btn-primary btn-lg" type="submit">�α���</button>
			</div>
		</form>
	</div>
	
	<!-- footer -->
	<jsp:include page="../memberMain/member_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>