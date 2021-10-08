<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
</head>
<body>
	<h1>회원가입</h1>
	<form name="reg_form" method="post" action="register_ok.jsp">
		<table>
			<tr height="30">
				<td>아이디</td>
				<td><input type="text" name="mem_id" size="15" maxlength="15"></td>
			</tr>
			<tr height="30">
				<td>비밀번호</td>
				<td><input type="password" name="mem_pwd" size="15" maxlength="15"></td>
			</tr>
			<tr height="30">
				<td>비밀번호 확인</td>
				<td><input type="password" name="check_pwd" size="15" maxlength="15"></td>
			</tr>
			<tr height="30">
				<td>이름</td>
				<td><input type="text" name="mem_name"></td>
			</tr>
			<tr height="30">
				<td>휴대폰 번호</td>
				<td><input type="number" name="mem_phone" placeholder="'-'없이 입력하세요." size="15" maxlength="15"></td>
			</tr>
			<tr height="30">
				<td>이메일</td>
				<td><input type="email" name="mem_email" size="50" maxlength="50"></td>
			</tr>
			<tr height="30">
				<td>주소</td>
				<td><input type="text" name="mem_address" size="100" maxlength="100"></td>
			</tr>
			<tr height="30">
				<td colspan="2"><input type="submit" value="가입완료"></td>
			</tr>
		</table>
	</form>
</body>
</html>