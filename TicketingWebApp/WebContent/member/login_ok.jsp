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
			alert("��ϵ� ���̵� �����ϴ�.\nȸ������ ���ּ���.");
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
				alert("��й�ȣ�� ���� �ʽ��ϴ�.");
				history.go(-1);
			</script>
<%
		} else {
%>
			<script>
				alert("�������� �ʴ� ���̵��Դϴ�.");
				history.go(-1);
			</script>
<%
			
		}
	}
%>