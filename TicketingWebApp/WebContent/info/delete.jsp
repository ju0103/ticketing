<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	int b_id = Integer.parseInt(request.getParameter("b_id"));
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>�� �� �� �� ��</h1>
		<form name="form" method="post" action="delete_ok.jsp?b_id=<%= b_id %>">
			<table>
				<tr height="50">
					<td colspan="2">
						<b> >> ��й�ȣ�� �Է��ϼ���. << </b>
					</td>
				</tr>
				<tr>
					<td width="80">��й�ȣ</td>
					<td>
						<input type="password" name="b_pwd" size="12" maxlength="12">
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="2">
						<input type="submit" value="����">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>