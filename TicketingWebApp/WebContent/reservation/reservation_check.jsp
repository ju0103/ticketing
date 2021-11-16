<%@page import="ticketing.reservation.ReservationDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String p_code = request.getParameter("p_code");
	String member_id = (String)session.getAttribute("member_id");
	
	ReservationDBBean db = ReservationDBBean.getInstance();
	int re = db.checkReservation(p_code, member_id);
	
	if (re == 1) {
%>
		<script>
			alert("해당 공연을 이미 예매하였습니다.");
			document.location.href="../memberMain/member_Main.jsp";
		</script>
<%
	} else {
		response.sendRedirect("reservation_form.jsp?p_code=" + p_code);
	}
%>