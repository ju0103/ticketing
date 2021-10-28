<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>관리자 메인 페이지</title>
</head>
<body>
<%
	if (session.getAttribute("manager") == null) {
%>
		<form method="post" action="../manager/managerLoginForm.jsp">
			<table>
				<tr>
					<td><input type="submit" value="로그인"></td> 
					<td><a href="../manager/managerRegisterForm.jsp">관리자 등록</td>
				</tr>
			</table>
		</form>
<%
	} else {
%>		
	
		<form method="post" action="../manager/managerLogout.jsp">
			<table>
				<tr>
					<td><%= session.getAttribute("manager_id") %>님, 환영합니다.</td> 
					<td><input type="submit" value="로그아웃"></td> 
				</tr>
			</table>
		</form>
		
		<table>
			<tr>
				<td><h3>공연 관련 작업</h3></td>
			</tr>
			<tr>
				<td><a href="../performance/perfor_List.jsp">공연 관리 목록</a></td>
			</tr>
			<tr>
				<td><a href="../performance/perfor_RegisterForm.jsp">공연 등록</a></td>
			</tr>
			<%-- 공연 관리 목록에 통합
			 <tr>
				<td><a href="#">공연 수정/삭제</a></td>
			</tr>
			--%>
			
			
			<%--10/22 관리자 페이지 회원 관리 작업 Update--%>
			<tr>
				<td><h3>회원 관리 작업</h3></td>
			</tr>
			<tr>
				<td><a href="../manager/membershipForm.jsp">회원 관리</a></td>
			</tr>
			
			<%--10/22 관리자 페이지 회원 관리 작업 Update--%>
			<tr>
				<td><h3>고객 센터 관리 작업</h3></td>
			</tr>
			<tr>
				<td><a href="../faq/faqList.jsp">FAQ 목록</a></td>
			</tr>
			<tr>
				<td><a href="../faq/faqRegisterForm.jsp">FAQ 등록</a></td>
			</tr>
			<tr>
				<td><a href="../faq/faqList.jsp">FAQ 수정 및 삭제</a></td>
			</tr>
		</table>
<%
	}
%>
</body>
</html>