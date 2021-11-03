<%@page import="ticketing.inquiry.InquiryDBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.inquiry.InquiryBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	InquiryDBBean db = InquiryDBBean.getInstance();
	ArrayList<InquiryBean> inquiryList = db.listInquiries();

	int i_id = 0, i_ref = 0;
	String member_id, i_title, i_type, i_quest;
	Timestamp i_regdate;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>1:1 문의 목록</title>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<table>
					<tr>
						<td>번호</td>
						<td>유형</td>
						<td>제목</td>
						<td>회원 아이디</td>
						<td>등록일</td>
						<td>답변</td>
					</tr>
					<%
						for (int i = 0; i< inquiryList.size(); i++) {
							InquiryBean inquiry = inquiryList.get(i);
							i_id = inquiry.getI_id();
							i_type = inquiry.getI_type();
							i_title = inquiry.getI_title();
							member_id = inquiry.getMember_id();
							i_regdate = inquiry.getI_regdate();
					%>
							<tr>
								<td><%= i_id %></td>
								<td><%= i_type %></td>
								<td><%= i_title %></td>
								<td><%= member_id %></td>
								<td><%= sdf.format(i_regdate) %></td>
								<td><a href="./manager_inquiryAnswerForm.jsp?i_id=<%= i_id %>&manager_id=<%= member_id %>&i_title=<%= i_title %>&i_type=<%= i_type %>">답변</a></td>
							</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
	</section>

	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>