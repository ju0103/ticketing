<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String p_code = request.getParameter("p_code");
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
<title>티켓팅 QnA</title>
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
		<h4 style="margin-top: 25px; margin-bottom: 25px; color: #708090">
			<p><b>Q&A 게시판은 여러분 모두 질문과 답변에 참여할 수 있는 공간입니다.</b></p>
		</h4>
		<p>예매/배송 관련 문의사항은 고객센터>1:1문의 또는 FAQ나 이용안내를 이용해주세요.
<%
		if(log == 0){ //비로그인상태에서는 qna_write.jsp를 include 하지 않음(안보임!)
%>
			<p>로그인을 해야 작성이 가능합니다.</p>
<%
		}else{ //매니저든 회원이든 로그인상태라면 qna_write.jsp를 include함
%>
			<jsp:include page="qna_write.jsp?p_code=<%=p_code%>"/>
<%
		}
%>		
		<br>
		<jsp:include page="qna_list.jsp?p_code=<%=p_code%>"/>
	</center>
	
<!-- footer -->
	<jsp:include page="../memberMain/member_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>