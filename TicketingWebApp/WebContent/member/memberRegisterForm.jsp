<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>ȸ������</title>
	<!-- CSS -->
	<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- navbar -->
	<jsp:include page="../memberMain/header.jsp"></jsp:include>
	
	<!-- member register form -->
	<div class="container py-4">
		<div class="text-center mb-5">
			<h2 class="fw-bolder">ȸ������</h2>
		</div>
		<form id="contactForm" method="post" action="./memberRegisterOk.jsp">
			<div class="mb-3">
				<label class="form-label" for="id">���̵�</label>
				<input class="form-control" id="member_id" name="member_id" type="text" placeholder="���̵�">
			</div>
			<div class="mb-3">
				<label class="form-label" for="pwd">��й�ȣ</label>
				<input class="form-control" id="member_pwd" name="member_pwd" type="password" placeholder="Passwowrd">
			</div>
			<div class="mb-3">
				<label class="form-label" for="pwd">��й�ȣ Ȯ��</label>
				<input class="form-control" id="check_pwd" name="check_pwd" type="password" placeholder="Passwowrd">
			</div>
			<div class="mb-3">
				<label class="form-label" for="name">�̸�</label>
				<input class="form-control" id="member_name" name="member_name" type="text" placeholder="Name">
			</div>
			<div class="mb-3">
				<label class="form-label" for="email">�̸���</label>
				<input class="form-control" id="member_email" name="member_email" type="email" placeholder="Email Address">
			</div>
			<div class="d-grid">
				<button class="btn btn-primary btn-lg" type="submit">ȸ������</button>
			</div>
		</form>
	</div>
	
	<!-- footer -->
	<jsp:include page="../memberMain/footer.jsp" />
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>

</body>
</html>