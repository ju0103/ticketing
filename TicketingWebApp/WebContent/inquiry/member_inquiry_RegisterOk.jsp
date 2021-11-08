<%@page import="java.sql.Timestamp"%>
<%@page import="java.net.InetAddress"%>
<%@page import="ticketing.inquiry.InquiryDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="inquiry" class="ticketing.inquiry.InquiryBean" />
<jsp:setProperty property="*" name="inquiry"/>
<%
	//set member id
	String member_id = (String)session.getAttribute("member_id");
	inquiry.setMember_id(member_id);

	// set ip
	InetAddress addr = InetAddress.getLocalHost();
	String ip = addr.getHostAddress();
	inquiry.setMem_ip(ip);
	
	// set regdate
	inquiry.setMem_regdate(new Timestamp(System.currentTimeMillis()));
	
	// insert Inquiry
	InquiryDBBean db = InquiryDBBean.getInstance();
	int re = db.insertInquiry(inquiry);
	
	if (re == 1) {
%>
	<script>
		alert("등록 완료");
		document.location.href="./member_inquiry_List.jsp";
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