<%@page import="ticketing.qna.QnABean"%>
<%@page import="ticketing.qna.QnADBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int p_code=Integer.parseInt(request.getParameter("p_code"));
	int q_no=0;
	int q_ref=1,q_step=0,q_level=0;
	String q_content="";
	String memberId = (String)session.getAttribute("member_id");
	if(memberId == null){
%>
		<script language="JavaScript">
			alert("로그인을 해야 작성이 가능합니다.");
			history.go(-1);
		</script>
<%
		response.sendRedirect("qna_main.jsp?p_code="+p_code);
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
</head>
<body>
	<center>
		<form action="qna_write_ok.jsp?p_code=<%=p_code %>&pageNum=<%=pageNum%>" method="post" name="form">
			<input type="hidden" name="p_code" value="<%=p_code%>">
			<input type="hidden" name="q_no" value="<%=q_no%>">
			<input type="hidden" name="q_ref" value="<%=q_ref%>">
			<input type="hidden" name="q_step" value="<%=q_step%>">
			<input type="hidden" name="q_level" value="<%=q_level%>">
			<table>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="q_writer" value="<%=memberId%>"></td>
				</tr>
				<tr>
					<td>문의내용</td>
					<td>
					<% 
						if(q_no == 0){
							%>
							<input type="text" name="q_content" size="80">
							<%	
						}else{
							%>
							<input type="text" name="q_content" size="80" value="[답변]:<%= q_content%>">
						<%
						}
					%>
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="등록" >
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="취소">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="목록" onclick="location.href='qna_list.jsp?pageNum=<%=pageNum%>'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>