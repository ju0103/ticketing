<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- js check_ok ���� / ���� ��¥�� �ð� �߰� ����   --%>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>���� ���</h1>
	
		<%-- 10/27 �ѱ�ó�� => accept-charset="EUC-KR" �߰�  / ���ϸ� �ѱ��� �� ��� �� ���� ��������--%>	
		<form method="post" action="perfor_RegisterOk.jsp" enctype="multipart/form-data" accept-charset="EUC-KR">
		<table>
			<tr height="30">
				<td width="50">
					�帣
				</td>
				<td>
					<select name="p_type" >
					    <option value="none">=== ���� ===</option>
					    <option value="concerts">�ܼ�Ʈ</option>
					    <option value="musicals">������</option>
					    <option value="plays">����</option>
					    <option value="opera">�����/����</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="80">
					������
				</td>
				<td width="200">
					<input name="p_title" type="text">
				</td>
				<td>		 
					<input type="file" name="p_fname">  
				</td>
			</tr>
			<tr>
				<td width="80">
					�⿬��
				</td>
				<td width="200">
					<input name="p_performer" type="text">
				</td>
			</tr>
			<tr>
				<td width="80">
					���
				</td>
				<td width="250">
					<input type="text" name="p_area"> <%-- 10/24 ��� ��ǲ �±� ����  �ӽ� ���� --%>
				</td>
			</tr>
			<tr>
				<td width="80">
					�����Ͻ�
				</td>
				<td width="500">
					<input type="date" name="p_date">
				</td>
			</tr>
			<tr>
				<td width="80">
					�����ð�
				</td>
				<td width="200">
					<input name="p_time" type="text" width="100">��
				</td>
			</tr>
			<tr>
				<td width="80">
					��������
				</td>
				<td width="200">
					��<input name="p_rating" type="text" width="50">���̻�
				</td>
			</tr>
			<tr>
				<td width="80">
					�����ο�
				</td>
				<td width="200">
					<input name="p_seat" type="text" width="50">��
				</td>
			</tr>
			<tr>
				<td width="80">
					����
				</td>
				<td width="200">
					����<input name="p_price" type="text">��
				</td>
			</tr>
			<tr height="30">
				<td width="80">
					���� ����
				</td>
				<td colspan="4">
					<textarea name="p_description" rows="10" cols="65"></textarea>
				</td>
			</tr>
			<tr>
				<td width="80">
					��&nbsp;&nbsp;ȣ
				</td>
				<td colspan="3">
					<input name="manager_pwd" type="password" size="12" maxlength="12">
				</td>
			</tr>
			<tr height="50" align="center">
				<td colspan="4">
					<input type="submit" value="���">&nbsp;
					<input type="reset" value="�ٽ� �Է�">&nbsp;
					<input type="button" value="�������" onclick="location.href='perfor_List.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>