<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>������̼ǹ�</title>
	<!-- CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body style="padding-top:50px;">
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#navbar">
				<span class="sr-only">Toggle Navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="ticketing" href="#">Ticketing</a>
		</div>
		
		<div class="collapse navbar-collapse" id="navbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="./member/memberLoginForm.jsp">�α���</a></li>
				<li><a href="./member/memberRegister.jsp">ȸ������</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">����������</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">���� Ȯ��/���</a></li>
						<li class="divider"></li>
						<li><a href="./member/memberUpdateForm.jsp">ȸ������ ����</a></li>
						<li><a href="./member/memberDeleteForm.jsp">Ż���ϱ�</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="row">
		<div class="col-sm-6 col-md-4">
			<div class="poster">
				<img>
				<div class="caption">
					<h3><a href="#" class="btn btn-default" role="link">�̾���� �ܼ�Ʈ - �뱸</a></h3>
					<p>...
					</p>
					<p><a href="#" class="btn btn-primary" role="button">�����ϱ�</a></p>
				</div>
			</div>
		</div>
	</div>
	<!-- JQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- JS -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>