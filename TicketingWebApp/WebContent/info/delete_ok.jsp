<%@page import="ticketing.info.BoardBean"%>
<%@page import="ticketing.info.BoardDBBean"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int b_id = Integer.parseInt(request.getParameter("b_id"));
	String b_pwd = request.getParameter("b_pwd");
	
	BoardDBBean db = BoardDBBean.getInstance();
	BoardBean board = db.getBoard(b_id);
	
	String up="D:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ticketingWebApp\\upload\\";
	String fname = board.getB_fname();
	
	int re = db.deleteBoard(b_id, b_pwd);
	
	if(re == 1){
		%>
			<script type="text/javascript">
				history.go(-2);
			</script>
		<%
		if(fname != null){
			File file=new File(up+fname);
			file.delete();
		}
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