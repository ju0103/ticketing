<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>로그인</title>
</head>
<body>
	<form method="post" action="./managerLoginOk.jsp">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="login_id" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="login_pwd" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>