<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = session.getAttribute("member_id").toString();
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
   
   
</head>
<body>
	<jsp:include page="../memberMain/header.jsp" />
	
	<table>
					<%=id%><br>			
					<input type="button" value="배송지 관리">
	</table>
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="../memberMain/footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>

</body>
</html>