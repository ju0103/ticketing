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
					<td><input type="submit" value="로그인"></td> 
					<td><a href="./member/memberRegisterForm.jsp">회원가입</td>
					<td><a href="#">마이페이지</td>
					<td><a href="#">고객센터</a></td> 
				</tr>
			</table>
		</form>
<%
	} else {
%>		
		<form method="post" action="./member/memberLogout.jsp">
			<table>
				<tr>
					<td><%= session.getAttribute("member_id") %>님, 환영합니다.</td> 
					<td><input type="submit" value="로그아웃"></td> 
					<td><a href="#">마이페이지</td> 
					<td><a href="./member/memberUpdateForm.jsp">회원정보수정</td> 
					<td><a href="./member/memberDeleteForm.jsp">탈퇴하기</td> 
					<td><a href="#">고객센터</a></td> 
				</tr>
			</table>
		</form>
<%
	}
%>
</body>
</html>