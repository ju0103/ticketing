<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.faq.FaqBean"%>
<%@page import="ticketing.faq.FaqDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){
		pageNum = "1";
	}

	String faq_type = request.getParameter("faq_type");
	FaqDBBean db = FaqDBBean.getInstance();
	ArrayList<FaqBean> faqList = db.listFaq(pageNum);	

	String faq_typeName = "";
 	int faq_code;
	String faq_quest, faq_answer;
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
	<jsp:include page="../memberMain/member_Header.jsp" />
	
	<div class="container px-4 py-4">
		<div class="text-center mb-5" >
			<h2 class="text-center mb-5 fw-bolder">FAQ 목록</h2>
		</div>
	</div>
	
	<div class="container">
		<div class="col-xl-12">
			<table class="table">
				<thead>
					<th style="width: 20%;">유형</th>
					<th style="width: 35%;">질문</th>
					<th style="width: 45%;">답변</th>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < faqList.size(); i++) {
							FaqBean faq = faqList.get(i);
							faq_code = faq.getFaq_code();
							faq_type = faq.getFaq_type();
							faq_quest = faq.getFaq_quest();
							faq_answer = faq.getFaq_answer();
							
							if (faq.getFaq_type().equals("100")){
								faq_typeName = "회원정보/부가서비스";
							} else if (faq.getFaq_type().equals("200")){
								faq_typeName = "티켓예매/발권";
							} else if (faq.getFaq_type().equals("300")){
								faq_typeName = "티켓수령";
							} else if (faq.getFaq_type().equals("400")){
								faq_typeName = "취소/환불";
							} else if (faq.getFaq_type().equals("500")){
								faq_typeName = "기타";
							}
					%>
							<tr>
								<td><%= faq_typeName %></td>
								<td><%= faq_quest %></td>
								<td><%= faq_answer %></td>
							</tr>
					<%
						}
					%>
				</tbody>
			</table>
				<center>
					<%= FaqBean.memberPageNumber(2) %>
			</center>
		</div>
	</div>

	<jsp:include page="../memberMain/member_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>