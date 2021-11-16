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
	<%
		if (session.getAttribute("member") == null) {
	%>
		<nav class="navbar navbar-expand-lg bg-light">
			<div class="container">
				<a class="navbar-brand text-black" href="../memberMain/member_Main.jsp">TICKETING</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				
				<div class="collapse navbar-collapse" id="navbarContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item active text-black"><a class="nav-link" href="../member/member_LoginForm.jsp">로그인</a></li>
						<li class="nav-item text-black"><a class="nav-link" href="../member/member_RegisterForm.jsp">회원가입</a></li>
						<li class="nav-item text-black"><a class="nav-link" href="../member/member_LoginForm.jsp">마이페이지</a></li>
						<li class="nav-item text-black"><a class="nav-link" href="../service/service_Main.jsp">고객센터</a></li>
					</ul>
				</div>
			</div>
		</nav>
	<%
		} else {
	%>
		<nav class="navbar navbar-expand-lg navbar-dark bg-light">
			<div class="container">
				<a class="ticketing text-black" href="../memberMain/member_Main.jsp" style="text-decoration: none">TICKETING</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				
				<div class="collapse navbar-collapse" id="navbarContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item active"><a class="nav-link text-black" href="../member/member_Logout.jsp">로그아웃</a></li>
						<div class="nav-item btn-group dropdown">
							<a class="nav-link dropdown-toggle text-black show" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="true">
								마이페이지
							</a>
							<ul class="dropdown-menu dropdown-menu-end text-black show" aria-labelledby="navbarDropdown" data-bs-popper="none">
								<li><a class="dropdown-item" href="../member/member_ReservationMGRForm.jsp">나의 예매</a></li>
								<li><a class="dropdown-item" href="../inquiry/member_inquiry_List.jsp">나의 문의</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="../member/member_UpdateForm.jsp">회원 정보 수정/탈퇴</a></li>
							</ul>						
							<li class="nav-item"><a class="nav-link text-black" href="../service/service_Main.jsp">고객센터</a></li>
						</div>
					</ul>
				</div>
			</div>
		</nav>
	<%
		}
	%>
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="./js/scripts.js"></script>
</body>
<script>
	
</script>
</html>