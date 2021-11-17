<%@page import="ticketing.faq.FaqDBBean"%>
<%@page import="ticketing.manager.ManagerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String isManager = (String)session.getAttribute("manager");
	int faq_code = Integer.parseInt(request.getParameter("faq_code"));
	
	if (isManager.equals("yes") ){
		FaqDBBean faqDb = FaqDBBean.getInstance();
		int deleteResult = faqDb.deleteFaq(faq_code);
		System.out.println("delete" + deleteResult);
		if (deleteResult == 1) {
%>
			<script type="text/javascript">
				alert("삭제되었습니다.");
				document.location.href="./manager_faq_List.jsp?faq_type=100";
			</script>
<%		
		} else {
%>
			<script type="text/javascript">
				alert("삭제 실패하였습니다.");
				document.location.href="./manager_faq_List.jsp";
			</script>
<%		
		}
	} else {
%>
		<script type="text/javascript">
			alert("다시 로그인해주세요.");
			document.location.href="/managerMain.jsp";
		</script>
<%		
	}
%>