<%@page import="ticketing.member.MemberBean"%>
<%@page import="ticketing.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- navbar -->
	<jsp:include page="../memberMain/header.jsp"></jsp:include>
	
	<%
		String id = request.getParameter("login_id");
		String pwd = request.getParameter("login_pwd");
		
		MemberDBBean db = MemberDBBean.getInstance();
		int result = db.memberCheck(id, pwd);
		MemberBean member = db.getMember(id);
	
		if (member == null) {
	%>
				<script>
					alert("�������� �ʴ� ȸ���Դϴ�.");
					history.go(-1);
				</script>
	<%
		} else {
			if (result == 1) {
				// ���ǿ� ����� ���� �߰�
				session.setAttribute("member_id", id);
				session.setAttribute("member_name", member.getMember_name());
				session.setAttribute("member", "yes");
				response.sendRedirect("../memberMain/index.jsp");
			} else if (result == 0) {
	%>
				<script>
					alert("��й�ȣ�� ���� �ʽ��ϴ�.");
					history.go(-1);
				</script>
	<%
			} else {
	%>
				<script>
					alert("���̵� ���� �ʽ��ϴ�.");
					history.go(-1);
				</script>
	<%
			}
		}
	%>
	
	<!-- footer -->
	<jsp:include page="../memberMain/footer.jsp" />
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>