<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.performance.PerformanceBean"%>
<%@page import="ticketing.performance.PerformanceDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- 한글 구현완(업로드파일x)/ 메인 페이지 버튼 추가 예정 / 페이징  --%>
<%
    PerformanceDBBean pdb = PerformanceDBBean.getInstance();
    ArrayList<PerformanceBean> perforList = pdb.listBoard();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   
    String  p_type, p_title,p_area,p_date,p_performer,p_fname,p_rfname,p_detailarea;
    int p_code, p_price,p_seat,p_fsize,p_ref,p_step,p_level,p_rating,p_time;
    Timestamp p_regdate;
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
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<%
					for (int i = 0; i< perforList.size(); i++) {
						PerformanceBean board = perforList.get(i);
						p_code = board.getP_code();
					 	p_title = board.getP_title();
						p_performer = board.getP_performer();
						p_rfname = board.getP_rfname();
						p_fname = board.getP_fname();
				%>
						<div class="mb-5">
							<div class="card h-100">
								<a href="../performance/perform_Info.jsp?p_code=<%= p_code%>">
									<img class="card-img-top" src="../upload/<%=p_fname %>" width="30">
									<div class="card-body text-center">
										<h6 class="card-title"><%= p_title %></h2>
									</div>
								</a>
							</div>
						</div>
				<%
					}
				%>
			</div>
		</div>
	</section>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>