<%@page import="ticketing.qna.QnABean"%>
<%@page import="ticketing.qna.QnADBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int p_code=Integer.parseInt(request.getParameter("p_code"));
	int q_no=0;
	int q_ref=1,q_step=0,q_level=0;
	String q_content="";
	
	String login_id="";
	if(session.getAttribute("member_id")!=null){
		login_id = (String)session.getAttribute("member_id");
	}else{
		login_id = (String)session.getAttribute("manager_id");
	}
	
	if(request.getParameter("q_no")!=null){
		q_no = Integer.parseInt(request.getParameter("q_no"));
	}
	QnADBBean db = QnADBBean.getInstance();
	QnABean QnA = db.getQnA(p_code,q_no);
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum ="1";
	}
	
	if(QnA != null){
		p_code = QnA.getP_code();
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
	<script type="text/javascript" src="../js/qna.js" charset="utf-8"></script>
</head>
<body>
	<center>
		<form action="qna_write_ok.jsp?p_code=<%=p_code %>&pageNum=<%=pageNum%>" method="post" name="form">
			<input type="hidden" name="p_code" value="<%=p_code%>">
			<input type="hidden" name="q_no" value="<%=q_no%>">
			<input type="hidden" name="q_ref" value="<%=q_ref%>">
			<input type="hidden" name="q_step" value="<%=q_step%>">
			<input type="hidden" name="q_level" value="<%=q_level%>">
			<input type="hidden" name="q_writer" value="<%=login_id%>">
			<table>
				<tr>
					<td>문의내용&nbsp;&nbsp;</td>
					<td>
					<% 
						if(q_no == 0){
					%>
<textarea cols="100" rows="2" name="q_content" 
placeholder=" * 게시된 글의 저작권은 글을 작성한 회원에게 있습니다. 
 * 게시물로 인해 발생하는 문제는 게시자 본인에게 책임이 있습니다."></textarea>
					<%	
						}else{
					%>
							<input type="text" name="q_content" size="80" value="[답변]:<%= q_content%>">
					<% 
					} 
					%>
							&nbsp;&nbsp;
							
					</td>
					<td><input type="button" value="등록" onclick="check_ok()"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>