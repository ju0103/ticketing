<%@page import="java.util.Date"%>
<%@page import="ticketing.review.ReviewDBBean"%>
<%@page import="ticketing.performance.PerformanceBean"%>
<%@page import="ticketing.performance.PerformanceDBBean"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	ReviewDBBean db = new ReviewDBBean();	
	PerformanceDBBean pdb = PerformanceDBBean.getInstance();
	PerformanceBean board = null;

	int p_code = 0, p_price = 0, p_ptime = 0, p_rate = 0 ;	
	String p_title = "", p_description = "", p_perfomer = "", p_area = "", p_type = "", p_date = "", p_rfname = ""; 
	
	if (request.getParameter("p_code") != null){
		p_code = Integer.parseInt(request.getParameter("p_code"));
		board = pdb.getBoard(Integer.parseInt(request.getParameter("p_code")));
	
	} else {
		p_code = 10000;
		board = pdb.getBoard(p_code);
	}
	
	p_title = board.getP_title();
	p_description = board.getP_description();
	p_perfomer = board.getP_performer();
	p_area = board.getP_area();
	p_type = board.getP_type();
	p_date = board.getP_date();
	p_price = board.getP_price();
	p_ptime = board.getP_time();
	p_rate = board.getP_rating();
	p_rfname = board.getP_rfname();
	
%>        
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%= p_title %></title>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
    <style>
    	span {
    		border: 1px solid #ccc;
    		border-radius: 10px;
    		margin: 10;
    		padding: 5 0 5;
    	}
    	
    	span a {
    		color: #000;
    		text-decoration: none;
    	}
    	
    	#wrap-summary td {
    		width: 120;
    		height: 50;
    		text-align: left;
    	}
    	
    	#wrap-summary #td-sub {
    		font-weight: bold;
    	}
    </style>
	<!-- 탭 메뉴 스크립트 -->
	<script>
		function openTab(evt, tabName) {
			var i, tabcontent, tablinks;
			
			tabcontent = document.getElementsByClassName("tabcontent");
			
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			
			tablinks = document.getElementsByClassName("tablinks");
			
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace("_active", "");
			}
			document.getElementById(tabName).style.display = "block";
			evt.currentTarget.className += "_active";
		}
	</script>
</head>
<body>
	<!-- Header -->
	<jsp:include page="../memberMain/member_Header.jsp"></jsp:include>
	<!-- Header -->
	<center>
	<form action="../reservation/reservation_check.jsp" method="post" name="form" enctype="multipart/form-data">
		<div class="container py-4" style="margin-bottom: 200;">
			<div>
				<div class="row p-4">
					<div class="col">
						<%
							if(p_rfname != null){
						%>
								<img src="../upload/<%=p_rfname %>" width="240">
						<%
							}
						%>
					</div>
					<div class="col" style="border-left: 1px solid #ccc;">
						<div align="left" style="font-size: 20px; font-weight: bold;">제목: <%= p_title %></div>
						<div align="left" style="margin-top: 10;"><p><%= p_description %></p></div>
						<div align="left">
							<table id="wrap-summary">
								<tr>
									<td id="td-sub">공연 날짜</td>
									<td><%= p_date %></td>
									<td id="td-sub">공연장</td>
									<td><%= p_area %></td>
								</tr>
								<tr>
									<td id="td-sub">관람시간</td>
									<td><%= p_ptime %>분</td>
									<td id="td-sub">관람등급</td>
									<td><%= p_rate %>세 이상</td>
								</tr>
								<tr>
									<td id="td-sub">장르</td>
									<td><%= p_type %></td>
								</tr>
							</table>
							<div style="margin: 50 0 0 300">
								<b><%= p_price %> 원</b>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" value="예매하기" class="btn btn-primary" onclick="location.href='../reservation/reservation_check.jsp?p_code=<%= p_code%>'">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 탭 메뉴바 -->
			<div class="row m-5">
				<span class="col">
					<a class="tablinks_active" onclick="openTab(event, 'tab1')">
						상세정보
					</a>
				</span>
				<span class="col">
					<a class="tablinks" onclick="openTab(event, 'tab2')">
						공연후기(<%= db.countBoard(p_code) %>)
					</a>
				</span>
				<span class="col">
					<a class="tablinks" onclick="openTab(event, 'tab3')">
						QnA
					</a>
				</span>
				<span class="col">
					<a class="tablinks" onclick="openTab(event, 'tab4')">
						예매안내
					</a>
				</span>
			</div>
			<!-- 탭 내용 표시 -->
			<div id="tab1" class="tabcontent" style="display: block;"> 
				<div align="left" style="margin-left: 80">
					<h2>공연 상세 정보</h2>
					<p>출 연 진</p>
					<ul>
						<li><%= p_perfomer %></li>
					</ul>
					<p>공연명</p>
					<ul>
						<li><%= p_title %></li>
					</ul>
					<p>상세정보</p>
					<ul>
						<li><%= p_description %></li>
					</ul>
					<div id="ori-poster">
						<img src="../upload/<%=p_rfname %>">
					</div>
				</div>
			</div>
			<div id="tab2" class="tabcontent" style="display: none;">
				<jsp:include page="../review/review_list.jsp">
					<jsp:param value="<%=p_code %>" name="p_code"/>
				</jsp:include>
			</div>
			<div id="tab3" class="tabcontent" style="display: none;">
				<jsp:include page="../qna/qna_list.jsp">
					<jsp:param value="<%=p_code %>" name="p_code"/>
				</jsp:include>
			</div>
			<div id="tab4" class="tabcontent" style="display: none;">
				탭4 내용
			</div>
		</div>
	</form>
	</center>
	<!-- footer -->
	<jsp:include page="../memberMain/member_Footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>