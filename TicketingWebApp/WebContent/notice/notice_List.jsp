<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="ticketing.notice.noticeBean" %>
<%@ page import="ticketing.notice.noticeDBBean" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width", initial-scale="1">
	<link href="../css/styles.css" rel="stylesheet" />
	<title>Notice - 공지사항 관리자 페이지</title>
	<style type="text/css">
		a, a:hover {
			color: #000000;
			text-decoration: none;		
	}
	</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("manager").equals("yes")){
			userID = (String) session.getAttribute("manager_id");
		}
		String pageNum;
		pageNum = request.getParameter("pageNum") ;
		if(request.getParameter("pageNum") == null){
			pageNum = "1";
		}
	%>
	<jsp:include page="../managerMain/manager_Header.jsp" />
	
	<div class="container mt-3">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>						
					</tr>
				</thead>
				<tbody>
				<%
					noticeDBBean n_DB = new noticeDBBean();
					ArrayList<noticeBean> list = n_DB.listBoard(pageNum);
					for(int i = 0; i < list.size(); i++){
				%>
					<tr>
						<td>
							<%= list.get(i).getN_code() %>
						</td>
						<td align="center">
							<a href="./notice_View.jsp?n_code=<%= list.get(i).getN_code()%>"><%= list.get(i).getN_title() %></a>
						</td>
						<td align="center">
							<%= list.get(i).getN_userID() %>
						</td>
						<td>
							<%= list.get(i).getN_date() %>
						</td>					
					</tr>
				<% 
				}
				%>
				
				</tbody>
			</table>
			<%
				if(!pageNum.equals("1")){
			%>
				<a href="../notice/notice_List.jsp?pageNum=<%=Integer.parseInt(pageNum)-1%>" class="btn btn-outline-success btn-arraw-left">이전</a>
			<%
				}if(n_DB.nextPage(Integer.parseInt(pageNum)+1)){ //이거 안뜬 이유 : 매개변수 타입 int인데 string으로 넣음 
			%>
				<a href="../notice/notice_List.jsp?pageNum=<%=Integer.parseInt(pageNum)+1%>" class="btn btn-outline-success btn-arraw-left">다음</a>
			<%
				}
			%>
			<a href="../notice/notice_Write.jsp" class="btn btn-primary btn-sm">글쓰기</a>
		</div>
	</div>
	
	<jsp:include page="../managerMain/manager_Footer.jsp" />
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>