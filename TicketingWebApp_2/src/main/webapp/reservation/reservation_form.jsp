<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myUtil.AscendingString"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.reservation.ReservationDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="ticketing.performance.PerformanceBean"%>
<%@page import="ticketing.performance.PerformanceDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// 값 받기
	String p_code = request.getParameter("p_code");
	String member_id = (String)session.getAttribute("member_id");

	if (p_code == null || p_code == "null" || member_id == null || member_id == "null") {
%>
		<script>
			document.location.href="../member/member_LoginForm.jsp";
		</script>
<%
	}
    PerformanceDBBean pdb = PerformanceDBBean.getInstance();
    PerformanceBean performance = pdb.getPerformance(p_code);
    String p_title = performance.getP_title();
    String p_area = performance.getP_area();
    String p_date = performance.getP_date();
    String p_performer = performance.getP_performer();
    String p_fname = performance.getP_fname();
    String p_rfname = performance.getP_rfname();
    String p_detailarea = null;
    String p_description = performance.getP_description();
    
    int p_price = performance.getP_price();
    int p_seat = performance.getP_seat();
    int p_fsize = performance.getP_fsize();
    int p_ref = performance.getP_ref();
    int p_step = performance.getP_step();
    int p_level = performance.getP_level();
    int p_rating = performance.getP_rating();
    int p_time = performance.getP_time();
    
    Timestamp p_regdate = performance.getP_regdate();
    String p_formattedDate = p_date.substring(0, 10) + " " + p_date.substring(12);

    // 예매 완료된 좌석 불러오기
    ReservationDBBean rdb = ReservationDBBean.getInstance();
    ArrayList<String> seatList = rdb.checkSeat(p_code);
    
    // A, B, C, D 순으로 정렬
    Collections.sort(seatList, new AscendingString());
	
	// 좌석 행, 열 수
	int row = 10;
	int col = 10;
	int width = 30 + col * 30 + col / 5 * 20 - 20;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>좌석 선택</title>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
	<script>
	function reservation() {
		var form = document.forms[0];
		var row = "<%= row %>";
		var col = "<%= col %>";
		var n = 0;
		
		for (var i = 0; i < row * col; i++) {
			if (form.seat[i].checked == true) n++;
		}
		
		if (n < 1 || n > 1) {
			alert("좌석은 1개까지만 가능합니다.");
			return;
		}
		form.submit();
	}
	</script>
</head>
<body>
	<!-- navbar -->
	<jsp:include page="../memberMain/member_Header.jsp" />
	
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-9 col-lg-7 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-header">
						<b><%= p_title %></b><br />
						시간: <%= p_formattedDate %><br />
						장소: <%= p_area %><br />
					</div>
					<div class="card-body p-4 p-sm-5">
						<h5 class="card-title text-center mb-5 fw-light fs-5">좌석 선택</h5>
						<form method="post" action="reservation_pay.jsp">
							<input type="hidden" name="p_code" value="<%= p_code %>">
							<input type="hidden" name="p_price" value="<%= p_price %>">
							<center>
							<table width="<%= width %>">
								<tr>
									<td height="50" colspan="12" align="center" bgcolor="#ccc">무   대</td>
								</tr>
							</table>
							<table width="<%= width %>">
								<%
									String str, colN = "", rowN = "";
									String[] cols = new String[seatList.size()];
									String[] rows = new String[seatList.size()];
									int flag = -1;
									
									for (int i = 0; i < seatList.size(); i++) {
										String seatNum = seatList.get(i);
										cols[i] = seatNum.substring(0, 1);
										rows[i] = seatNum.substring(1);
									}
									
									for (char i = 'A'; i <= 'J'; i++) {
										out.println("<tr>");
										out.println("<td align='center'>" + i + "</td>");
										
										for (int k = 0; k < cols.length; k++) {
											if (cols[k].equals(Character.toString(i))) flag = k;
										}
										for (int j = 1; j <= col; j++) {
											if (j != 1 && j % 5 == 1) {
												out.println("<td>&nbsp;</td>");
											}
											out.println("<td align='center'>");
											str = String.valueOf(i) + j;
											
											if (flag != -1 && Integer.parseInt(rows[flag]) == j) {
												out.println("<input type='checkbox' name='seat' value='" + str + "' disabled='disabled'>");
												flag = -1;
											} else {
												out.println("<input type='checkbox' name='seat' value='" + str + "'>");														
											}
											out.println("</td>");
										}
										out.println("</tr>");
									}
								%>
								<tr>
									<td colspan="12">
										<input type="button" value="결제하기" onclick="reservation();">
									</td>
								</tr>
							</table>
							</center>
						</form>
	            	</div>
	        	</div>
	      	</div>
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