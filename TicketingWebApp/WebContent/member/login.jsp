<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
</head>
<body>
	<h1>�α���</h1>
	<form method="post" action="login_ok.jsp">
		<table>
			<tr height="30">
				<td>���̵�</td>
				<td><input type="text" name="mem_id" size="20" maxlength="20"></td>
			</tr>
			<tr height="30">
				<td>��й�ȣ</td>
				<td><input type="password" name="mem_pwd" size="20" maxlength="20"></td>
			</tr>
			<tr height="30">
				<td colspan="2"><input type="submit" value="�α���"></td>
			</tr>
		</table>
		<p><small>Ƽ������ ó���̼���?&nbsp;&nbsp;<a href="register.jsp">���� �����ϼ���>></a></small></p>
	</form>
</body>
</html>