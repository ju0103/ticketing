<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.faq.FaqBean"%>
<%@page import="ticketing.faq.FaqDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	FaqDBBean db = FaqDBBean.getInstance();
	
	int faq_code;
	String faq_type, faq_quest, faq_answer;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>FAQ 목록</title>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<div class="container px-4 py-4">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link" href="./manager_faq_List.jsp?faq_type=all">전체 목록 보기</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="./manager_faq_List.jsp?faq_type=100">회원정보/부가서비스</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="./manager_faq_List.jsp?faq_type=200">티켓예매/발권</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="./manager_faq_List.jsp?faq_type=300">티켓수령</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="./manager_faq_List.jsp?faq_type=400">취소/환불</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="./manager_faq_List.jsp?faq_type=500">기타</a>
			</li>
		</ul>
	</div>
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>