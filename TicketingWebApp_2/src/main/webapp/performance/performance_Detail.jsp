<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.performance.PerformanceBean"%>
<%@page import="ticketing.performance.PerformanceDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String p_code = request.getParameter("p_code");

	if (p_code == null) {
%>
		<script>
			document.location.href="../member_performance_List.jsp";
		</script>
<%
	}
    PerformanceDBBean pdb = PerformanceDBBean.getInstance();
    PerformanceBean performance = pdb.getPerformance(p_code);
    String p_title = performance.getP_title();
    String p_area = performance.getP_area();
    String p_date = performance.getP_date();
    String p_performer = performance.getP_performer();
    String p_fname = performance.getP_fname();
    String p_rfname = performance.getP_rfname();
    String p_detailarea = null;
    String p_description = performance.getP_description();
    
    int p_price = performance.getP_price();
    int p_seat = performance.getP_seat();
    int p_fsize = performance.getP_fsize();
    int p_ref = performance.getP_ref();
    int p_step = performance.getP_step();
    int p_level = performance.getP_level();
    int p_rating = performance.getP_rating();
    int p_time = performance.getP_time();
    
    Timestamp p_regdate = performance.getP_regdate();
%>

<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>Insert title here</title>
	<!-- CSS -->
	<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../memberMain/member_Header.jsp" />
	
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-12 col-lg-10 mx-auto">
				<header class="mb-4">
					<h1 class="fw-bolder mb-1" style="margin: 30px"><%= p_title %></h1>
				</header>
				<section class="mb-5">
					<table class="table">
						<tr>
							<td class="align-middle" align="center" rowspan="6" width="25%">
								<img class="img-fluid rounded" src="../upload/<%=p_fname %>">
							</td>
						</tr>
						<tr>
							<td class="align-middle" height="20" style="padding: 15px;" width="10%">장소</td>
							<td class="align-middle" height="20" style="padding: 15px;" width="55%"><%= p_area %></td>
						</tr>
						<tr>
							<td class="align-middle" height="20" style="padding: 15px;" width="10%">공연일</td>
							<td class="align-middle" height="20" style="padding: 15px;" width="55%"><%= p_date %></td>
						</tr>
						<tr>
							<td class="align-middle" height="20" style="padding: 15px;" width="10%">공연시간</td>
							<td class="align-middle" height="20" style="padding: 15px;" width="55%"><%= p_time %>분</td>
						</tr>
						<tr>
							<td class="align-middle" height="20" style="padding: 15px;" width="10%">관람연령</td>
							<td class="align-middle" height="20" style="padding: 15px;" width="55%">만 <%= p_rating %>세 이상</td>
						</tr>
						<tr>
							<td class="align-middle" height="20" style="padding: 15px;" width="10%">가격</td>
							<td class="align-middle" height="20" style="padding: 15px;" width="55%">전석 <b><%= p_price %></b>원</td>
						</tr>
						<tr>
							<td class="align-middle" height="500" colspan="3"><pre><%= p_description %></pre></pre></td>
						</tr>
					</table>
					<jsp:include page="../performance/performance_DetailEtc.jsp"></jsp:include>
				</section>
	      	</div>
	    </div>
	</div>
	
	<jsp:include page="../memberMain/member_Footer.jsp"></jsp:include>
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>