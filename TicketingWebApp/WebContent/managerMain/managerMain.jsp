<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>������ ���� ������</title>
</head>
<body>
<%
	if (session.getAttribute("manager") == null) {
%>
		<form method="post" action="../manager/managerLoginForm.jsp">
			<table>
				<tr>
					<td><input type="submit" value="�α���"></td> 
					<td><a href="../manager/managerRegisterForm.jsp">������ ���</td>
				</tr>
			</table>
		</form>
<%
	} else {
%>		
	
		<form method="post" action="../manager/managerLogout.jsp">
			<table>
				<tr>
					<td><%= session.getAttribute("manager_id") %>��, ȯ���մϴ�.</td> 
					<td><input type="submit" value="�α׾ƿ�"></td> 
				</tr>
			</table>
		</form>
		
		<table>
			<tr>
				<td><h3>���� ���� �۾�</h3></td>
			</tr>
			<tr>
				<td><a href="../performance/perfor_List.jsp">���� ���� ���</a></td>
			</tr>
			<tr>
				<td><a href="../performance/perfor_RegisterForm.jsp">���� ���</a></td>
			</tr>
			<%-- ���� ���� ��Ͽ� ����
			 <tr>
				<td><a href="#">���� ����/����</a></td>
			</tr>
			--%>
			
			
			<%--10/22 ������ ������ ȸ�� ���� �۾� Update--%>
			<tr>
				<td><h3>ȸ�� ���� �۾�</h3></td>
			</tr>
			<tr>
				<td><a href="../manager/membershipForm.jsp">ȸ�� ����</a></td>
			</tr>
			
			<%--10/22 ������ ������ ȸ�� ���� �۾� Update--%>
			<tr>
				<td><h3>�� ���� ���� �۾�</h3></td>
			</tr>
			<tr>
				<td><a href="../faq/faqList.jsp">FAQ ���</a></td>
			</tr>
			<tr>
				<td><a href="../faq/faqRegisterForm.jsp">FAQ ���</a></td>
			</tr>
			<tr>
				<td><a href="../faq/faqList.jsp">FAQ ���� �� ����</a></td>
			</tr>
		</table>
<%
	}
%>
</body>
</html>