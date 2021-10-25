<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>회원 탈퇴</title>
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>회원 탈퇴</title>
	<!-- CSS -->
	<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- navbar -->
	<jsp:include page="../memberMain/header.jsp"></jsp:include>
	
	<!-- member delete form -->
	<div class="container py-4">
		<div class="text-center mb-5">
			<h2 class="fw-bolder">탈퇴하기</h2>
		</div>
		<form id="contactForm" method="post" action="./memberDeleteOk.jsp">
			<div class="mb-3">
				<label class="form-label" for="pwd">비밀번호를 다시 한 번 입력해주세요.</label>
				<input class="form-control" id="delete_pwd" name="delete_pwd" type="password" placeholder="Passwowrd">
			</div>
			<div class="d-grid">
				<button class="btn btn-primary btn-lg" type="submit">탈퇴하기</button>
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