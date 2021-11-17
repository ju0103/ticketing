<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="ticketing.performance.PerformanceBean"%>
<%@page import="ticketing.performance.PerformanceDBBean"%>
<%@page import="ticketing.reservation.ReservationBean"%>
<%@page import="ticketing.reservation.ReservationDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String member_id = (String)session.getAttribute("member_id");

	if (member_id == null) {
%>
		<script>
			document.location.href="../member/member_LoginForm.jsp";
		</script>
<%
	}
	
	ReservationDBBean rdb = ReservationDBBean.getInstance();
	ArrayList<ReservationBean> myReservations = rdb.getMyReservation(member_id);

	int p_time = 0;
	String p_code, reserve_id, reserve_seat, p_title, p_date, p_area;
	Timestamp reserve_date;
	
	PerformanceDBBean pdb = PerformanceDBBean.getInstance();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>나의 예매 내역</title>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- navbar -->
	<jsp:include page="../memberMain/member_Header.jsp" />
	
	<div class="container">
		<div class="row">
			<div class="col-lg-12 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-header">
						<%= member_id %>님의 예매 내역
					</div>
					<div class="card-body p-2 p-sm-5">
						<table class="table">
							<tr>
								<td>예매 번호</td>
								<td>공연 제목</td>
								<td>공연 날짜 및 시간</td>
								<td>공연 장소</td>
								<td>예매 좌석</td>
							</tr>
							<%
								for (int i = 0; i < myReservations.size(); i++) {
									ReservationBean reservation = myReservations.get(i);
									
									p_code = reservation.getPerformance_p_code();
									reserve_id = reservation.getReserve_id();
									reserve_seat = reservation.getReserve_seat();
									reserve_date = reservation.getReserve_date();
									
									PerformanceBean perfor = pdb.getPerformance(p_code);
									p_title = perfor.getP_title();
									p_date = perfor.getP_date();
									p_area = perfor.getP_area();
							%>
								<tr>
									<td><%= reserve_id %></td>
									<td><%= p_title %></td>
									<td><%= p_date.substring(0, 10) %>&nbsp;<%= p_date.substring(11) %></td>
									<td><%= p_area %></td>
									<td><%= reserve_seat %></td>
								</tr>
							<%
								}
							%>
						</table>
	            	</div>
	        	</div>
	      	</div>
	    </div>
	</div>
		
	<!-- footer -->
	<jsp:include page="../memberMain/member_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>