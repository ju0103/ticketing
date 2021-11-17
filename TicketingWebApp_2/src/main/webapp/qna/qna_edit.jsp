<%@page import="ticketing.qna.QnABean"%>
<%@page import="ticketing.qna.QnADBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	
	
	
	int p_code = Integer.parseInt(request.getParameter("p_code"));
	int q_no = Integer.parseInt(request.getParameter("q_no"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	QnADBBean db = QnADBBean.getInstance();
	QnABean qna = db.getQnA(p_code, q_no);
	String q_writer = qna.getQ_writer();
	String q_content = qna.getQ_content();
	String login_id="";
	int log; // 관리자는 2, 회원은 1, 비회원은 0
	
	if(session.getAttribute("member_id")!=null){
		login_id = (String)session.getAttribute("member_id");
		log = 1;
	}else{
		login_id = (String)session.getAttribute("manager_id");
		log = 2;
	}
	if(login_id == null){ //로그인X
		log = 0;
	}
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>티켓팅 QnA :: EDIT</title>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<!-- CSS -->
	<link href="../css/styles.css" rel="stylesheet" />
	<!-- 탭 메뉴 스크립트 -->
	<script>
	function layer_toggle(obj) {
        if (obj.style.display == 'none') obj.style.display = 'block';
        else if (obj.style.display == 'block') obj.style.display = 'none';
	}
	</script>

	<script type="text/javascript" src="qna.js" charset="utf-8"></script>
</head>
<body>
	<!-- navbar -->
<%
	if(log == 2){
%>
		<jsp:include page="../managerMain/manager_Header.jsp" />
<%
	}else{
%>
		<jsp:include page="../memberMain/member_Header.jsp" />
<%
	}
%>
	<center>
		<h1>수정하기</h1>
		<br>
		<form action="qna_edit_ok.jsp?p_code=<%=p_code%>&q_no=<%=q_no %>&pageNum=<%=pageNum %>&q_writer=<%= q_writer %>" method="post" name="form">
			<table width="1000" border="1">
				<tr height="100">
					<td width="200" align="center">작성자</td>
					<td><%= q_writer %></td>
				</tr>
				<tr height="100">
					<td align="center">문의내용</td>
					<td>
<textarea cols="100" rows="2" name="q_content" 
placeholder=" * 게시된 글의 저작권은 글을 작성한 회원에게 있습니다. 
 * 게시물로 인해 발생하는 문제는 게시자 본인에게 책임이 있습니다."><%= q_content %></textarea>
					</td>
				</tr>
				<tr><td colspan="2"><hr></td></tr>
				<tr align="center" height="100">
					<td colspan="2">
						<input type="submit" value="수정">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="취소">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="목록" onclick="location.href='qna_main.jsp?p_code=<%=p_code%>'">
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