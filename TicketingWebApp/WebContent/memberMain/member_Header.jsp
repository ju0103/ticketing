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
				<a class="navbar-brand" href="../memberMain/member_Main.jsp">TICKETING</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				
				<div class="collapse navbar-collapse" id="navbarContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item active"><a class="nav-link" href="../member/member_LoginForm.jsp">�α���</a></li>
						<li class="nav-item active"><a class="nav-link" href="../member/member_RegisterForm.jsp">ȸ������</a></li>
						<li class="nav-item"><a class="nav-link" href="../member/member_LoginForm.jsp">����������</a></li>
						<li class="nav-item"><a class="nav-link" href="../service/service_Main.jsp">������</a></li>
					</ul>
				</div>
			</div>
		</nav>
	<%
		} else {
	%>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<a class="ticketing" href="../memberMain/member_Main.jsp">TICKETING</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				
				<div class="collapse navbar-collapse" id="navbarContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item active"><a class="nav-link" href="../member/memberLogout.jsp">�α׾ƿ�</a></li>
						<div class="nav-item btn-group dropdown">
							<button class="btn btn-dark dropdown-toggle" type="button" id="navbarDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
								����������
							</button>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown" data-bs-popper="none">
								<li><a class="dropdown-item" href="../member/member_ReservationForm.jsp">���� ����</a></li>
								<li><a class="dropdown-item" href="../inquiry/member_inquiry_List.jsp">���� ����</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="../member/member_UpdateForm.jsp">ȸ�� ���� ����</a></li>
								<li><a class="dropdown-item" href="../member/member_DeleteForm.jsp">Ż���ϱ�</a></li>
							</ul>						
						</div>
						<li class="nav-item"><a class="nav-link" href="../service/service_Main.jsp">������</a></li>
					</ul>
				</div>
			</div>
		</nav>
	<%
		}
	%>
	
	<input type="button" onclick="click(��)">
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="./js/scripts.js"></script>
</body>
<script>
	
</script>
</html>