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
			alert("�ߺ��Ǵ� ���̵� �����մϴ�.");
			// document.location.href="register.jsp";	// ���� ����� �������� ����
			history.back();								// ������ ����� ����
		</script>
<%
	} else {
		int re = manager.insertMember(member);
		if (re == 1) {
%>
			<script>
				alert("ȸ�������� ���ϵ帳�ϴ�.\nȸ������ �α��� ���ּ���");
				document.location.href="login.jsp";
			</script>
<%
		} else {
%>
			<script>
				alert("ȸ�����Կ� �����߽��ϴ�.");
				document.location.href="login.jsp";
			</script>
<%
		}
	}
%>