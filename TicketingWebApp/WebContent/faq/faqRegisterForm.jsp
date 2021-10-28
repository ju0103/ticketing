<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>FAQ 등록</title>
</head>
<body>
	<form method="post" action="./faqRegisterOk.jsp">
		<table border="1">
			<tr>
				<td>FAQ 유형</td>
				<td>
					<label><input type="radio" name="faq_type" value="티켓예매/발권">티켓예매/발권</label>
					<label><input type="radio" name="faq_type" value="티켓수령">티켓수령</label>
					<label><input type="radio" name="faq_type" value="취소/환불">취소/환불</label>
					<label><input type="radio" name="faq_type" value="기타">기타</label>
				</td>
			</tr>
			<tr>
				<td>질문</td>
				<td>
					<input type="text" name="faq_quest">
				</td>
			</tr>
			<tr>
				<td>답변</td>
				<td>
					<textarea cols="100" rows="10" name="faq_answer"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>
</body>
</html>