<%@page import="ticketing.faq.FaqDBBean"%>
<%@page import="ticketing.faq.FaqBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="faq" class="ticketing.faq.FaqBean"></jsp:useBean>
<jsp:setProperty property="*" name="faq"/>
<%
	FaqDBBean db = FaqDBBean.getInstance();
	int re = db.insertFaq(faq);
	
	if (re == 1) {
%>
	<script>
		alert("등록 완료");
		document.location.href="./manager_faq_List.jsp";
	</script>
<%
	} else {
%>
	<script>
		alert("등록 실패");
		history.back();
	</script>
<%
	}
%>