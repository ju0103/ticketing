<%@page import="ticketing.review.ReviewDBBean"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<jsp:useBean id="board" class="ticketing.review.ReviewBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	int p_code = Integer.parseInt(request.getParameter("p_code"));
	int r_id = Integer.parseInt(request.getParameter("r_id"));
	String r_pwd = request.getParameter("r_pwd");
	String r_title = request.getParameter("r_title");
	String r_content = request.getParameter("r_content");
	
	System.out.println("review edit >>" + r_title);
	System.out.println("review edit >>" + r_content);
	board.setPerform_code(p_code);
	board.setReview_id(r_id);
	board.setReview_pwd(r_pwd);
	board.setReview_title(r_title);
	board.setReview_content(r_content);
	
	ReviewDBBean db = ReviewDBBean.getInstance();
	int re = db.editBoard(board);
	
	if(re == 1){
		response.sendRedirect("review_list.jsp?p_code=" + p_code);
	} else if(re == 0){
		%>
			<script type="text/javascript">
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);
			</script>
		<%
	} else if(re == -1){
		%>
			<script type="text/javascript">
				alert("수정에 실패하였습니다.");
				history.go(-1);
			</script>
		<%
	}
%>