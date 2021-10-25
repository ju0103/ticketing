<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="ticket.ticketDAO"%>
<%@page import="ticket.ticketDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	
	String u_id = (String)session.getAttribute("user_id");
	int c_id = 1;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	SimpleDateFormat sdf2 = new SimpleDateFormat("MM월 dd일 (E)");
	SimpleDateFormat sdf3 = new SimpleDateFormat("hh시 mm분");
	ticketDAO db = ticketDAO.getInstance();
	ticketDTO info = db.getInfo(c_id);
	
	String c_title = "", c_desc = "", c_place = "", c_kind = "", c_performer = "";
	int c_price = 0, c_time = 0;
	Date c_date = null;
	
	c_title = info.getC_title();
	c_desc = info.getC_desc();
	c_place = info.getC_place();
	c_date = info.getC_date();
	c_price = info.getC_price();
	c_time = info.getC_time();
	c_kind = info.getC_kind();
	c_performer = info.getC_performer();
%>
<html>
	<script type="text/javascript" src="Info.js" charset="euc-kr"></script>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style type="text/css">
	div{
		border: 1px solid black;
	}
</style>
</head>
<body>
	<!-- session값 있으면 예매하기 눌렀을 때 Reservation.jsp로 이동 / 없으면 Login.jsp -->
	<form action="Reservation.jsp" method="post" name="form" enctype="multipart/form-data">
		<input type="hidden" name="u_id" value="<%= u_id %>">
		<input type="hidden" name="c_id" value="<%= c_id %>">
		<div class="container">
			<header>
				<div>
				<% 
					if(u_id == null) {
				%>
					<div>
						<a href="Main.jsp">메인</a>
					</div>
					<div>
						<a href="Login.jsp">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;	
						<a href="Register.jsp">회원가입</a>	
					</div>
				<% 
					} else {
				%>
					<div>
						<a href="Main_ok.jsp">메인</a>
					</div>
					<div>
						<%= u_id %>님 반갑습니다!&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="Logout.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="Mypage.jsp">마이페이지</a>	
					</div>
				<%		
					}
				%> 
				</div>
			</header>
			<div>
				<img alt="" src="image/banner.png">
			</div>
			<div>
				<img alt="" src="image/concert_poster_1.jpg" width="172"/>
			</div>
			<div>
				<div>
					<div><%= c_title %></div>
					<div><%= c_desc %></div>
				</div>
				<table>
					<tr>
						<td>공연 날짜</td>
						<td><%= sdf.format(c_date) %></td>
					</tr>
					<tr>
						<td>공연장</td>
						<td><%= c_place %></td>
					</tr>
					<tr>
						<td>관람시간</td>
						<td><%= c_time %>분</td>
					</tr>
					<tr>
						<td>구분</td>
						<td><%= c_kind %></td>
					</tr>
				</table>
			</div>
			<div>
				<table>
					<tr>
						<td>날짜 선택</td>
						<td>
							<select>
								<option><%= sdf2.format(c_date) %></option>
							</select>
						</td>
						<td>시간 선택</td>
						<td>
							<select>
								<option><%= sdf3.format(c_date) %></option>
							</select>
						</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td><%= c_price %>원</td>
						<td>
							<input type="button" value="예매하기" onclick="check_ok()">
						</td>
					</tr>
				</table>
			</div>
			<!-- iframe 말고 어떻게 ?? -->
			<div>
				<span>
					<a href="Info_detail.jsp" target="iframe">상세정보</a>
				</span>
				<span>
					<a href="Info_review.jsp" target="iframe">관람후기</a>
				</span>
				<span>
					<a href="Info_notice.jsp" target="iframe">예매안내</a>
				</span>
			</div>
			<div>
				<iframe src="Info_detail.jsp" name="iframe"></iframe>
			</div>
		</div>
	</form>
</body>
</html>