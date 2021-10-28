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
	<title>FAQ ����</title>
</head>
<body>
	<form method="post" action="./faqUpdateOk.jsp">
		<input type="hidden" name="faq_code" value="<%= faq_code %>">
		<table border="1">
			<tr>
				<td>FAQ ����</td>
				<td>
					<label><input type="radio" name="faq_type" value="Ƽ�Ͽ���/�߱�">Ƽ�Ͽ���/�߱�</label>
					<label><input type="radio" name="faq_type" value="Ƽ�ϼ���">Ƽ�ϼ���</label>
					<label><input type="radio" name="faq_type" value="���/ȯ��">���/ȯ��</label>
					<label><input type="radio" name="faq_type" value="��Ÿ">��Ÿ</label>
				</td>
			</tr>
			<tr>
				<td>����</td>
				<td>
					<input type="text" name="faq_quest" value="<%= faq_quest %>">
				</td>
			</tr>
			<tr>
				<td>�亯</td>
				<td>
					<textarea cols="100" rows="10" name="faq_answer"><%= faq_answer %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="����"></td>
			</tr>
		</table>
	</form>
</body>
</html>