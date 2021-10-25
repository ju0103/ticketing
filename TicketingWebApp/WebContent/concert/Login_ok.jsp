<%@page import="sun.nio.cs.HistoricallyNamedCharset"%>
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
		
		ticketDAO db = ticketDAO.getInstance();
		
		user = db.memberLogin(u_id, u_pw);
		
		if(user != null) {
			session.setAttribute("user_id", u_id);
			session.setAttribute("user_pw", u_pw);
			response.sendRedirect("Main_ok.jsp");
		} else {
	%>
			<a href="Main.jsp">오류: 다시 시도해주세요</a>
	<%		
		}
	%>
</body>
</html>