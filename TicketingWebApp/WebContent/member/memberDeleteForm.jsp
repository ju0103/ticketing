<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 탈퇴</title>
</head>
<body>
	<form method="post" action="memberDeleteOk.jsp">
		<table>
			<tr>
				<td colspan="2">비밀번호를 다시 한 번 입력해주세요.</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="delete_pwd" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="회원 탈퇴"></td>
			</tr>
		</table>
	</form>
</body>
</html>