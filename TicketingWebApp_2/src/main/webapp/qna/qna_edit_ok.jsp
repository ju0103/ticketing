<%@page import="ticketing.qna.QnADBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="QnA" class="ticketing.qna.QnABean" />
<jsp:setProperty property="*" name="QnA" />

<%	
	int p_code =  Integer.parseInt(request.getParameter("p_code"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	QnADBBean db = QnADBBean.getInstance();
	String login_id="";
	if(session.getAttribute("member_id")!=null){
		login_id = (String)session.getAttribute("member_id");
	}else{
		login_id = (String)session.getAttribute("manager_id");
	}
	int re = db.editQnA(QnA,login_id);
	
	if(re == 1){
		System.out.println("qna_edit_ok.jsp :: success");
		response.sendRedirect("qna_main.jsp?p_code="+p_code);
	}else if(re == 0){
%>
		<script language ="JavaScript">
			alert("수정은 본인만 할 수 있습니다.");
			history.go(-1);
		</script>
<%
	}else if(re == -1){//수정 실패했을 때
%>
		<script language ="JavaScript">
			alert("수정에 실패하였습니다.");
			history.go(-1);
		</script>
			
<%
	}else if(re ==2){
%>
		<script language ="JavaScript">
			alert("로그인을 하셔야합니다.");
			history.go(-1);
		</script>		
<%
			
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>