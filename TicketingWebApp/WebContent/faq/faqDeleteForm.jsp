<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int faq_code = Integer.parseInt(request.getParameter("faq_code"));
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>faq ����</title>
</head>
<body>
	��й�ȣ�� �� �� �� �Է����ּ���.
	<form method="post" action="./faqDeleteOk.jsp?faq_code=<%= faq_code %>">
		������ ��й�ȣ
		<input type="password" name="check_pwd">
		<input type="submit" value="����">
	</form>
</body>
</html>