<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<body>
	<h1>ȸ������</h1>
	<form name="reg_form" method="post" action="register_ok.jsp">
		<table>
			<tr height="30">
				<td>���̵�</td>
				<td><input type="text" name="mem_id" size="15" maxlength="15"></td>
			</tr>
			<tr height="30">
				<td>��й�ȣ</td>
				<td><input type="password" name="mem_pwd" size="15" maxlength="15"></td>
			</tr>
			<tr height="30">
				<td>��й�ȣ Ȯ��</td>
				<td><input type="password" name="check_pwd" size="15" maxlength="15"></td>
			</tr>
			<tr height="30">
				<td>�̸�</td>
				<td><input type="text" name="mem_name"></td>
			</tr>
			<tr height="30">
				<td>�޴��� ��ȣ</td>
				<td><input type="number" name="mem_phone" placeholder="'-'���� �Է��ϼ���." size="15" maxlength="15"></td>
			</tr>
			<tr height="30">
				<td>�̸���</td>
				<td><input type="email" name="mem_email" size="50" maxlength="50"></td>
			</tr>
			<tr height="30">
				<td>�ּ�</td>
				<td><input type="text" name="mem_address" size="100" maxlength="100"></td>
			</tr>
			<tr height="30">
				<td colspan="2"><input type="submit" value="���ԿϷ�"></td>
			</tr>
		</table>
	</form>
</body>
</html>