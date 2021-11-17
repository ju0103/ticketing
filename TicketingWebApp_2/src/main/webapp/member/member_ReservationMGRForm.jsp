<%@page import="ticketing.performance.PerformanceBean"%>
<%@page import="ticketing.performance.PerformanceDBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.reservation.ReservationBean"%>
<%@page import="ticketing.reservation.ReservationDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNumber = request.getParameter("pageNum");
	if(request.getParameter("pageNum") == null){
		pageNumber = "1";
	}
	
	String memberId = (String)session.getAttribute("member_id");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
	ReservationDBBean rdb = ReservationDBBean.getInstance();
	ArrayList<ReservationBean> myReservations = rdb.listBoard(pageNumber, memberId);
	
	int p_time = 0;
	String p_code, reserve_id, reserve_seat, p_title, p_date, p_area, p_rfname = "";
	Timestamp reserve_date;
	
	PerformanceDBBean pdb = PerformanceDBBean.getInstance();
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
  <style>
  tr{
  vertical-align:middle
  }
  body{
  height: 100%;
  }
  </style>
   
   
</head>
<body>
	<jsp:include page="../memberMain/member_Header.jsp" />
	
	<div class="container">
		<div class="row">
			<div class="col-lg-12 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<h4 class="card-header">
						<%= memberId %>님의 예매 내역
					</h4>
					<div class="card-body p-2 p-sm-5">
						<table class="table table-striped table-bordered table-hover">
							<tr>
								<td>예매 코드</td>
								<td>공연명</td>
								<td>공연 날짜 및 시간</td>
								<td>공연 장소</td>
								<td>예매일</td>
								<td>예매 좌석</td>
								<td>예매 취소</td>
							</tr>
							<%
								for(int i = 0; i < myReservations.size(); i++){
									ReservationBean rb = myReservations.get(i);
									p_code = rb.getPerformance_p_code();
									reserve_id = rb.getReserve_id();
									reserve_date = rb.getReserve_date();
									reserve_seat = rb.getReserve_seat();
									
									PerformanceBean pb = pdb.getPerformance(p_code);
									p_rfname = pb.getP_rfname();
									p_title = pb.getP_title();
									p_area = pb.getP_area();
									p_date = pb.getP_date();
							%>
								<tr>
									<td><%= reserve_id %></td>
									<td><%= p_title %></td>
									<td><%= p_date.substring(0, 10) %>&nbsp;<%= p_date.substring(11) %></td>
									<td><%= p_area %></td>
									<td><%= sdf.format(reserve_date) %></td>
									<td><%= reserve_seat %></td>
									<td><a onclick="return confirm('정말로 취소하시겠습니까?')" href="member_ReservationMGRDelete.jsp?reserve_id=<%= reserve_id%>" class="btn btn-outline-secondary">취소</a></td>
								</tr>
							<%
								}
							%>
						</table>
						<center><%= ReservationBean.pageNumber(4) %></center>
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