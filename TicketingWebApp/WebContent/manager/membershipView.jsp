<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<%--예매시 예매정보출력 --%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="../managerMain/managerHeader.jsp" />	
	<form  method="post" action="membershipView_ok.jsp">
		<table>
			<tr>
				<td>조회 아이디</td>
				<td><input type="text" name="member_id"></td>	
			</tr>
		</table>
		<input type="submit" value="조회">
	</form>
	
	<!-- footer -->
	<jsp:include page="../memberMain/footer.jsp" />
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>