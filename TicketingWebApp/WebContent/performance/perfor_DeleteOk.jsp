<%@page import="ticketing.performance.PerformanceDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String manager_id = request.getParameter("manager_id");
	String manager_pwd = request.getParameter("manager_pwd");
	int p_code = Integer.parseInt(request.getParameter("p_code"));
	
	PerformanceDBBean db = PerformanceDBBean.getInstance();
	int re = db.deleteBoard(manager_id, manager_pwd, p_code);
	
	if(re==1){
	%>
		<script type="text/javascript">
		alert("���� ����");
		response.sendRedirect("perfor_List.jsp"); //��� ����;
		</script>
	<%
	}else if(re == 0){
		%>
		<script type="text/javascript">
			alert("��й�ȣ�� ���� �ʽ��ϴ�.");
			history.go(-1);
		</script>
		<%
	}else if(re == -1){
		%>
		<script type="text/javascript">
			alert("������ �����߽��ϴ�.");
			history.go(-1);
		</script>
		<%
	}
%>

</body>
</html>