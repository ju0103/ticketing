<%@page import="ticketing.performance.PerformanceBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="ticketing.qna.QnABean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.qna.QnADBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%	
	int log;
	if(session.getAttribute("member_id")==null && session.getAttribute("manager_id")==null) log = 0;
	else log = 1;
	
	String member_id = (String)session.getAttribute("member_id");
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum ="1";
	}
	int p_code = Integer.parseInt(request.getParameter("p_code"));
	
	QnADBBean db = QnADBBean.getInstance();
	ArrayList<QnABean> QnAList = db.listQnA(pageNum, p_code);
	
	int q_no,q_ref,q_step,q_level;
	String q_writer, q_content;
	Timestamp q_date;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
	<center>
		<table width="1000" border="1">
			<tr height="50">
				<td width="100" align="center">작성자</td>
				<td align="center">문의내용</td>
				<td width="150" align="center">작성일자</td>
		<% if(log == 1){ %>
				<td width="130"></td>
		<% } %>
			</tr>
			<%
				for(int i = 0; i<QnAList.size();i++){
					QnABean QnA = QnAList.get(i);
					q_no = QnA.getQ_no();
					q_writer = QnA.getQ_writer();
					q_content = QnA.getQ_content();
					q_date = QnA.getQ_date();
					q_level = QnA.getQ_level();
			%>
			<tr>
				<td align="center">
					<%= q_writer %>
				</td>
				<td>
				<% 
					if(log == 0){
						if(q_level > 0){//레벨 숫자만큼 들여쓰기함
							for(int j =0 ; j <q_level; j++){
				%>
								&nbsp;
				<%
							}
				%>
							☞[답변]:
				<%
						}
				%>
					<%= q_content %>
				<%
					}else{
				%>
					<a href="qna_answer.jsp?p_code=<%=p_code %>&q_no=<%=q_no%>&pageNum=<%=pageNum %>" style="text-decoration: none">
						<%
							if(q_level > 0){//레벨 숫자만큼 들여쓰기함
								for(int j =0 ; j <q_level; j++){
								%>
									&nbsp;
								<%
								}
							%>
								☞[답변]:
							<%
							}
						%>
						<%= q_content %>
					</a>
				<% } %>
				</td>
				
				<td align="center">
					<%= sdf.format(q_date) %>
				</td>
				<% 
					if(log == 1){
				%>
				<td align="right">
					<input type="button" value="수정" onclick="location.href='qna_edit.jsp?p_code=<%=p_code %>&q_no=<%=q_no %>&pageNum=<%=pageNum%>'">
					<input type="button" value="삭제" onclick="location.href='qna_delete.jsp?p_code=<%=p_code %>&q_no=<%=q_no %>&q_writer=<%=q_writer%>&pageNum=<%=pageNum%>'">				
					&nbsp;
				</td>
				<% } %>
			</tr>
			<% } %>
			<tr height="5"><td colspan="4"><hr></td></tr>
		</table>
		<br>
		<%= QnABean.pageNumber(4,p_code) %>
	</center>
</body>
</html>