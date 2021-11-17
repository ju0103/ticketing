<%@page import="ticketing.review.ReviewBean"%>
<%@page import="ticketing.review.ReviewDBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%
	String pageNum = request.getParameter("pageNum");
	int p_code = Integer.parseInt(request.getParameter("p_code"));
	System.out.println("p_code: review >> " + p_code);
	if(request.getParameter("pageNum") == null){
		pageNum = "1";
	}
	
	if(request.getParameter("p_code") == null){
%>
		<script>
			history.go(-1);
		</script>
<%	}
	System.out.println("@@@###p_code ==>" + p_code);
	
	ReviewDBBean db = ReviewDBBean.getInstance();
	ArrayList<ReviewBean> reviewList = db.listBoard(pageNum, p_code);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
	
	int r_id = 0, r_fsize=0;
	String r_name, r_title, r_content, r_fname, r_rfname;
	Timestamp r_date;
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
	<jsp:include page="../memberMain/member_Header.jsp" />

	<div class="container">
		<div class="text-center mb-5">
			<h4 style="margin-top: 50px; margin-bottom: 50px; color: #708090">
				<p><b>티켓 매매 및 양도,교환의 글은 사전 통보 없이 삭제될 수 있습니다.</p>
			</h4>
			<a href="review_writeForm.jsp?p_code=<%=p_code %>&pageNum=<%=pageNum %>">글 쓰 기</a>
			<hr>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<table width="800" class="table">
				<tr>
					<td width="450" align="center">글제목</td>
					<td width="120" align="center">작성자</td>
					<td width="130" align="center">작성일</td>
				</tr>
				<%
					for(int i = 0; i < reviewList.size(); i++){
						ReviewBean review = reviewList.get(i);
						r_id = review.getReview_id();
						r_name = review.getReview_name();
						r_title = review.getReview_title();
						r_content = review.getReview_content();
						r_date = review.getReview_date();
						r_fname = review.getReview_fname();
						r_fsize = review.getReview_fsize();
						r_rfname = review.getReview_rfname();
				%>
						<tr>
							<td>
								<%
									if(r_fsize >0){
								%>
										<img src="../images/photo.png">							
								<%
									}
								%>
								<!-- 게시물 탭  -->
								<a id="hide<%= i %>" onclick="layer_toggle(document.getElementById('hide<%= i %>')); layer_toggle(document.getElementById('show<%= i %>')); return false;">
										<%= r_title %><br>
								</a>
								<!-- 탭 내용 -->
								<div id="show<%= i %>" style="display: none;">
									<table border="1" id="tab_content">
										<tr height="30">
											<td width="100" align="center">
												글내용
											</td>
										</tr>
										<tr height="30">
											<td width="1000">
												<pre><%= r_content %></pre>
											</td>
										</tr>
										<tr height="30" align="center">
											<td colspan="2">
											<%
												if(r_rfname != null){
											%>
													<img src="../upload/<%=r_rfname %>" width="172">
											<%
												}
											%>
											</td>
										</tr>
									</table>
									<input type="button" value="수정" onclick="location.href='review_edit.jsp?p_code=<%=p_code %>&r_id=<%=r_id %>'">
									<input type="button" value="삭제" onclick="location.href='review_delete.jsp?p_code=<%=p_code %>&r_id=<%=r_id %>'">
								</div>
								<!-- 탭 내용 -->
							</td>
							<td align="center">
								<%= r_name %>
							</td>
							<td align="center">
								<%= sdf.format(r_date)%>
							</td>
						</tr>
				<%
					}
				%>
			</table>
			<center>
			<%= ReviewBean.pageNumer(4) %>
			</center>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../memberMain/member_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>
