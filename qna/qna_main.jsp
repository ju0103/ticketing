<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String p_code = request.getParameter("p_code");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<a href="../memberMain/member_Main.jsp">Ȩ����</a>
	<center>
		<h1>QnA �Խ���</h1>
		<jsp:include page="qna_write.jsp?p_code=<%=p_code%>"/>
		<jsp:include page="qna_list.jsp?p_code=<%=p_code%>"/>
	</center>
	
</body>
</html>