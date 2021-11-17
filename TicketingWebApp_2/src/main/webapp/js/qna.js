function check_ok(){
	if(document.form.q_content.value.length==0){
		alert("내용을 입력하세요.");
		form.q_content.focus();
		return;
	}
	document.form.submit();
}