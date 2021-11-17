<%@page import="ticketing.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="member" class="ticketing.member.MemberBean" />
<jsp:setProperty property="*" name="member"/>
<%
	// 수정 폼에서 아이디와 이름은 수정 불가한 부분이었으므로 세션의 정보를 얻어와 setter로 설정
	String memberId = (String)session.getAttribute("member_id");
	String memberName = (String)session.getAttribute("member_name");
	member.setMember_id(memberId);
	member.setMember_name(memberName);
	
	MemberDBBean db = MemberDBBean.getInstance();
	int result = db.updateMember(member);
	
	if (result == 1) {
%>
		<script>
			alert("회원 정보가 수정되었습니다.");
			document.location.href="../memberMain/member_Main.jsp";
		</script>
<%
	} else {
%>
		<script>
			alert("회원 정보 수정에 실패했습니다.");
			history.go(-1);
		</script>
<%
	}
%>