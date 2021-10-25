<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<%-- js prompt pwd 입력받아 deleteok로 전달  --%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form  method="post" action="membershipDelete_ok.jsp">
		<table>
			<tr>
				<td>삭제 아이디</td>
				<td><input type="text" name="member_id"></td>	
			</tr>
		</table>
		<input type="submit" value="삭제">
	</form>
</body>
</html>