<%@page import="java.sql.Timestamp"%>
<%@page import="ticketing.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="member" class="ticketing.member.MemberBean" />
<jsp:setProperty property="*" name="member"/>
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
	<jsp:include page="../memberMain/header.jsp" />
	
	<!-- member register -->
	<div class="container py-4">
		<%
			Timestamp regdate = new Timestamp(System.currentTimeMillis());
			member.setMember_regdate(regdate);
			
			MemberDBBean db = MemberDBBean.getInstance();
			
			if (db.confirmID(member.getMember_id()) == 1) {
		%>
				<script>
					alert("�ߺ��Ǵ� ���̵��Դϴ�.");
					history.go(-1);
				</script>
		<%
			} else {
				int result = db.insertMember(member);
				if (result == 1) {
		%>
					<script>
						alert("ȸ�����Կ� �����߽��ϴ�.\n�α������ּ���.");
						document.location.href="./memberLoginForm.jsp";
					</script>
		<%
				} else {
		%>
					<script>
						alert("ȸ�����Կ� �����Ͽ����ϴ�.");
						document.location.href="./memberRegisterForm.jsp";
					</script>
		<%
				}
			}
		%>
		</div>
	
	<!-- footer -->
	<jsp:include page="../memberMain/footer.jsp" />
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>