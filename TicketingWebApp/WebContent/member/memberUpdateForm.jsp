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
	<title>회원 정보 수정</title>
</head>
<body>
	<form method="post" action="memberUpdateOk.jsp">
		<table>
			<tr>
				<td>아이디</td>
				<td><%= member.getMember_id() %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="member_pwd" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="check_pwd" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%= member.getMember_name() %></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="member_email" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td>이메일 인증</td>
				<td><input type="text" name="check_email" size="20" maxlength="30"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="reset" value="다시 입력">
					<input type="button" value="입력 취소" onclick="javascript:window.location='../index.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>