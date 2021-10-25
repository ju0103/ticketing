<%@page import="ticketing.performance.PerformanceBean"%>
<%@page import="ticketing.performance.PerformanceDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- 한글 구현 진행 중 / 수정/삭제 버튼 구현--%>
<%
	PerformanceDBBean pdb = PerformanceDBBean.getInstance();
	PerformanceBean board = pdb.getBoard(Integer.parseInt(request.getParameter("p_code")));
	
	
	int p_code =  board.getP_code();
	String p_title = board.getP_title();
	String p_description = board.getP_description();
	String p_rfname = board.getP_rfname();

%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>글 내 용 보 기</h1>
		<table border="1" width="800" cellspacing="0">
			<tr height="30" align="center">
				<td width="100">
					콘서트번호
				</td>
				<td width="200">
					<%= p_code %>
				</td>
				<td width="100">
					공연 제목
				</td>
				<td width="200">
					<%=p_title  %>
				</td>
			</tr>
			<tr height="30" align="center">
				<td width="100">
					공연 내용
				</td>
				<td width="200">
					<%=p_title  %>
				</td>
			</tr>
			<tr>
				<td width="100">포스터</td>
				<td><img  src="../upload/<%=p_rfname %>"> </td>
			</tr>
		</table>
		<input type="button" value="삭제" onclick="location.href='perfor_DeleteForm.jsp?p_code=<%= p_code %>'">&nbsp;&nbsp;			
		<input type="button" value="수정" onclick="location.href='perfor_UpdateForm.jsp?p_code=<%= p_code %>'">			
	</center>
</body>
</html>