<%@page import="ticketing.qna.QnABean"%>
<%@page import="ticketing.qna.QnADBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int p_code=Integer.parseInt(request.getParameter("p_code"));
	String memberId = (String)session.getAttribute("member_id");
	int q_no=0;
	int q_ref=1,q_step=0,q_level=0;
	String q_content="";
	if(request.getParameter("q_no")!=null){
		q_no = Integer.parseInt(request.getParameter("q_no"));
	}
	System.out.println("answer.jsp : q_no = "+q_no);
	QnADBBean db = QnADBBean.getInstance();
	QnABean QnA = db.getQnA(p_code, q_no);
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	if(QnA != null){
		q_content = QnA.getQ_content();
		q_ref = QnA.getQ_ref();
		q_step = QnA.getQ_step();
		q_level = QnA.getQ_level();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="qna.js" charset="utf-8" ></script>
</head>
<body>
	<center>
		<h1>답변하기</h1>
		<form action="qna_write_ok.jsp?p_code=<%=p_code %>&pageNum=<%=pageNum%>" method="post" name="form">
			<input type="hidden" name="q_no" value="<%=q_no%>">
			<input type="hidden" name="q_ref" value="<%=q_ref%>">
			<input type="hidden" name="q_step" value="<%=q_step%>">
			<input type="hidden" name="q_level" value="<%=q_level%>">
			<table>
				<tr>
					<td>문의내용</td>
					<td><%=q_content %></td>
				</tr>
				<tr height="20"><td></td></tr>
				<tr>
					<td>답변인</td>
					<td><input type="text" name="q_writer" value="<%= memberId %>" translate="no"></td>
				</tr>
				<tr>
					<td>답변내용</td>
					<td>
						<input type="text" name="q_content" size="80">
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="button" value="등록" onclick="check_ok()">
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