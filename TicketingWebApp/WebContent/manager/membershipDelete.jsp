<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="../css/styles.css" rel="stylesheet" />

</head>
<body>
<jsp:include page="../managerMain/managerHeader.jsp" />


	<form  method="post" action="membershipDelete_Ok.jsp">
		<table>
			<tr>
				<td>삭제 아이디</td>
				<td><input type="text" name="member_id"></td>	
			</tr>
		</table>
		<input type="submit" value="삭제" >
	</form>
	
	
	<!-- footer -->
	<jsp:include page="../memberMain/footer.jsp" />
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>