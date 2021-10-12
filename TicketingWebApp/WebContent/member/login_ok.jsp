<%@page import="ticketing.member.MemBean"%>
<%@page import="ticketing.member.MemDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String memId = request.getParameter("mem_id");
	String memPwd = request.getParameter("mem_pwd");
	
	MemDBBean db = MemDBBean.getInstance();
	int result = db.memberCheck(memId, memId);
	MemBean member = new MemBean();
	
	if (member == null) {
%>
		<script>
			alert("등록된 아이디가 없습니다.\n회원가입 해주세요.");
			location.href='register.jsp';
		</script>
<%
	} else {
		if (result == 1) {
			session.setAttribute("mem_id", memId);
			response.sendRedirect("../main.jsp");
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
				alert("존재하지 않는 아이디입니다.");
				history.go(-1);
			</script>
<%
			
		}
	}
%>