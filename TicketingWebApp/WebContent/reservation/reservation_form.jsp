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
	// �� �ޱ�
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

    // ���� �Ϸ�� �¼� �ҷ�����
    ReservationDBBean rdb = ReservationDBBean.getInstance();
    ArrayList<String> seatList = rdb.checkSeat(p_code);
    
    // A, B, C, D ������ ����
    Collections.sort(seatList, new AscendingString());
	
	// �¼� ��, �� ��
	int row = 10;
	int col = 10;
	int width = 30 + col * 30 + col / 5 * 20 - 20;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<style>
		table input[type="checkbox"] {
			border: 1px solid red;
			background-color: black;
		}
	</style>
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
			alert("�¼��� 1�������� �����մϴ�.");
			return;
		}
		form.submit();
	}
	</script>
</head>
<body>
	<form method="post" action="reservation_pay.jsp">
		<input type="hidden" name="p_code" value="<%= p_code %>">
		<input type="hidden" name="p_price" value="<%= p_price %>">
		<table width="<%= width %>">
			<tr>
				<td colspan="12" align="center" bgcolor="#ccc">screen</td>
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
					<input type="button" value="�����ϱ�" onclick="reservation();">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>