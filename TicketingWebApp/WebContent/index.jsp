<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
</head>
<body>
<%
	if (session.getAttribute("member") == null) {
%>
		<form method="post" action="./member/memberLoginForm.jsp">
			<table>
				<tr>
					<td><input type="submit" value="�α���"></td> 
					<td><a href="./member/memberRegisterForm.jsp">ȸ������</td>
					<td><a href="#">����������</td>
					<td><a href="#">������</a></td> 
				</tr>
			</table>
		</form>
<%
	} else {
%>		
		<form method="post" action="./member/memberLogout.jsp">
			<table>
				<tr>
					<td><%= session.getAttribute("member_id") %>��, ȯ���մϴ�.</td> 
					<td><input type="submit" value="�α׾ƿ�"></td> 
					<td><a href="#">����������</td> 
					<td><a href="./member/memberUpdateForm.jsp">ȸ����������</td> 
					<td><a href="./member/memberDeleteForm.jsp">Ż���ϱ�</td> 
					<td><a href="#">������</a></td> 
				</tr>
			</table>
		</form>
<%
	}
%>
</body>
</html>