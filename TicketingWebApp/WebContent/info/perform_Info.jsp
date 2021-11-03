<%@page import="ticketing.info.BoardDBBean"%>
<%@page import="ticketing.performance.PerformanceBean"%>
<%@page import="ticketing.performance.PerformanceDBBean"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	BoardDBBean db = new BoardDBBean();	

	PerformanceDBBean pdb = PerformanceDBBean.getInstance();
	PerformanceBean board = pdb.getBoard(Integer.parseInt(request.getParameter("p_code")));
	
	int p_code =  board.getP_code();
	String p_title = board.getP_title();
	String p_description = board.getP_description();
	String p_perfomer = board.getP_performer();
	String p_area = board.getP_area();
	String p_type = board.getP_type();
	String p_date = board.getP_date();
	int p_price = board.getP_price();
	int p_ptime = board.getP_time();
	int p_rate = board.getP_rating();
	String p_rfname = board.getP_rfname();
%>        
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%= p_title %></title>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
	<!-- �� �޴� ��ũ��Ʈ -->
	<script>
		function openTab(evt, tabName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace("_active", "");
			}
			document.getElementById(tabName).style.display = "block";
			evt.currentTarget.className += "_active";
		}
	</script>
</head>
<body>
	<center>
	<form action="performInfo_ok.jsp" method="post" name="form" enctype="multipart/form-data">
		<jsp:include page="../memberMain/header.jsp"></jsp:include>
		<div class="container py-4">
			<div class="container">
				<div class="row p-4">
					<div class="col">
						<%
							if(p_rfname != null){
						%>
								<a href="../info/perform_Info.jsp?p_code=<%= p_code %>">
									<img src="../upload/<%=p_rfname %>" width="172">
								</a>
						<%
							}
						%>
					</div>
					<div class="col">
						<div>����: <%= p_title %></div>
						<div>����: <%= p_description %></div>
						<div>
							<table>
								<tr>
									<td>���� ��¥</td>
									<td>date</td>
									<td>������</td>
									<td>place</td>
								</tr>
								<tr>
									<td>�����ð�</td>
									<td><%= p_ptime %>��</td>
									<td>�������</td>
									<td><%= p_rate %></td>
								</tr>
								<tr>
									<td>�帣</td>
									<td><%= p_type %></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div>
					<table>
						<tr>
							<td>��¥ ����</td>
							<td>
								<select name="p_date">
									<option value="<%= p_date %>"></option>
								</select>
							</td>
							<td>�ð� ����</td>
							<td>
								<select name="p_time">
									<option></option>
								</select>
							</td>
							<td><%= p_price %> ��</td>
						</tr>
						<tr>
							<td>
								<input type="submit" value="�����ϱ�">
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- �� �޴��� -->
			<div>
				<span>
					<a class="tablinks_active" onclick="openTab(event, 'tab1')">
						������
					</a>
				</span>
				<span>
					<a class="tablinks" onclick="openTab(event, 'tab2')">
						�����ı�(<%= db.countBoard() %>)
					</a>
				</span>
				<span>
					<a class="tablinks" onclick="openTab(event, 'tab3')">
						QnA
					</a>
				</span>
				<span>
					<a class="tablinks" onclick="openTab(event, 'tab4')">
						���žȳ�
					</a>
				</span>
			</div>
			<!-- �� ���� ǥ�� -->
			<div id="tab1" class="tabcontent" style="display: block;"> 
				��1 ����
			</div>
			<div id="tab2" class="tabcontent" style="display: none;">
				<jsp:include page="list.jsp?p_code=<%=p_code %>"></jsp:include>
			</div>
			<div id="tab3" class="tabcontent" style="display: none;">
				��3 ����
			</div>
			<div id="tab4" class="tabcontent" style="display: none;">
				��4 ����
			</div>
		</div>
	</form>
	</center>
	<!-- footer -->
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>