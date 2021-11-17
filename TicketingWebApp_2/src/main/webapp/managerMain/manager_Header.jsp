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
    <style>
    	.ticketing{ text-decoration: none; color: #fff; }
    </style>
    <script>
    	function sessionCheck(){
    		alert("로그인이 필요한 서비스입니다.");
    	}
    </script>
</head>
<body>
	<%
		if (session.getAttribute("manager") == null) {
	%>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" href="../managerMain/manager_Main.jsp">TICKETING</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				
				<div class="collapse navbar-collapse" id="navbarContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item active"><a class="nav-link" href="../manager/manager_LoginForm.jsp">로그인</a></li>
						<li class="nav-item active"><a class="nav-link" href="../manager/manager_RegisterForm.jsp">관리자 등록</a></li>
						<li class="nav-item"><a class="nav-link" href="../manager/manager_LoginForm.jsp" onclick="sessionCheck();">관리자 페이지</a></li>
					</ul>
				</div>
			</div>
		</nav>
	<%
		} else {
	%>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<a class="ticketing" href="../managerMain/manager_Main.jsp">TICKETING</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				
				<div class="collapse navbar-collapse" id="navbarContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item active"><a class="nav-link" href="../manager/manager_Logout.jsp">로그아웃</a></li>
						<div class="nav-item btn-group dropdown">
							<button class="btn btn-dark dropdown-toggle" type="button" id="navbarDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
								관리자 페이지
							</button>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown" data-bs-popper="none">
								<li><a class="dropdown-item" href="../performance/manager_performance_List.jsp">공연 관리</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="../inquiry/manager_inquiry_List.jsp">1:1 문의 관리</a></li>
								<li><a class="dropdown-item" href="../faq/manager_faq_List.jsp">FAQ 관리</a></li>
							</ul>						
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
</html>