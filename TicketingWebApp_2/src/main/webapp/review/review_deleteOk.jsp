<%@page import="ticketing.review.ReviewBean"%>
<%@page import="ticketing.review.ReviewDBBean"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	int p_code = Integer.parseInt(request.getParameter("p_code"));
	int r_id = Integer.parseInt(request.getParameter("r_id"));
	String r_pwd = request.getParameter("r_pwd");
		
	ReviewDBBean db = ReviewDBBean.getInstance();
	ReviewBean board = db.getBoard(p_code, r_id);
	
	String up = "D:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ticketingWebApp\\upload\\";
	
	int re = db.deleteBoard(r_id, p_code, r_pwd);
	
	if(re == 1){
		if(board.getReview_fname() != null){
			File file = new File(up + board.getReview_fname());
			file.delete();
		}
		response.sendRedirect("review_list.jsp?p_code=" + p_code);
	}else if(re == 0){
		%>
			<script type="text/javascript">
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);
			</script>
		<%
	}else if(re == -1){
		%>
			<script type="text/javascript">
				alert("삭제에 실패하였습니다.");
				history.go(-1);
			</script>
		<%
	}
%>