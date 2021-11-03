<%@page import="ticketing.inquiry.InquiryDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="inquiry" class="ticketing.inquiry.InquiryBean" />
<jsp:setProperty property="*" name="inquiry"/>
<%
	//set manager id
	String manager_id = (String)session.getAttribute("manager_id");
	inquiry.setMember_id(manager_id);
	
	// set ref id
	int i_id = Integer.parseInt(request.getParameter("i_id"));
	inquiry.setI_ref(i_id);

	// set ip
	InetAddress addr = InetAddress.getLocalHost();
	String ip = addr.getHostAddress();
	inquiry.setI_ip(ip);
	
	// set regdate
	inquiry.setI_regdate(new Timestamp(System.currentTimeMillis()));
	
	// insert answer
	InquiryDBBean db = InquiryDBBean.getInstance();
	int re = db.insertInquiry(inquiry);

	if (re == 1) {
%>
	<script>
		alert("등록 완료");
		document.location.href="./manager_inquiryList.jsp";
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