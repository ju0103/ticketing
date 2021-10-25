<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<%--예매시 예매정보출력 --%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form  method="post" action="membershipView_ok.jsp">
		<table>
			<tr>
				<td>조회 아이디</td>
				<td><input type="text" name="member_id"></td>	
			</tr>
		</table>
		<input type="submit" value="조회">
	</form>
</body>
</html>