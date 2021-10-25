<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="Login_ok.jsp" method="post">
		ID
		<input type="text" name="user_id">
		password
		<input type="password" name="user_pw">
		<input type="submit" value="login">
		<!-- submit 대신 button / onclick="function()"으로 자바스크립트에서 validation CHECK! -->
	</form>
</body>
</html>