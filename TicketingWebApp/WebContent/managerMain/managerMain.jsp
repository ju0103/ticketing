<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../managerMain/managerHeader.jsp" />	

	<%
		if (session.getAttribute("manager") == null) {
	%>
			<session class="py-5">
				<div class="container px-4 px-lg-5 mt-5">
					<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
						<div class="col mb-5">
							<div class="card h-100">
								<div class="card-body p-4">
									<div class="text-center">
										<h5 class="fw-bolder">공연 관리</h5>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/managerLoginForm.jsp">공연 목록</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/managerLoginForm.jsp">공연 등록</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/managerLoginForm.jsp">공연 수정 및 삭제</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col mb-5">
							<div class="card h-100">
								<div class="card-body p-4">
									<div class="text-center">
										<h5 class="fw-bolder">FAQ 관리</h5>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/managerLoginForm.jsp">FAQ 목록</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/managerLoginForm.jsp">FAQ 등록</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col mb-5">
							<div class="card h-100">
								<div class="card-body p-4">
									<div class="text-center">
										<h5 class="fw-bolder">1:1 문의 관리</h5>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/managerLoginForm.jsp">1:1 문의 목록</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/managerLoginForm.jsp">1:1 문의 답변</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</session>
	<%
		} else {
	%>		
			<session class="py-5">
				<div class="container px-4 px-lg-5 mt-5">
					<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
						<div class="col mb-5">
							<div class="card h-100">
								<div class="card-body p-4">
									<div class="text-center">
										<h5 class="fw-bolder">공연 관리</h5>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../performance/perfor_List.jsp">공연 목록</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../performance/perfor_RegisterForm.jsp">공연 등록</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../performance/perfor_List.jsp">공연 수정 및 삭제</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col mb-5">
							<div class="card h-100">
								<div class="card-body p-4">
									<div class="text-center">
										<h5 class="fw-bolder">FAQ 관리</h5>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../faq/manager_faqList.jsp?faq_type=all">FAQ 목록</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../faq/faqRegisterForm.jsp">FAQ 등록</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col mb-5">
							<div class="card h-100">
								<div class="card-body p-4">
									<div class="text-center">
										<h5 class="fw-bolder">1:1 문의 관리</h5>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../inquiry/manager_inquiryList.jsp">1:1 문의 목록</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../inquiry/manager_inquiryList.jsp">1:1 문의 답변</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</session>
	<%
		}
	%>

	<jsp:include page="../memberMain/footer.jsp" />
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>