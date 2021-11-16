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
	<div class="container px-4 py-4">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link" href="../qna/qna_main.jsp?p_code=<%= p_code%>">QnA</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="../review/review_list.jsp?p_code=<%= p_code%>">후기</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="../reservation/reservation_check.jsp?p_code=<%= p_code%>">예매하기</a>
			</li>
		</ul>
	</div>
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>