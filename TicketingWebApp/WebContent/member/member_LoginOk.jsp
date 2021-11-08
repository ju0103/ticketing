<%@page import="ticketing.member.MemberBean"%>
<%@page import="ticketing.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("login_id");
	String pwd = request.getParameter("login_pwd");
	
	MemberDBBean db = MemberDBBean.getInstance();
	int result = db.memberCheck(id, pwd);
	MemberBean member = db.getMember(id);

	if (member == null) {
%>
			<script>
				alert("존재하지 않는 회원입니다.");
				document.location.href="./member_RegisterForm.jsp";
			</script>
<%
	} else {
		if (result == 1) {
			// 세션에 사용자 정보 추가
			session.setAttribute("member_id", id);
			session.setAttribute("member_name", member.getMember_name());
			session.setAttribute("member", "yes");
			response.sendRedirect("../memberMain/member_Main.jsp");
		} else if (result == 0) {
%>
			<script>
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);
			</script>
<%
		} else {
%>
			<script>
				alert("아이디가 맞지 않습니다.");
				history.go(-1);
			</script>
<%
		}
	}
%>
