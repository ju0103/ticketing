<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- js check_ok 예정 / 공연 날짜에 시각 추가 예정   --%>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>공연 등록</h1>
	
		<%-- 10/27 한글처리 => accept-charset="EUC-KR" 추가  / 파일명 한글일 때 출력 시 깨짐 현상있음--%>	
		<form method="post" action="perfor_RegisterOk.jsp" enctype="multipart/form-data" accept-charset="EUC-KR">
		<table>
			<tr height="30">
				<td width="50">
					장르
				</td>
				<td>
					<select name="p_type" >
					    <option value="none">=== 선택 ===</option>
					    <option value="concerts">콘서트</option>
					    <option value="musicals">뮤지컬</option>
					    <option value="plays">연극</option>
					    <option value="opera">오페라/무용</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="80">
					공연명
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
					출연진
				</td>
				<td width="200">
					<input name="p_performer" type="text">
				</td>
			</tr>
			<tr>
				<td width="80">
					장소
				</td>
				<td width="250">
					<input type="text" name="p_area"> <%-- 10/24 장소 인풋 태그 관련  임시 수정 --%>
				</td>
			</tr>
			<tr>
				<td width="80">
					공연일시
				</td>
				<td width="500">
					<input type="date" name="p_date">
				</td>
			</tr>
			<tr>
				<td width="80">
					공연시간
				</td>
				<td width="200">
					<input name="p_time" type="text" width="100">분
				</td>
			</tr>
			<tr>
				<td width="80">
					관람연령
				</td>
				<td width="200">
					만<input name="p_rating" type="text" width="50">세이상
				</td>
			</tr>
			<tr>
				<td width="80">
					관람인원
				</td>
				<td width="200">
					<input name="p_seat" type="text" width="50">명
				</td>
			</tr>
			<tr>
				<td width="80">
					가격
				</td>
				<td width="200">
					전석<input name="p_price" type="text">원
				</td>
			</tr>
			<tr height="30">
				<td width="80">
					공연 설명
				</td>
				<td colspan="4">
					<textarea name="p_description" rows="10" cols="65"></textarea>
				</td>
			</tr>
			<tr>
				<td width="80">
					암&nbsp;&nbsp;호
				</td>
				<td colspan="3">
					<input name="manager_pwd" type="password" size="12" maxlength="12">
				</td>
			</tr>
			<tr height="50" align="center">
				<td colspan="4">
					<input type="submit" value="등록">&nbsp;
					<input type="reset" value="다시 입력">&nbsp;
					<input type="button" value="목록으로" onclick="location.href='perfor_List.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>