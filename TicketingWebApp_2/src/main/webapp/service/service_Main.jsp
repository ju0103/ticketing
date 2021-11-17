<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>고객센터</title>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../memberMain/member_Header.jsp" />
	
	<div class="container m-3 px-1 col-lg-1">
		<ul class="list-group">
			<li class="list-group-item">
				<a href="../inquiry/member_inquiry_RegisterForm.jsp">1:1 문의 ></a>				
			</li>
			<li class="list-group-item">
				<a href="../faq/member_faq_List.jsp?faq_type=100">FAQ</a>
			</li>
		</ul>
	</div>
	
	<jsp:include page="../notice/notice_MemberList.jsp" />
	
	<jsp:include page="../memberMain/member_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>