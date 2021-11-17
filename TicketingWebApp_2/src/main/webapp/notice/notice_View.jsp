<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="ticketing.notice.noticeBean" %>
<%@ page import="ticketing.notice.noticeDBBean" %>
<%
	String userID = null;

	if(session.getAttribute("manager") != null){
		userID = (String) session.getAttribute("manager_id");
	}
	int n_code = 0;
	if(request.getParameter("n_code") != null){
		n_code = Integer.parseInt(request.getParameter("n_code"));
	} //n_code가 정상적으로 넘어왔다면 view페이지에서 그걸 담아서 처리하도록함
	if(n_code == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = '../notice/notice_List.jsp'");
		script.println("</script>");//번호가 존재해야 특정 글을 볼 수 있게 함.
	}
	noticeBean nBean = new noticeDBBean().getNoticeBean(n_code);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width", initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>Notice 공지사항</title>
</head>
<body>
	<%
		if (userID != null) {
	%>
			<jsp:include page="../managerMain/manager_Header.jsp" />
			<div class="container">
				<div class="row">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="3" style="background-color: #eeeeee; text-align: center;">공지사항 내용보기</th>						
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width: 20%;">글 제목</td>
								<td colspan="2"><%= nBean.getN_title() %></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="2"><%= nBean.getN_userID() %></td>
							</tr>
							<tr>
								<td>작성일자</td>
								<td colspan="2"><%= nBean.getN_date() %></td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="2" style="min-height: 200px; text-align: left;">
									<pre><%= nBean.getN_content().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></pre>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tr>
							<a href="../notice/notice_List.jsp" class="btn btn-outline-primary btn-sm">목록</a><br>
						</tr>
						<tr>
							<td colspan="2">
								<a href="./notice_Update.jsp?n_code=<%=n_code %>" class="btn btn-outline-secondary btn-sm">수정</a>
								<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="./notice_DeleteOk.jsp?n_code=<%=n_code %>" class="btn btn-outline-secondary btn-sm">삭제</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<jsp:include page="../managerMain/manager_Footer.jsp" />
			<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
			<script src="js/bootstrap.js"></script>
	<%
		} else {
	%>
			<jsp:include page="../memberMain/member_Header.jsp" />
			<div class="container">
				<div class="row">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="3" style="background-color: #eeeeee; text-align: center;">공지사항 내용보기</th>						
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width: 20%;">글 제목</td>
								<td colspan="2"><%= nBean.getN_title() %></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="2"><%= nBean.getN_userID() %></td>
							</tr>
							<tr>
								<td>작성일자</td>
								<td colspan="2"><%= nBean.getN_date() %></td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="2" style="min-height: 200px; text-align: left;">
									<pre><%= nBean.getN_content().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></pre>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tr>
							<td colspan="2"><a href="../notice/notice_List.jsp" class="btn btn-outline-primary btn-sm">목록</a></td>
						</tr>
					</table>
				</div>
			</div>
			<jsp:include page="../memberMain/member_Footer.jsp" />
			<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
			<script src="js/bootstrap.js"></script>
	<%
		}
	%>
	
</body>
</html>