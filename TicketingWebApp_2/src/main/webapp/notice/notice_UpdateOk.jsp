<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ticketing.notice.noticeDBBean" %>
<%@ page import="ticketing.notice.noticeBean" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice 공지사항</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("manager").equals("yes")){
			userID = (String) session.getAttribute("manager_id");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = '../manager/managerLoginForm.jsp'"); //id없을 경우 로긴페이지로 이동.
			script.println("</script>");
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
		}else{
			if(request.getParameter("n_title") == null || request.getParameter("n_content") == null
					|| request.getParameter("n_title").equals("")|| request.getParameter("n_content").equals("")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()"); //id없을 경우 로긴페이지로 이동.
				script.println("</script>");
			}else{
				noticeDBBean n_DB = new noticeDBBean();
				int result = n_DB.update(n_code, request.getParameter("n_title"), request.getParameter("n_content"));
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패했습니다.')");
					script.println("history.back()"); //id없을 경우 로긴페이지로 이동.
					script.println("</script>");
				}
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = '../notice/notice_List.jsp'"); //성공적으로 글 작성시
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>