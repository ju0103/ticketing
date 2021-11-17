<%@page import="ticketing.member.MemberBean"%>
<%@page import="ticketing.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String memberId = (String)session.getAttribute("member_id");
	MemberDBBean db = MemberDBBean.getInstance();
	MemberBean member = db.getMember(memberId);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>회원 정보 수정</title>
	<!-- CSS -->
	<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- navbar -->
	<jsp:include page="../memberMain/member_Header.jsp" />
	
	<!-- member update form -->
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-9 col-lg-7 mx-auto">
				<div class="card border-1 rounded-3 my-5">
					<div class="card-body p-4 p-sm-5">
						<h5 class="card-title text-center mb-5 fw-light fs-5">회원 정보 수정</h5>
						<form id="contactForm" method="post" action="./member_UpdateOk.jsp">
							<div class="mb-3">
								<label class="form-label" for="id">아이디</label>
								<p><%= member.getMember_id() %></p>
							</div>
							<div class="mb-3">
								<label class="form-label" for="name">이름</label>
								<p><%= member.getMember_name() %></p>
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
								<label class="form-label" for="email">이메일</label>
								<input class="form-control" id="member_email" name="member_email" type="email" placeholder="Email Address">
							</div>
							<div class="d-grid">
								<button class="btn btn-primary btn-lg" type="submit">정보 수정</button>
							</div>
							<hr class="my-4">
							<div class="d-grid">
								<a href="../member/member_DeleteForm.jsp">탈퇴하기</a>
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