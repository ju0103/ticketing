<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<%--���Ž� ����������� --%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../managerMain/manager_Header.jsp" />	
	<form  method="post" action="membership_ViewOk.jsp">
		<table>
			<tr>
				<td>��ȸ ���̵�</td>
				<td><input type="text" name="member_id"></td>	
			</tr>
		</table>
		<input type="submit" value="��ȸ">
	</form>
	
	<!-- footer -->
	<jsp:include page="../managerMain/manager_Footer.jsp" />

	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>