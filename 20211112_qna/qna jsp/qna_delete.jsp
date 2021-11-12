<%@page import="ticketing.qna.QnADBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int p_code=Integer.parseInt(request.getParameter("p_code"));
	int q_no = 	Integer.parseInt(request.getParameter("q_no"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	String q_writer = request.getParameter("q_writer");
	System.out.println("qna_delete.jsp/q_writer = "+q_writer);
	
	String login_id="";
	if(session.getAttribute("member_id")!=null){
		login_id = (String)session.getAttribute("member_id");
	}else{
		login_id = (String)session.getAttribute("manager_id");
	}
	
	QnADBBean db = QnADBBean.getInstance();
	int re = db.deleteQnA(q_no, q_writer, login_id);
	
	if(re == 1){
		System.out.println("qna_delete.jsp :: success");
		response.sendRedirect("qna_main.jsp?p_code="+p_code);
	}else if(re == 0){
%>
		<script language="JavaScript">
			alert("본인이 쓴 글만 삭제가 가능합니다.");
			history.go(-1);
		</script>
<%
	}else if(re == -1){
%>
		<script language="JavaScript">
			alert("삭제에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>