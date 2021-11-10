<%@page import="myUtil.HanConv"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="ticketing.reservation.ReservationDBBean"%>
<%@page import="ticketing.reservation.ReservationBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String p_code = request.getParameter("p_code");
	String reserve_seat = HanConv.toKorean(request.getParameter("select_seat"));

	if (p_code == null) {
%>
		<script>
			document.location.href="../member_performance_List.jsp";
		</script>
<%
	}
	String member_id = (String) session.getAttribute("member_id");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmm");
    
    // 예매 번호 = 결제 완료 시간 + 공연 번호 + 좌석
    String reserve_id = sdf.format(System.currentTimeMillis()) + p_code + reserve_seat;
    
    // set ReservationBean
    ReservationBean reservation = new ReservationBean();
    reservation.setMember_member_id(member_id);
    reservation.setPerformance_p_code(p_code);
    reservation.setReserve_id(reserve_id);
    reservation.setReserve_seat(reserve_seat);
    reservation.setReserve_date(new Timestamp(System.currentTimeMillis()));
    
    ReservationDBBean db = ReservationDBBean.getInstance();
    int re = db.reservePerfor(reservation);
    
    if (re == 1) {
%>
		예매 완료
		<script>
			document.location.href="../memberMain/member_Main.jsp";
		</script>
<%
    } else {
%>
		예매 실패
		<script>
			alert("예매 실패");
			document.location.href="../memberMain/member_Main.jsp";
		</script>
<%
    }
%>