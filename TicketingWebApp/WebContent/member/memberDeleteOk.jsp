<%@page import="ticketing.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("member_id");
	String pwd = request.getParameter("delete_pwd");
	
	MemberDBBean db = MemberDBBean.getInstance();
	int result = db.deleteMember(id, pwd);
	
	if (result == 1) {
		session.invalidate();
%>
		<script>
			alert("성공적으로 탈퇴되었습니다.");
			document.location.href="../memberMain/index.jsp";
		</script>
<%
	} else {
%>
		<script>
			alert("탈퇴 처리에 실패했습니다.");
			history.go(-1);
		</script>
<%
	}
%>
