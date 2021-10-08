<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
	<h1>로그인</h1>
	<form method="post" action="login_ok.jsp">
		<table>
			<tr height="30">
				<td>아이디</td>
				<td><input type="text" name="mem_id" size="20" maxlength="20"></td>
			</tr>
			<tr height="30">
				<td>비밀번호</td>
				<td><input type="password" name="mem_pwd" size="20" maxlength="20"></td>
			</tr>
			<tr height="30">
				<td colspan="2"><input type="submit" value="로그인"></td>
			</tr>
		</table>
		<p><small>티켓팅이 처음이세요?&nbsp;&nbsp;<a href="register.jsp">지금 가입하세요>></a></small></p>
	</form>
</body>
</html>