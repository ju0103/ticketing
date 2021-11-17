<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--세션있어야지만 삭제 동작 --%>
    <%
    String manager_id = session.getAttribute("manager_id").toString();
    int p_code = Integer.parseInt(request.getParameter("p_code"));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../managerMain/manager_Header.jsp" />
		
	<center>
		<h1>공연 삭제</h1>
		<form name="form" method="post" action="performance_DeleteOk.jsp?manager_id=<%= manager_id %>&p_code=<%= p_code %>">
			<table>
				<tr height="50">
					<td colspan="2">
						<b> >> 암호를 입력하세요. << </b>
					</td>
				</tr>
				<tr>
					<td width="80">암&nbsp;&nbsp;호</td>
					<td>
						<input type="password" name="manager_pwd" size="12" maxlength="12">
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="2">
						<input type="submit" value="글삭제">
						<input type="reset" value="다시작성">
						<input type="button" value="글목록" onclick="location.href='manager_performance_List.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</center>
	
	<jsp:include page="../managerMain/manager_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>