<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.faq.FaqBean"%>
<%@page import="ticketing.faq.FaqDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	FaqDBBean db = FaqDBBean.getInstance();
	ArrayList<FaqBean> faqList = db.listFaq();
	
	int faq_code;
	String faq_type, faq_quest, faq_answer;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td width="100">유형</td>
			<td width="300">질문</td>
			<td width="500">답변</td>
			<td width="50">수정</td>
			<td width="50">삭제</td>
		</tr>
		<%
			for (int i = 0; i < faqList.size(); i++) {
				FaqBean faq = faqList.get(i);
				faq_code = faq.getFaq_code();
				faq_type = faq.getFaq_type();
				faq_quest = faq.getFaq_quest();
				faq_answer = faq.getFaq_answer();
		%>
				<tr>
					<td><%= faq_type %></td>
					<td><%= faq_quest %></td>
					<td><%= faq_answer %></td>
					<td><a href="./faqUpdateForm.jsp?faq_code=<%= faq_code %>">수정</a></td>
					<td><a href="./faqDeleteOk.jsp?faq_code=<%= faq_code %>">삭제</a></td>
				</tr>
		<%
			}
		%>
	</table>
</body>
</html>