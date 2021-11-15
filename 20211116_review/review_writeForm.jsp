<%@page import="ticketing.member.MemberBean"%>
<%@page import="ticketing.member.MemberDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.review.ReviewBean"%>
<%@page import="ticketing.review.ReviewDBBean"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%
	String pageNum = request.getParameter("pageNum");
	String r_name = "";

	if (session.getAttribute("member") == null) {
		response.sendRedirect("../member/member_LoginForm.jsp");
	} else {
		r_name = (String)(session.getAttribute("member_id"));
	}
	
	int r_id=0, p_code;
	
	if(request.getParameter("r_id") != null){
		r_id = Integer.parseInt(request.getParameter("b_id"));
	}
	
	if(request.getParameter("p_code") != null){
		p_code = Integer.parseInt(request.getParameter("p_code"));
	} else {
		// 테스트 performance_code
		p_code = 10000;
	}
	if(pageNum == null) {
		pageNum="1";
	}
%>
<html>
<head>
<title>Insert title here</title>
	<meta charset="euc-kr">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<!-- CSS -->
	<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- navbar -->
	<jsp:include page="../memberMain/member_Header.jsp" />
	<center>
		<div class="m-5">
			<h2><b>글 쓰 기</h2>
		</div>
		<form name="form" method="post" action="review_writeOk.jsp" enctype="multipart/form-data">
			<input type="hidden" name="r_id" value="<%= r_id %>">
			<input type="hidden" name="p_code" value="<%= p_code %>">
			<table>
				<tr height="50">
					<td width="80">
						작성자
					</td>
					<td width="80">
						<input name="r_name" type="text" value="<%= r_name %>" class="form-control form-control-sm" readonly="readonly">
					</td>
				</tr>
				<tr height="50">
					<td width="80">
						제목
					</td>
					<td colspan="2">
						<input name="r_title" type="text" size="50" class="form-control form-control-sm">
					</td>
				</tr>
				<tr height="50">
					<td width="80">첨부파일</td>
					<td colspan="3">
						<input type="file" name="r_fname" size="40" class="form-control-file">
					</td>
				</tr>
				<tr height="80">
					<td colspan="4">
						<textarea name="r_content" rows="5" class="form-control"></textarea>
					</td>
				</tr>
				<tr height="80">
					<td width="80">
						비밀번호
					</td>
					<td colspan="3">
						<input name="r_pwd" type="password" size="12" maxlength="12" class="form-control form-control-sm">
					</td>
				</tr>
				<tr height="80" align="center">
					<td colspan="3">
						<input type="submit" class="btn btn-primary" value="작성">&nbsp;
						<input type="button" class="btn btn-primary" value="목록" onclick="location.href='review_list.jsp?pageNum=<%=pageNum %>'">
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
