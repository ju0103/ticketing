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
	inquiry.setManager_id(manager_id);
	
	//set member id
	String member_id = request.getParameter("member_member_id");
	inquiry.setMember_id(member_id);
	
	// set ref id
	int i_id = Integer.parseInt(request.getParameter("i_id"));
	inquiry.setI_id(i_id);

	// set ip
	InetAddress addr = InetAddress.getLocalHost();
	String admin_ip = addr.getHostAddress();
	inquiry.setAdmin_ip(admin_ip);
	
	// set regdate
	inquiry.setAdmin_regdate(new Timestamp(System.currentTimeMillis()));
	
	// insert answer
	InquiryDBBean db = InquiryDBBean.getInstance();
	int re = db.answerInquiry(inquiry);
	
	if (re == 1) {
%>
	<script>
		alert("등록 완료");
		document.location.href="./manager_inquiry_List.jsp";
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