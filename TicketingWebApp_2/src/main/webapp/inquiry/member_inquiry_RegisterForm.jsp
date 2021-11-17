<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>1:1 문의</title>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../memberMain/member_Header.jsp" />

	<%
		int i_id = 0;
		String member_id = (String)session.getAttribute("member_id");
		
		if (member_id != null) {
	%>
			<div class="container py-5">
				<div class="text-center mb-5">
					<h2 class="fw-bolder">1:1 문의</h2>
				</div>
				<form id="inquiryRegForm" method="post" action="./member_inquiry_RegisterOk.jsp">
					<input type="hidden" name="member_member_id" value="<%= member_id %>">
					<input type="hidden" name="i_id" value="<%= i_id %>">
					<div class="mb-3">
						<label class="form-label" for="i_title">제목</label>
						<input class="form-control" id="i_title" type="text" name="i_title">
					</div>
					<div class="mb-3">
						<label class="form-label" for="type">유형</label><br>
						<label><input type="radio" id="type" name="i_type" value="티켓예매/발권">티켓예매/발권</label>
						<label><input type="radio" id="type" name="i_type" value="티켓수령">티켓수령</label>
						<label><input type="radio" id="type" name="i_type" value="취소/환불">취소/환불</label>
						<label><input type="radio" id="type" name="i_type" value="기타">기타</label>
					</div>
					<div class="mb-3">
						<label class="form-label" for="faq_answer">문의 내용</label>
						<textarea class="form-control" id="i_quest" cols="100" rows="10" name="i_quest"></textarea>
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
				document.location.href = "../member/member_LoginForm.jsp";
			</script>
	<%
		}
	%>
	
	<jsp:include page="../memberMain/member_Footer.jsp" />
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>