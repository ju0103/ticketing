function check_ok(){
	if(reg_frm.manager_id.value.length == 0){
		alert("아이디를 써주세요.");
		reg_frm.manager_id.focus();
		return;
	}
	
	if(document.reg_frm.manager_pwd.value.length == 0){
		alert("패스워드는 반드시 입력해야 합니다.");
		reg_frm.manager_pwd.focus();
		return;
	}
	if(document.reg_frm.manager_pwd.value != document.reg_frm.check_pwd.value){
		alert("패스워드가 일치하지 않습니다.");
		reg_frm.check_pwd.focus();
		return;
	}
	if(reg_frm.manager_name.value.length == 0){
		alert("이름을 써주세요.");
		reg_frm.mem_name.focus();
		return;
	}

	
	document.reg_frm.submit();
	}
	
function perforCheck_ok(){
		if(reg_frm.p_type.value.length == 0){
		alert("장르를 선택해주세요.");
		reg_frm.p_type.focus();
		return;
	}
	
	if(reg_frm.p_title.value.length == 0){
		alert("공연명을 써주세요.");
		reg_frm.p_title.focus();
		return;
	}
	if(reg_frm.p_fname.value.length == 0){
		alert("포스터를 업로드해주세요.");
		reg_frm.p_title.focus();
		return;
	}
	if(reg_frm.p_performer.value.length == 0){
		alert("출연진을 써주세요.");
		reg_frm.p_performer.focus();
		return;
	}
	if(reg_frm.p_area.value.length == 0){
		alert("장소를 써주세요.");
		reg_frm.p_area.focus();
		return;
	}
	if(reg_frm.p_date.value.length == 0){
		alert("공연일시를 써주세요.");
		reg_frm.p_date.focus();
		return;
	}
	if(reg_frm.p_time.value.length == 0){
		alert("공연시간을 선택해주세요.");
		reg_frm.p_time.focus();
		return;
	}

	
	
	
	if(reg_frm.p_rating.value.length == 0){
		alert("관람연령을 써주세요.");
		reg_frm.p_rating.focus();
		return;
	}
	if(reg_frm.p_seat.value.length == 0){
		alert("관람인원을 써주세요.");
		reg_frm.p_seat.focus();
		return;
	}
	if(reg_frm.p_price.value.length == 0){
		alert("가격을 써주세요.");
		reg_frm.p_price.focus();
		return;
	}
	
	if(reg_frm.p_description.value.length == 0){
		alert("공연 설명을 써주세요.");
		reg_frm.p_description.focus();
		return;
	}
	if(reg_frm.manager_pwd.value.length == 0){
		alert("암호를 써주세요.");
		reg_frm.manager_pwd.focus();
		return;
	}
	
	document.reg_frm.submit();
	
	
}