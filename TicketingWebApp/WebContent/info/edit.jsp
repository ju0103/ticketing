<%@page import="ticketing.info.BoardBean"%>
<%@page import="ticketing.info.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	int b_id = Integer.parseInt(request.getParameter("b_id"));
	
	BoardDBBean db = BoardDBBean.getInstance();
	BoardBean board = db.getBoard(b_id);
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>글 수 정 하 기</h1>
		<form name="form" method="post" action="edit_ok.jsp?b_id=<%= b_id %>&pageNum=<%= pageNum %>">
			<table>
				<tr height="30">
					<td width="80">
						작성자
					</td>
					<td width="140">
						<input name="b_name" type="text" value="<%= board.getB_name()%>">
					</td>
				</tr>
				<tr height="30">
					<td width="80">
						제목
					</td>
					<td colspan="2">
						<input name="b_title" type="text" size="50" value="<%= board.getB_title()%>">
					</td>
				</tr>
				<!-- 
				<tr height="30">
					<td width="80">첨부파일</td>
					<td colspan="3">
						<input type="file" name="b_fname" size="40">
					</td>
				</tr>
				<tr>
				-->
					<td colspan="4">
						<textarea name="b_content" rows="10" cols="65"><%= board.getB_content() %></textarea>
					</td>
				</tr>
				<tr>
					<td width="80">
						비밀번호
					</td>
					<td colspan="3">
						<input name="b_pwd" type="password" size="12" maxlength="12">
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4">
						<input type="submit" value="수정">&nbsp;
						<input type="button" value="목록" onclick="history.go(-1)">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>








