<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>ȸ������</title>
</head>
<body>
	<form method="post" action="memberRegisterOk.jsp">
		<table>
			<tr>
				<td>���̵�</td>
				<td><input type="text" name="member_id" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td><input type="password" name="member_pwd" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td>��й�ȣ Ȯ��</td>
				<td><input type="password" name="check_pwd" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td><input type="text" name="member_name" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td>�̸���</td>
				<td><input type="email" name="member_email" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td>�̸��� ����</td>
				<td><input type="text" name="check_email" size="20" maxlength="30"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="ȸ������"></td>
			</tr>
		</table>
	</form>
</body>
</html>