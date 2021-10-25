<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>ȸ������</title>
	<!-- CSS -->
    <link href="./css/styles.css" rel="stylesheet" />
    <style>
    	.ticketing{ text-decoration: none; color: #fff; }
    </style>
</head>
<body>
	<%
		if (session.getAttribute("member") == null) {
	%>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" href="./index.jsp">TICKETING</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				
				<div class="collapse navbar-collapse" id="navbarContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item active"><a class="nav-link" href="../member/memberLoginForm.jsp">�α���</a></li>
						<li class="nav-item active"><a class="nav-link" href="../member/memberRegisterForm.jsp">ȸ������</a></li>
						<li class="nav-item"><a class="nav-link" href="../member/memberLoginForm.jsp">����������</a></li>
						<li class="nav-item"><a class="nav-link" href="#">������</a></li>
					</ul>
				</div>
			</div>
		</nav>
	<%
		} else {
	%>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<a class="ticketing" href="#">TICKETING</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				
				<div class="collapse navbar-collapse" id="navbarContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item active"><a class="nav-link" href="../member/memberLogout.jsp">�α׾ƿ�</a></li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" href="../member/memberLoginForm.jsp" role="button" data-bs-toggle="dropdown" aria-expanded="false">����������</a>
							<ul class="dropdown-menu show" aria-labelledby="navbarDropdown" data-bs-popper="none">
								<li><a class="dropdown-item" href="#">���� ����</a>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="../member/memberUpdateForm.jsp">ȸ����������</a>
								<li><a class="dropdown-item" href="../member/memberDeleteForm.jsp">Ż���ϱ�</a>
							</ul>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">������</a></li>
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
</html>