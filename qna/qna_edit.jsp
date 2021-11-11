<%@page import="ticketing.qna.QnABean"%>
<%@page import="ticketing.qna.QnADBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int p_code = Integer.parseInt(request.getParameter("p_code"));
	int q_no = Integer.parseInt(request.getParameter("q_no"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	System.out.println("edit.jsp/p_code="+p_code);
	System.out.println("edit.jsp/q_no="+q_no);
	QnADBBean db = QnADBBean.getInstance();
	QnABean qna = db.getQnA(p_code, q_no);
	String q_writer = qna.getQ_writer();
	String q_content = qna.getQ_content();
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="qna.js" charset="utf-8"></script>
</head>
<body>
	<center>
		<h1>수정하기</h1>
		<form action="qna_edit_ok.jsp?p_code=<%=p_code%>&q_no=<%=q_no %>&pageNum=<%=pageNum %>&q_writer=<%= q_writer %>" method="post" name="form">
			<table>
				<tr>
					<td>작성자</td>
					<td><%= q_writer %></td>
				</tr>
				<tr>
					<td>문의내용</td>
					<td>
						<input type="text" name="q_content" value="<%= q_content %>" size="80">
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="수정">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="취소">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="목록" onclick="location.href='qna_main.jsp?p_code=<%=p_code%>'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>