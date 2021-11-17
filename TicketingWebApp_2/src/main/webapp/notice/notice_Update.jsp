<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="ticketing.notice.noticeBean" %>
<%@ page import="ticketing.notice.noticeDBBean" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width", initial-scale="1">
	<link href="../css/styles.css" rel="stylesheet" />
	<title>Notice 공지사항</title>
</head>
<body>
	<%
		String userID = null; 
		if(session.getAttribute("manager") != null){
			userID = (String) session.getAttribute("manager_id");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = '../manager/managerLoginForm.jsp'");
			script.println("</script>");//로그인 안되어있을때, 로긴 페이지로 이동
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
		if(!userID.equals(nBean.getN_userID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = '../notice/notice_List.jsp'");
			script.println("</script>");
		}
	%>
	<jsp:include page="../managerMain/manager_Header.jsp" />
	
	<div class="container">
		<div class="row">
			<form method="post" action="../notice/notice_UpdateOk.jsp?n_code=<%= n_code %>">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">공지사항 수정</th>						
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="n_title" maxlength="50" value="<%= nBean.getN_title()%>"> </td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="n_content" maxlength="2050" style="height: 350px;"><%= nBean.getN_content()%></textarea></td>					
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-outline-primary btn-sm" value="수정">
			</form>
		</div>
	</div>
	
	<jsp:include page="../managerMain/manager_Footer.jsp" />
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>