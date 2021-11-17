<%@page import="ticketing.reservation.ReservationDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="ticketing.reservation.ReservationBean"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String p_code = request.getParameter("p_code");
	String reserve_seat = request.getParameter("select_seat");
	String member_id = (String) session.getAttribute("member_id");
	
	if (p_code == null) {
%>
		<script>
			document.location.href="../performance/member_performance_List.jsp";
		</script>
<%
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmm");
	long now = System.currentTimeMillis();
	String reserve_id = sdf.format(now) + p_code + reserve_seat;
	
	ReservationBean reservation = new ReservationBean();
	reservation.setMember_member_id(member_id);
	reservation.setPerformance_p_code(p_code);
	reservation.setReserve_id(reserve_id);
	reservation.setReserve_seat(reserve_seat);
	reservation.setReserve_date(new Timestamp(System.currentTimeMillis()));
	
	ReservationDBBean rdb = ReservationDBBean.getInstance();
	int result = rdb.reservePerfor(reservation);
	
	if (result == 1) {
%>
		<script>
			document.location.href="../member/member_ReservationMGRForm.jsp";
		</script>
<%
	} else {
%>
		<script>
			alert("예매 실패");
			document.location.href="../memberMain/member_Main.jsp";
		</script>
<%
	}
%>