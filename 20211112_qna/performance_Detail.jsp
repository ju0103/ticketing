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

	<div class="container mt-5">
		<div class="row">
			<div class="col-lg-8">
				<article>
					<header class="mb-4">
						<h1 class="fw-bolder mb-1"><%= p_title %></h1>
					</header>
					<figure class="mb-4">
						<img class="img-fluid rounded" src="../upload/<%=p_fname %>">
					</figure>
					<section class="mb-5">
						<table>
							<tr>
								<td>장소</td>
								<td><%= p_area %><%= p_detailarea %></td>
							</tr>
							<tr>
								<td>공연일</td>
								<td><%= p_date %></td>
							</tr>
							<tr>
								<td>공연시간</td>
								<td><%= p_time %>분</td>
							</tr>
							<tr>
								<td>관람연령</td>
								<td>만 <%= p_rating %>세 이상</td>
							</tr>
							<tr>
								<td>가격</td>
								<td>전석 <b><%= p_price %></b>원</td>
							</tr>
							<tr>
								<td>
									<button class="btn btn-primary btn-lg" onclick="location.href='../qna/qna_main.jsp?p_code=<%= p_code%>'">QnA</button>
								</td>
								<td>
									<button class="btn btn-primary btn-lg" onclick="location.href='../review/review_list.jsp?p_code=<%= p_code%>'">후기</button>
								</td>
								<td>
									<button class="btn btn-primary btn-lg" onclick="location.href='../reservation/reservation_form.jsp?p_code=<%= p_code%>'">예매하기</button>
								</td>
							</tr>
						</table>
					</section>
				</article>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>