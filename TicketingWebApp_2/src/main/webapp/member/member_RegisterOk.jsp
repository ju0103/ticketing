<%@page import="java.sql.Timestamp"%>
<%@page import="ticketing.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="member" class="ticketing.member.MemberBean" />
<jsp:setProperty property="*" name="member"/>
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
				document.location.href="./member_LoginForm.jsp";
			</script>
<%
		} else {
%>
			<script>
				alert("회원가입에 실패하였습니다.");
				document.location.href="./member_RegisterForm.jsp";
			</script>
<%
		}
	}
%>
