<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>회원가입</title>
</head>
<body>
	<form method="post" action="managerRegisterOk.jsp">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="manager_id" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="manager_pwd" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="check_pwd" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="manager_name" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="관리자 등록"></td>
			</tr>
		</table>
	</form>
</body>
</html>