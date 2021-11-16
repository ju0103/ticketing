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
	<jsp:include page="../memberMain/member_Header.jsp" />
	
	<!-- member delete form -->
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-9 col-lg-7 mx-auto">
				<div class="card border-1 rounded-3 my-5">
					<div class="card-header">
						<h5>회원 탈퇴 시 주의 사항</h4>
						<p>○ 회원 탈퇴 시 회원 정보는 지체없이 파기되어 복구할 수 없습니다.</p> 
						<p>○ 본인이 작성하신 공연 후기 및 QnA는 삭제되지 않습니다. 삭제할 게시물들은 탈퇴 전에 바랍니다.</p> 
					</div>
					<div class="card-body p-4 p-sm-5">
						<h5 class="card-title text-center mb-5 fw-light fs-5">회원 탈퇴</h5>
						<form id="contactForm" method="post" action="./member_DeleteOk.jsp">
							<div class="mb-3">
								<label class="form-label" for="pwd">비밀번호를 다시 한 번 입력해주세요.</label>
								<input class="form-control" id="delete_pwd" name="delete_pwd" type="password" placeholder="Passwowrd">
							</div>
							<div class="d-grid">
								<button class="btn btn-primary btn-lg" type="submit">탈퇴하기</button>
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