<%@page import="ticket.ticketDAO"%>
<%@page import="ticket.ticketDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		ticketDTO user = new ticketDTO();
		
		String u_id = request.getParameter("user_id");
		String u_pw = request.getParameter("user_pw");
		
		user.setUser_id(u_id);
		user.setUser_pw(u_pw);
		
		ticketDAO db = ticketDAO.getInstance();
		
		if(db.memberRegister(user) == 1) {
	%>
			<a href="Main_ok.jsp">가입을 축하합니다! 메인으로 가기</a>
	<%		
		} else {
	%>
			<a href="Register.jsp">오류: 다시 시도해주세요</a>
	<%		
		}
	%>
</body>
</html>