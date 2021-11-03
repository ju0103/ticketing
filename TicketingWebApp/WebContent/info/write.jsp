<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.info.BoardBean"%>
<%@page import="ticketing.info.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	
	if (session.getAttribute("member") == null) {
		response.sendRedirect("../member/memberLoginForm.jsp");
	}

	String pageNum = request.getParameter("pageNum");

	int b_id=0, b_ref=1, b_step=0, b_level=0;
	String b_title="";
	
	if(request.getParameter("b_id") != null){
		b_id = Integer.parseInt(request.getParameter("b_id"));
	}
	
	BoardDBBean db = BoardDBBean.getInstance();
	BoardBean board = new BoardBean();
	
	board = db.getBoard(b_id);
	
	if(board != null){
		b_title = board.getB_title();
		b_ref = board.getB_ref();
		b_step = board.getB_step();
		b_level = board.getB_level();
	}
	
	if(pageNum == null) {
		pageNum="1";
	}
	
	ArrayList<BoardBean> boardList = db.listBoard(pageNum);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	
	int b_fsize=0;
	String b_name, b_content, b_fname;
	Timestamp b_date;
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<form name="form" method="post" action="write_ok.jsp" enctype="multipart/form-data">
			<input type="hidden" name="b_id" value="<%= b_id %>">
			<input type="hidden" name="b_ref" value="<%= b_ref %>">
			<table>
				<tr height="30">
					<td width="80">
						작성자
					</td>
					<td width="140">
						<input name="b_name" type="text">
					</td>
				</tr>
				<tr height="30">
					<td width="80">
						제목
					</td>
					<td colspan="2">
						<input name="b_title" type="text" size="50">
					</td>
				</tr>
				<tr height="30">
					<td width="80">첨부파일</td>
					<td colspan="3">
						<input type="file" name="b_fname" size="40">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea name="b_content" rows="10" cols="65"></textarea>
					</td>
				</tr>
				<tr>
					<td width="80">
						비밀번호
					</td>
					<td colspan="3">
						<input name="b_pwd" type="password" size="12" maxlength="12">
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="3">
						<input type="submit" value="작성">&nbsp;
						<input type="button" value="목록" onclick="location.href='perform_Info.jsp">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
