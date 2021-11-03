<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="ticketing.inquiry.InquiryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.inquiry.InquiryDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//set member_id
	String member_id = (String)session.getAttribute("member_id");
	InquiryBean inquiry = new InquiryBean();
	inquiry.setMember_id(member_id);
	
	// get Inquiries
	InquiryDBBean db = InquiryDBBean.getInstance();
	ArrayList<InquiryBean> inquiryList = db.getInquiry(member_id);

	int i_id = 0;
	String i_title, i_type, i_quest;
	Timestamp i_regdate;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>1:1 ���� ���</title>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../memberMain/header.jsp" />
	<div class="container px-4 py-4">
		<div class="text-center mb-5" >
			<h2 class="text-center mb-5 fw-bolder">���� 1:1 ���� ���</h2>
		</div>
	</div>
	
	<div class="container">
		<div class="col-xl-12">
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="type1" role="tabpanel" aria-labelledby="type1-tab">
					<div class="card-body">
						<div class="dataTable-container">
							<table class="dataTable-table">
								<thead>
									<th style="width: 20%;">����</th>
									<th style="width: 35%;">����</th>
									<th style="width: 20%;">�亯</th>
									<th style="width: 25%;">�����</th>
								</thead>
								<tbody>
									<%
										for (int i = 0; i< inquiryList.size(); i++) {
											inquiry = inquiryList.get(i);
											i_type = inquiry.getI_type();
											i_title = inquiry.getI_title();
											i_quest = inquiry.getI_quest();
											i_regdate = inquiry.getI_regdate();
									%>
											<tr>
												<td><%= i_type %></td>
												<td><%= i_title %></td>
												<td>
													<%
														if (i_quest == null) {
													%>
															�亯 ����.
													<%
														} else {
													%>
															<%= i_quest %>
													<%
														}
													%>
												</td>
												<td><%= sdf.format(i_regdate) %></td>
											</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../memberMain/footer.jsp" />
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>