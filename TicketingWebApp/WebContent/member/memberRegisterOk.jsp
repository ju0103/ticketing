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
					alert("중복되는 아이디입니다.");
					history.go(-1);
				</script>
		<%
			} else {
				int result = db.insertMember(member);
				if (result == 1) {
		%>
					<script>
						alert("회원가입에 성공했습니다.\n로그인해주세요.");
						document.location.href="./memberLoginForm.jsp";
					</script>
		<%
				} else {
		%>
					<script>
						alert("회원가입에 실패하였습니다.");
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