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
  function Popup3() { window.open("membershipDelete.jsp", "ȸ�� ����", "width=400, height=800, left=150, top=50"); }
  </script>
<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="../managerMain/managerHeader.jsp" />	

	<table>
		<tr>
			<td><input class="btn btn-primary" type="button" value="ȸ�� ��ȸ" onclick="Popup1();"></td>
		</tr>
		<tr>
			<td><input class="btn btn-primary" type="button" value="ȸ�� ����" onclick="Popup2();"></td>
		</tr>
		<tr>
			<td><input class="btn btn-primary" type="button" value="ȸ�� ���"></td>
		</tr>
		<tr>
			<td><input class="btn btn-primary" type="button" value="ȸ�� ���� ����"></td>
		</tr>
	</table>
	
	<!-- footer -->
	<jsp:include page="../memberMain/footer.jsp" />
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>