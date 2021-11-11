<%@page import="ticketing.qna.QnADBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id = "QnA" class="ticketing.qna.QnABean"/>
<jsp:setProperty property="*" name="QnA"/>
<%
	
	int p_code = Integer.parseInt(request.getParameter("p_code"));
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){
		pageNum ="1";
	}
	int pageNumber = Integer.parseInt(pageNum);
	
	QnA.setQ_date(new Timestamp(System.currentTimeMillis()));
	QnADBBean db= QnADBBean.getInstance();
	
	if(db.insertQnA(QnA, p_code)==1){
		System.out.println("write_success");
		response.sendRedirect("qna_main.jsp?pageNum="+pageNum+"&p_code="+p_code);
	}else{
		System.out.println("writer:"+QnA.getQ_writer());
		response.sendRedirect("qna_write.jsp");
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