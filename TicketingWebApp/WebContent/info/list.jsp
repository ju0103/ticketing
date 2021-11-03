<%@page import="ticketing.info.BoardBean"%>
<%@page import="ticketing.info.BoardDBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){
		pageNum="1";
	}
	
	BoardDBBean db = BoardDBBean.getInstance();
	ArrayList<BoardBean> boardList = db.listBoard(pageNum);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
	
	int b_id=0, b_level=0, b_fsize=0;
	String b_name, b_title, b_content, b_fname;
	Timestamp b_date;
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<!-- 탭 메뉴 스크립트 -->
	<script>
	function layer_toggle(obj) {
        if (obj.style.display == 'none') obj.style.display = 'block';
        else if (obj.style.display == 'block') obj.style.display = 'none';
	}	
	</script>
</head>
<body>
	<center>
		<h4 style="margin-top: 50px; margin-bottom: 50px; color: RGB(80, 244, 90)">
			티켓 매매 및 양도,교환의 글은 사전 통보 없이 삭제될 수 있습니다.
		</h4>
		<hr>
		<table width="600">
			<tr>
				<td align="right">
					<a href="write.jsp?pageNum=<%=pageNum %>">글 쓰 기</a>
				</td>
			</tr>
		</table>
		<table width="800" border="1" cellspacing="0" >
			<tr height="25">
				<td width="450" align="center">글제목</td>
				<td width="120" align="center">작성자</td>
				<td width="130" align="center">작성일</td>
			</tr>
			<%
				for(int i=0; i<boardList.size(); i++){
					BoardBean board = boardList.get(i);
					b_id = board.getB_id();
					b_name = board.getB_name();
					b_title = board.getB_title();
					b_content = board.getB_content();
					b_date = board.getB_date();
					b_level = board.getB_level();
					b_fname = board.getB_fname();
					b_fsize = board.getB_fsize();
			%>
					<tr height="25" onmouseover="this.style.backgroundColor='#eeeeef'" 
									onmouseout="this.style.backgroundColor='#fff'">
						<td>
							<%
								if(b_fsize >0){
							%>
									<img src="../images/photo.png">							
							<%
								}
							%>
							<!-- 게시물 탭  -->
								<a id="hide<%= i %>" onclick="layer_toggle(document.getElementById('hide<%= i %>')); layer_toggle(document.getElementById('show<%= i %>')); return false;">
										<%= b_title %><br>
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
										<td width="100">
											<pre><%= b_content %></pre>
										</td>
									</tr>
									<tr height="30" align="center">
										<td colspan="2">
										<%
											if(b_fname != null){
										%>
												<img src="../upload/<%=b_fname %>" width="172">
										<%
											}
										%>
										</td>
									</tr>
								</table>
								<input type="button" value="수정" onclick="location.href='edit.jsp?b_id=<%=b_id %>'">
								<input type="button" value="삭제" onclick="location.href='delete.jsp?b_id=<%=b_id %>'">
							</div>
							<!-- 탭 내용 -->
						</td>
						<td align="center">
							<%= b_name %>
						</td>
						<td align="center">
							<%= sdf.format(b_date)%>
						</td>
					</tr>
			<%
				}
			%>
		</table>
		<%= BoardBean.pageNumer(4) %>
	</center>
</body>
</html>
