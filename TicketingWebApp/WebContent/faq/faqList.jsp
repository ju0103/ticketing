<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.faq.FaqBean"%>
<%@page import="ticketing.faq.FaqDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	FaqDBBean db = FaqDBBean.getInstance();
	
	int faq_code;
	String faq_type, faq_quest, faq_answer;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<style>
		.tab_menu {position: relative;}
		.tab_menu .list {overflow: hidden;}
		.tab_menu .list li {float: left; list-style: none;}
		.tab_menu .list .btn {margin-right:14px;}
		.tab_menu .list .cont {display:none; position: absolute; height: 500px;}
		.tab_menu .list li.is_on .cont {display:block;}
	</style>
</head>
<body>
	<a href="../managerMiain/managerMain.jsp">관리자 메인으로 돌아가기</a>
	<p>우형별 보기</p>
	<div class="tab_menu">
		<ul class="list">
			<li class="is_on">
				<a href="#tab1" class="btn">티켓예매/발권</a>
				<div id="tab1" class="cont">
					<table border="1">
						<tr>
							<td width="100">유형</td>
							<td width="300">질문</td>
							<td width="500">답변</td>
							<td width="50">수정</td>
							<td width="50">삭제</td>
						</tr>
						<%
							ArrayList<FaqBean> faqList = db.listFaq("티켓예매/발권");
							for (int i = 0; i < faqList.size(); i++) {
								FaqBean faq = faqList.get(i);
								faq_code = faq.getFaq_code();
								faq_type = faq.getFaq_type();
								faq_quest = faq.getFaq_quest();
								faq_answer = faq.getFaq_answer();
						%>
								<tr>
									<td><%= faq_type %></td>
									<td><%= faq_quest %></td>
									<td><%= faq_answer %></td>
									<td><a href="./faqUpdateForm.jsp?faq_code=<%= faq_code %>">수정</a></td>
									<td><a href="./faqDeleteOk.jsp?faq_code=<%= faq_code %>">삭제</a></td>
								</tr>
						<%
							}
						%>
					</table>
				</div>
			</li>
			<li class="is_on">
				<a href="#tab2" class="btn">티켓 수령</a>
				<div id="tab2" class="cont">
					<table border="1">
						<tr>
							<td width="100">유형</td>
							<td width="300">질문</td>
							<td width="500">답변</td>
							<td width="50">수정</td>
							<td width="50">삭제</td>
						</tr>
						<%
							faqList = db.listFaq("티켓수령");
							for (int i = 0; i < faqList.size(); i++) {
								FaqBean faq = faqList.get(i);
								faq_code = faq.getFaq_code();
								faq_type = faq.getFaq_type();
								faq_quest = faq.getFaq_quest();
								faq_answer = faq.getFaq_answer();
						%>
								<tr>
									<td><%= faq_type %></td>
									<td><%= faq_quest %></td>
									<td><%= faq_answer %></td>
									<td><a href="./faqUpdateForm.jsp?faq_code=<%= faq_code %>">수정</a></td>
									<td><a href="./faqDeleteOk.jsp?faq_code=<%= faq_code %>">삭제</a></td>
								</tr>
						<%
							}
						%>
					</table>
				</div>
			</li>
			<li class="is_on">
				<a href="#tab3" class="btn">취소 및 환불</a>
				<div id="tab3" class="cont">
					<table border="1">
						<tr>
							<td width="100">유형</td>
							<td width="300">질문</td>
							<td width="500">답변</td>
							<td width="50">수정</td>
							<td width="50">삭제</td>
						</tr>
						<%
							faqList = db.listFaq("취소/환불");
							for (int i = 0; i < faqList.size(); i++) {
								FaqBean faq = faqList.get(i);
								faq_code = faq.getFaq_code();
								faq_type = faq.getFaq_type();
								faq_quest = faq.getFaq_quest();
								faq_answer = faq.getFaq_answer();
						%>
								<tr>
									<td><%= faq_type %></td>
									<td><%= faq_quest %></td>
									<td><%= faq_answer %></td>
									<td><a href="./faqUpdateForm.jsp?faq_code=<%= faq_code %>">수정</a></td>
									<td><a href="./faqDeleteOk.jsp?faq_code=<%= faq_code %>">삭제</a></td>
								</tr>
						<%
							}
						%>
					</table>
				</div>
			</li>
			<li class="is_on">
				<a href="#tab4" class="btn">기타</a>
				<div id="tab4" class="cont">
					<table border="1">
						<tr>
							<td width="100">유형</td>
							<td width="300">질문</td>
							<td width="500">답변</td>
							<td width="50">수정</td>
							<td width="50">삭제</td>
						</tr>
						<%
							faqList = db.listFaq("기타");
							for (int i = 0; i < faqList.size(); i++) {
								FaqBean faq = faqList.get(i);
								faq_code = faq.getFaq_code();
								faq_type = faq.getFaq_type();
								faq_quest = faq.getFaq_quest();
								faq_answer = faq.getFaq_answer();
						%>
								<tr>
									<td><%= faq_type %></td>
									<td><%= faq_quest %></td>
									<td><%= faq_answer %></td>
									<td><a href="./faqUpdateForm.jsp?faq_code=<%= faq_code %>">수정</a></td>
									<td><a href="./faqDeleteOk.jsp?faq_code=<%= faq_code %>">삭제</a></td>
								</tr>
						<%
							}
						%>
					</table>
				</div>
			</li>
		</ul>
	</div>
</body>
<script>
const tabList = document.querySelectorAll('.tab_menu .list li');

for(var i = 0; i < tabList.length; i++){
  tabList[i].querySelector('.btn').addEventListener('click', function(e){
    e.preventDefault();
    for(var j = 0; j < tabList.length; j++){
      tabList[j].classList.remove('is_on');
    }
    this.parentNode.classList.add('is_on');
  });
}
</script>
</html>