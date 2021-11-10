<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	int p_code = Integer.parseInt(request.getParameter("p_code"));
	int r_id = Integer.parseInt(request.getParameter("r_id"));
%>
<html>
<head>
<title>Insert title here</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
</head>
<body>
	<center>
		<h1>글 삭 제 하 기</h1>
		<form name="form" method="post" action="review_deleteOk.jsp">
			<input type="hidden" name="p_code" value="<%=p_code %>">
			<input type="hidden" name="r_id" value="<%=r_id %>">
			<table>
				<tr height="50">
					<td colspan="2">
						<b> >> 비밀번호를 입력하세요. << </b>
					</td>
				</tr>
				<tr>
					<td width="80">비밀번호</td>
					<td>
						<input type="password" name="r_pwd" size="12" maxlength="12">
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="2">
						<input type="submit" value="삭제">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>