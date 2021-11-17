<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- js check_ok 예정 / 공연 날짜에 시각 추가 예정   --%>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="../js/check.js" charset="utf-8" ></script>
<link href="../css/styles.css" rel="stylesheet" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function addressPopup() {
        new daum.Postcode({
            oncomplete: function(data) {
               
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

</head>
<body>
	<jsp:include page="../managerMain/manager_Header.jsp" />	
	
	<!-- manager register form -->
	<div class="container py-5">
		<div class="text-center mb-5">
			<h2 class="fw-bolder">공연 등록</h2>
		</div>
		<form id="contactForm" method="post" action="./performance_RegisterOk.jsp" name="reg_frm" enctype="multipart/form-data" accept-charset="EUC-KR">
			<div class="mb-3">
				<label class="form-label" for="type">장르</label>
				<select class="form-control" name="p_type" >
					    <option value="">=== 선택 ===</option>
					    <option value="concerts">콘서트</option>
					    <option value="musicals">뮤지컬</option>
					    <option value="plays">연극</option>
					    <option value="opera">오페라/무용</option>
				</select>
			</div>	
			<div>
			<label class="form-label" for="type">포스터</label>
			<input class="form-control" type="file" name="p_fname">
			</div>  
			<div class="mb-3">
				<label class="form-label" for="title">공연명</label>
				<input class="form-control" id="p_title" name="p_title" type="text" placeholder="공연명">
			</div>
			<div class="mb-3">
				<label class="form-label" for="performer">출연진</label>
				<input class="form-control" id="p_performer" name="p_performer" type="text" placeholder="출연진">
			</div>
			<div class="mb-3">
				<label class="form-label" for="area">장소</label><br>
				<input  type="text" id="sample6_postcode" placeholder="우편번호">
				<input  type="button" onclick="addressPopup()" value="우편번호 찾기"><br>
				<input  type="text" id="sample6_address" size="50" placeholder="주소" name="p_area"><br>
				<input  type="text" id="sample6_detailAddress" size="20" placeholder="상세주소" name="p_detailarea">
				<input  type="text" id="sample6_extraAddress" size="30" placeholder="참고항목">
			</div>
			<div class="mb-3">
				<label class="form-label" for="date">공연일시</label>
				<input class="form-control" id="p_date" name="p_date" type="datetime-local">
			</div>
			<div class="mb-3">
				<label class="form-label" for="time">공연시간</label>
				<input class="form-control" id="p_time" name="p_time" type="number" placeholder="공연시간">
			</div>
			<div class="mb-3">
				<label class="form-label" for="rating">관람연령</label>
				<input class="form-control" id="p_rating" name="p_rating" type="number" placeholder="관람연령">
			</div>
			<div class="mb-3">
				<label class="form-label" for="seat">관람인원</label>
				<input class="form-control" id="p_seat" name="p_seat" type="number" placeholder="관람인원">
			</div>
			<div class="mb-3">
				<label class="form-label" for="price">가격</label>
				<input class="form-control" id="p_price" name="p_price" type="number" placeholder="가격">
			</div>
			<div class="mb-3">
				<label class="form-label" for="description">공연 설명</label>
				<textarea class="form-control" id="p_description" name="p_description" rows="10" cols="65" placeholder="내용을 입력하세요."></textarea>
			</div>
			<div class="mb-3">
				<label class="form-label" for="pwd">암호</label>
				<input class="form-control" id="manager_pwd" name="manager_pwd" type="password">
			</div>
			<div class="d-grid">
				<button class="btn btn-primary btn-lg" type="button" onclick="perforCheck_ok()">등록</button><br>
				<button class="btn btn-primary btn-lg" type="reset">다시 입력</button>
			</div>
		</form>
	</div>
	

	<jsp:include page="../managerMain/manager_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
	
</html>