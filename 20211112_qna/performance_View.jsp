<%@page import="ticketing.performance.PerformanceBean"%>
<%@page import="ticketing.performance.PerformanceDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	PerformanceDBBean pdb = PerformanceDBBean.getInstance();
	PerformanceBean board = pdb.getBoard(Integer.parseInt(request.getParameter("p_code")));
	
	int p_code =  board.getP_code();
	String p_title = board.getP_title();
	String p_description = board.getP_description();
	String p_fname = board.getP_fname();
	String p_area = board.getP_area();
	String p_date = board.getP_date();
%>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../managerMain/manager_Header.jsp" />
		
	<center>
		<h1 class="fw-bolder">공연 상세 정보</h1>
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<td width="120">
					공연번호
				</td>
				<td>
					<%= p_code %>
				</td>
				<td width="120">
					공연제목
				</td>
				<td>
					<a href="performance_Detail.jsp?p_code=<%= p_code %>" ><%=p_title  %></a>
				</td>
			</tr>
			<tr>
				<td width="120">
					공연일자
				</td>
				<td>
					<%=p_date  %>
				</td>
				<td width="120">
					공연장소
				</td>
				<td>
					<%=p_area  %>
				</td>
			</tr>
			<tr>
				<td width="120">포스터</td>
				<td width="100" height="50"><img src="../upload/<%=p_fname %>" width="150" height="150"></td>
				<td width="120">공연내용</td>
				<td><%= p_description %></td>
			</tr>
		</table>
		<input class="btn btn-primary" type="button" value="수정" onclick="location.href='performance_UpdateForm.jsp?p_code=<%= p_code %>'">	
		<input class="btn btn-primary" type="button" value="삭제" onclick="location.href='performance_DeleteForm.jsp?p_code=<%= p_code %>'">			
	</center>

	<jsp:include page="../managerMain/manager_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>

</html>