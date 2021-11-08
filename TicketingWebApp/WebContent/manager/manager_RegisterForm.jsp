<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>ȸ������</title>
	<script type="text/javascript" src="../js/check.js" charset="utf-8" ></script>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../managerMain/manager_Header.jsp" />

		<!-- manager register form -->
	<div class="container py-4">
		<div class="text-center mb-5">
			<h2 class="fw-bolder">������ ���</h2>
		</div>
		<form id="contactForm" method="post" action="./manager_RegisterOk.jsp" name="reg_frm">
			<div class="mb-3">
				<label class="form-label" for="id">���̵�</label>
				<input class="form-control" id="manager_id" name="manager_id" type="text" placeholder="���̵�">
			</div>
			<div class="mb-3">
				<label class="form-label" for="pwd">��й�ȣ</label>
				<input class="form-control" id="manager_pwd" name="manager_pwd" type="password" placeholder="Passwowrd">
			</div>
			<div class="mb-3">
				<label class="form-label" for="pwd">��й�ȣ Ȯ��</label>
				<input class="form-control" id="check_pwd" name="check_pwd" type="password" placeholder="Passwowrd">
			</div>
			<div class="mb-3">
				<label class="form-label" for="name">�̸�</label>
				<input class="form-control" id="manager_name" name="manager_name" type="text" placeholder="Name">
			</div>
			<div class="d-grid">
				<button class="btn btn-primary btn-lg" type="button" onclick="check_ok()">ȸ������</button>
			</div>
		</form>
	</div>
	
	<jsp:include page="../managerMain/manager_Footer.jsp" />	
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>