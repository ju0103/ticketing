<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<%--ȸ����� ���� ���� --%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <script>
  function Popup1() { window.open("membershipView.jsp", "ȸ�� ��ȸ", "width=400, height=800, left=150, top=50"); }
  function Popup2() { window.open("membershipDelete.jsp", "ȸ�� ����", "width=400, height=800, left=150, top=50"); }
  </script>
</head>
<body>
	<table>
		<tr>
			<td><input type="button" value="ȸ�� ��ȸ" onclick="Popup1();"></td>
		</tr>
		<tr>
			<td><input type="button" value="ȸ�� ����" onclick="Popup2();"></td>
		</tr>
		<tr>
			<td><input type="button" value="ȸ�� ���"></td>
		</tr>
		<tr>
			<td><input type="button" value="ȸ�� ���� ����"></td>
		</tr>
	</table>
</body>
</html>