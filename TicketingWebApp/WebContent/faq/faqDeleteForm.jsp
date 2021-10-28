<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int faq_code = Integer.parseInt(request.getParameter("faq_code"));
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>faq 삭제</title>
</head>
<body>
	비밀번호를 한 번 더 입력해주세요.
	<form method="post" action="./faqDeleteOk.jsp?faq_code=<%= faq_code %>">
		관리자 비밀번호
		<input type="password" name="check_pwd">
		<input type="submit" value="삭제">
	</form>
</body>
</html>