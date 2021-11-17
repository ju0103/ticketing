<%@page import="ticketing.manager.ManagerBean"%>
<%@page import="ticketing.manager.ManagerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("login_id");
	String pwd = request.getParameter("login_pwd");
	
	ManagerDBBean db = ManagerDBBean.getInstance();
	int result = db.managerCheck(id, pwd);
	ManagerBean manager = db.getManager(id);

	if (manager == null) {
%>
			<script>
				alert("존재하지 않는 관리자입니다.");
				history.go(-1);
			</script>
<%
	} else {
		if (result == 1) {
			// 세션에 사용자 정보 추가
			session.setAttribute("manager_id", id);
			session.setAttribute("manager_name", manager.getManager_name());
			session.setAttribute("manager", "yes");
			response.sendRedirect("../managerMain/manager_Main.jsp");
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