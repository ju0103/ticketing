<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<%--회원등급 구현 예정 --%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <script>
  function Popup1() { window.open("membershipView.jsp", "회원 조회", "width=400, height=800, left=150, top=50"); }
  function Popup2() { window.open("membershipDelete.jsp", "회원 삭제", "width=400, height=800, left=150, top=50"); }
  </script>
</head>
<body>
	<table>
		<tr>
			<td><input type="button" value="회원 조회" onclick="Popup1();"></td>
		</tr>
		<tr>
			<td><input type="button" value="회원 삭제" onclick="Popup2();"></td>
		</tr>
		<tr>
			<td><input type="button" value="회원 등급"></td>
		</tr>
		<tr>
			<td><input type="button" value="회원 정보 수정"></td>
		</tr>
	</table>
</body>
</html>