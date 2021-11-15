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
	<meta charset="euc-kr">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<!-- CSS -->
	<link href="../css/styles.css" rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>
	<!-- navbar -->
	<jsp:include page="../memberMain/member_Header.jsp" />
	<center>
		<div class="m-5">
			<h2><b>글 수 정 하 기</h2>
		</div>
		<form name="form" method="post" action="review_editOk.jsp?p_code=<%= p_code %>&r_id=<%= r_id %>">
			<table>
				<tr height="50">
					<td width="80">
						작성자
					</td>
					<td width="140">
						<input name="r_name" type="text" value="<%= board.getReview_name()%>" disabled="disabled" class="form-control form-control-sm">
					</td>
				</tr>
				<tr height="50">
					<td width="80">
						제목
					</td>
					<td colspan="2">
						<input name="r_title" type="text" size="50" value="<%= board.getReview_title()%>" class="form-control form-control-sm">
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
				<tr height="50">
					<td colspan="4">
						<textarea name="r_content" rows="5" class="form-control"><%= board.getReview_content()%></textarea>
					</td>
				</tr>
				<tr height="50">
					<td width="80">
						비밀번호
					</td>
					<td colspan="3">
						<input name="r_pwd" type="password" size="12" maxlength="12" class="form-control form-control-sm">
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4">
						<input type="submit" value="수정" class="btn btn-primary">&nbsp;
						<input type="button" value="목록" class="btn btn-primary" onclick="history.go(-1)">
					</td>
				</tr>
			</table>
		</form>
	</center>
	<!-- footer -->
	<jsp:include page="../memberMain/member_Footer.jsp" />
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>








