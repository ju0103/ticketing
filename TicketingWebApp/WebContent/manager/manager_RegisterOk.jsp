<%@page import="java.sql.Timestamp"%>
<%@page import="ticketing.manager.ManagerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="manager" class="ticketing.manager.ManagerBean" />
<jsp:setProperty property="*" name="manager"/>
<%
	Timestamp regdate = new Timestamp(System.currentTimeMillis());
	manager.setManager_regdate(regdate);
	
	ManagerDBBean db = ManagerDBBean.getInstance();
	
	if (db.confirmID(manager.getManager_id()) == 1) {
%>
		<script>
			alert("중복되는 아이디입니다.");
			history.go(-1);
		</script>
<%
	} else {
		int result = db.insertManager(manager);
		if (result == 1) {
%>
			<script>
				alert("관리자 등록을 성공하였습니다.\n로그인해주세요.");
				document.location.href="manager_LoginForm.jsp";
			</script>
<%
		} else {
%>
			<script>
				alert("관리자 등록을 실패하였습니다.");
				document.location.href="manager_RegisterForm.jsp";
			</script>
<%
		}
	}
%>