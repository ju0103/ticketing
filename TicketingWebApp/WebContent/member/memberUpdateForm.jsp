<%@page import="ticketing.member.MemberBean"%>
<%@page import="ticketing.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String memberId = (String)session.getAttribute("member_id");
	MemberDBBean db = MemberDBBean.getInstance();
	MemberBean member = db.getMember(memberId);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>ȸ�� ���� ����</title>
</head>
<body>
	<form method="post" action="memberUpdateOk.jsp">
		<table>
			<tr>
				<td>���̵�</td>
				<td><%= member.getMember_id() %></td>
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
				<td><%= member.getMember_name() %></td>
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
				<td colspan="2">
					<input type="submit" value="����">
					<input type="reset" value="�ٽ� �Է�">
					<input type="button" value="�Է� ���" onclick="javascript:window.location='../index.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>