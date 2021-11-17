<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ticketing.notice.noticeDBBean" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="notice" class="ticketing.notice.noticeBean" scope="page"/>
<jsp:setProperty name="notice" property="n_title"/>
<jsp:setProperty name="notice" property="n_content"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice 공지사항</title>
</head>
<body>
	<%
	
		notice.setN_date(new Timestamp(System.currentTimeMillis()));
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
		}else{
			if(notice.getN_title() == null || notice.getN_content() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()"); 
				script.println("</script>");
			}else{
				noticeDBBean n_DB = new noticeDBBean();
				int result = n_DB.write(notice.getN_title(), userID, notice.getN_content(), notice.getN_date());
				if(result == -1){
					System.out.println("@@@### uid = " + userID);
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()"); //id없을 경우 로긴페이지로 이동.
					script.println("</script>");
				}
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = './notice_List.jsp'"); //성공적으로 글 작성시
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>