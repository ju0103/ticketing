<%@page import="ticketing.faq.FaqBean"%>
<%@page import="ticketing.faq.FaqDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	
	int faq_code = Integer.parseInt(request.getParameter("faq_code"));
	FaqDBBean db = FaqDBBean.getInstance();
	FaqBean faq = db.getFaq(faq_code);
	faq.setFaq_code(faq_code);
	String faq_quest = faq.getFaq_quest();
	String faq_answer = faq.getFaq_answer();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>FAQ 수정</title>
</head>
<body>
	<form method="post" action="./faqUpdateOk.jsp">
		<input type="hidden" name="faq_code" value="<%= faq_code %>">
		<table border="1">
			<tr>
				<td>FAQ 유형</td>
				<td>
					<label><input type="radio" name="faq_type" value="티켓예매/발권">티켓예매/발권</label>
					<label><input type="radio" name="faq_type" value="티켓수령">티켓수령</label>
					<label><input type="radio" name="faq_type" value="취소/환불">취소/환불</label>
					<label><input type="radio" name="faq_type" value="기타">기타</label>
				</td>
			</tr>
			<tr>
				<td>질문</td>
				<td>
					<input type="text" name="faq_quest" value="<%= faq_quest %>">
				</td>
			</tr>
			<tr>
				<td>답변</td>
				<td>
					<textarea cols="100" rows="10" name="faq_answer"><%= faq_answer %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정"></td>
			</tr>
		</table>
	</form>
</body>
</html>