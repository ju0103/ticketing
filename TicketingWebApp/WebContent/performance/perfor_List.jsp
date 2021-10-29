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
<jsp:include page="../managerMain/managerHeader.jsp" />	
	<%
		if ((String)session.getAttribute("manager") == "yes") {
	%>
			<center>
			<table  class="table table-striped table-bordered table-hover" >
					<tr height="25">
						<td width="100"  align="center">포스터</td>
						<td width="40" align="center">등록번호</td>
						<td width="300" align="center">콘서트 제목</td>
						<td width="120" align="center">출연진</td>
						<td width="130" align="center">파일이름</td>
						<td width="130" align="center">공연등록일</td>
						<td width="130" align="center">공연장소</td>
						<td width="130" align="center">공연일시</td>
					</tr>	
					
				<%
						for(int i=0; i<perforList.size(); i++){
							PerformanceBean board = perforList.get(i);
							p_code = board.getP_code();
						 	p_title = board.getP_title();
							p_performer = board.getP_performer();
							p_rfname = board.getP_rfname();
							p_regdate = board.getP_regdate();
							p_fname = board.getP_fname();
							p_area = board.getP_area();
							p_date = board.getP_date();
					%>
							<tr height="25">
								<td align="center">
								<%
									if(p_rfname != null){
										%>
									<img src="../upload/<%=p_fname %>" width="50" height="50">
										<%
									} else{
										%>
										<a href="perfor_UpdateForm.jsp?p_code=<%=p_code%>">포스터 등록</a>
										<%
									}
								%>
								</td>
									<td align="center">
										<%= p_code %>
									</td>
									<td>
										<a href="perfor_View.jsp?p_code=<%= p_code %>"><%= p_title %></a>
										
									</td>
									<td align="center">
										<%= p_performer %>
									</td>
									<td align="center">
										<%= p_rfname %>
									</td>
									<td align="center">
										<%= sdf.format(p_regdate) %>
									</td>
									<td>
										<%= p_area %>
									</td>
									<td align="center">
										<%= p_date %>
									</td>
								</tr>
									<%
						}
					%>
					
				</table>
				<input class="btn btn-primary" type="button" value="등록" onclick="location.href='perfor_RegisterForm.jsp'">
			</center>
	<%
		} else {
	%>
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
										<a href="#">
											<img class="card-img-top" src="../upload/<%=p_fname %>" width="50" height="150">
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
	<%
		}
	%>
	<jsp:include page="../memberMain/footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>