<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>FAQ ���</title>
</head>
<body>
	<form method="post" action="./faqRegisterOk.jsp">
		<table border="1">
			<tr>
				<td>FAQ ����</td>
				<td>
					<label><input type="radio" name="faq_type" value="Ƽ�Ͽ���/�߱�">Ƽ�Ͽ���/�߱�</label>
					<label><input type="radio" name="faq_type" value="Ƽ�ϼ���">Ƽ�ϼ���</label>
					<label><input type="radio" name="faq_type" value="���/ȯ��">���/ȯ��</label>
					<label><input type="radio" name="faq_type" value="��Ÿ">��Ÿ</label>
				</td>
			</tr>
			<tr>
				<td>����</td>
				<td>
					<input type="text" name="faq_quest">
				</td>
			</tr>
			<tr>
				<td>�亯</td>
				<td>
					<textarea cols="100" rows="10" name="faq_answer"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="���"></td>
			</tr>
		</table>
	</form>
</body>
</html>