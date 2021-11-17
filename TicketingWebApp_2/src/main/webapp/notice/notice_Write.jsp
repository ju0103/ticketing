<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width", initial-scale="1">
	<link href="../css/styles.css" rel="stylesheet" />
	<title>Notice 공지사항</title>
</head>
<body>
	<jsp:include page="../managerMain/manager_Header.jsp" />

	<div class="container py-4">
		<div class="text-center mt-5" >
			<h2 class="text-center mb-5 fw-bolder align-middle">공지사항 등록</h2>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<form method="post" action="../notice/notice_Writeok.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">공지사항 등록</th>						
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="n_title" maxlength="50"> </td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="n_content" maxlength="2050" style="height: 350px;"></textarea></td>						
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-outline-primary btn-sm" value="글쓰기">
			</form>
		</div>
	</div>
	
	<jsp:include page="../managerMain/manager_Footer.jsp" />
	
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>