<%@page import="ticketing.review.ReviewBean"%>
<%@page import="ticketing.review.ReviewDBBean"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%
	int p_code = Integer.parseInt(request.getParameter("p_code"));
	int r_id = Integer.parseInt(request.getParameter("r_id"));
	
	ReviewDBBean db = ReviewDBBean.getInstance();
	ReviewBean board = db.getBoard(p_code, r_id);
%>	
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>글 수 정 하 기</h1>
		<form name="form" method="post" action="review_editOk.jsp?p_code=<%= p_code %>&r_id=<%= r_id %>">
			<table>
				<tr height="30">
					<td width="80">
						작성자
					</td>
					<td width="140">
						<input name="r_name" type="text" value="<%= board.getReview_name()%>" disabled="disabled">
					</td>
				</tr>
				<tr height="30">
					<td width="80">
						제목
					</td>
					<td colspan="2">
						<input name="r_title" type="text" size="50" value="<%= board.getReview_title()%>">
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
						<textarea name="r_content" rows="10" cols="65"><%= board.getReview_content()%></textarea>
					</td>
				</tr>
				<tr>
					<td width="80">
						비밀번호
					</td>
					<td colspan="3">
						<input name="r_pwd" type="password" size="12" maxlength="12">
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








