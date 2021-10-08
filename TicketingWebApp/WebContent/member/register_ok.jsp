<%@page import="ticketing.member.MemDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="member" class="ticketing.member.MemBean" scope="page" />
<jsp:setProperty property="*" name="member"/>
<%
	MemDBBean manager = MemDBBean.getInstance();

	if (manager.confirmID(member.getMem_id()) == 1) {
%>
		<script type="text/javascript">
			alert("중복되는 아이디가 존재합니다.");
			// document.location.href="register.jsp";	// 이전 기록이 존재하지 않음
			history.back();								// 이전의 기록이 존재
		</script>
<%
	} else {
		int re = manager.insertMember(member);
		if (re == 1) {
%>
			<script>
				alert("회원가입을 축하드립니다.\n회원으로 로그인 해주세요");
				document.location.href="login.jsp";
			</script>
<%
		} else {
%>
			<script>
				alert("회원가입에 실패했습니다.");
				document.location.href="login.jsp";
			</script>
<%
		}
	}
%>