<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.performance.PerformanceBean"%>
<%@page import="ticketing.performance.PerformanceDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- �ѱ� ���� ���� �� / ���� ������ ��ư �߰� ���� / ����¡  --%>
    <%
    PerformanceDBBean pdb = PerformanceDBBean.getInstance();
    ArrayList<PerformanceBean> perforList = pdb.listBoard();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   
    String  p_type, p_title,p_area,p_date,p_performer,p_fname,p_rfname;
    int p_code, p_price,p_seat,p_fsize,p_ref,p_step,p_level,p_rating;
    Timestamp p_regdate;
    %>

<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>Insert title here</title>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<%
		if ((String)session.getAttribute("manager") == "yes") {
	%>
			<center>
			<table width="800" border="1" cellspacing="0" >
					<tr height="25">
						<td width="100"  align="center">������</td>
						<td width="40" align="center">��Ϲ�ȣ</td>
						<td width="450" align="center">�ܼ�Ʈ ����</td>
						<td width="120" align="center">�⿬��</td>
						<td width="130" align="center">�����̸�</td>
						<td width="130" align="center">���������</td>
					</tr>	
					
				<%
						for(int i=0; i<perforList.size(); i++){
							PerformanceBean board = perforList.get(i);
							p_code = board.getP_code();
						 	p_title = board.getP_title();
							p_performer = board.getP_performer();
							p_rfname = board.getP_rfname();
							p_regdate = board.getP_regdate();
							p_fname = board.getP_fname();
					%>
							<tr height="25" bgcolor="#f7f7f7" 
											onmouseover="this.style.backgroundColor='#eeeeef'" 
											onmouseout="this.style.backgroundColor='#f7f7f7'">
								<td align="center">
								<%
									if(p_rfname != null){
										%>
									<img src="../upload/<%=p_fname %>" width="50" height="50">
										<%
									} else{
										%>
										<a href >������ ���</a>
										<%
									}
								%>
								</td>
									<td align="center">
										<%= p_code %>
									</td>
									<td>
										<a href="perfor_View.jsp?p_code=<%= p_code %>"><%= p_title %></a>
										
									</td>
									<td>
										<%= p_performer %>
									</td>
									<td>
										<%= p_rfname %>
									</td>
									<td>
										<%= sdf.format(p_regdate) %>
									</td>
								</tr>
									<%
						}
					%>
					
				</table>
				<input type="button" value="���" onclick="location.href='perfor_RegisterForm.jsp'">
			</center>
	<%
		} else {
	%>
			<section class="py-5">
				<div class="container px-4 px-lg-5 mt-5">
					<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
						<%
							for (int i = 0; i< perforList.size(); i++) {
								PerformanceBean board = perforList.get(i);
								p_code = board.getP_code();
							 	p_title = board.getP_title();
								p_performer = board.getP_performer();
								p_rfname = board.getP_rfname();
								p_fname = board.getP_fname();
						%>
								<div class="mb-5">
									<div class="card h-100">
										<a href="#">
											<img class="card-img-top" src="../upload/<%=p_fname %>" width="50" height="150">
											<div class="card-body text-center">
												<h6 class="card-title"><%= p_title %></h2>
											</div>
										</a>
									</div>
								</div>
						<%
							}
						%>
					</div>
				</div>
			</section>
	<%
		}
	%>

</body>
</html>