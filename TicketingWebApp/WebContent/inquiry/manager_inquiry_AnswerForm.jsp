<%@page import="myUtil.HanConv"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>1:1 문의 답변</title>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../managerMain/manager_Header.jsp" />

	<%
		String member_id = request.getParameter("member_id");
		String i_id = request.getParameter("i_id");
		String i_title = request.getParameter("i_title");
		String i_quest = request.getParameter("i_quest");
		String i_type = request.getParameter("i_type");
		String manager_id = (String)session.getAttribute("manager_id");
		
		if (manager_id != null) {
	%>
			<div class="container py-5">
				<div class="text-center mb-5">
					<h2 class="fw-bolder">1:1 답변 달기</h2>
				</div>
				<form id="inquiryRegForm" method="post" action="./manager_inquiry_AnswerOk.jsp">
					<input type="hidden" name="member_member_id" value="<%= member_id %>">
					<input type="hidden" name="i_id" value="<%= i_id %>">
					<input type="hidden" name="i_type" value="<%= i_type %>">
					<div class="mb-3">
						<label class="form-label" for="i_title">제목</label>
						<input class="form-control" id="i_title" type="text" name="i_title" value="[답변]: ">
					</div>
					<div class="mb-3">
						<label class="form-label" for="i_answer">답변</label>
						<textarea class="form-control" id="i_answer" cols="100" rows="10" name="i_answer"></textarea>
					</div>
					<div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
						<button class="btn btn-outline-primary btn-sm px-4" type="submit">등록</button><br>
						<button class="btn btn-outline-secondary btn-sm px-4 me-sm-3" type="reset">다시 입력</button>
					</div>
				</form>
			</div>
	<%		
		} else {
	%>
			<script>
				document.location.href = "../manager/manager_LoginForm.jsp";
			</script>
	<%
		}
	%>
	
	<jsp:include page="../managerMain/manager_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>