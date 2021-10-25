function check_ok(){
	if(document.form.u_id.value === "null"){
		location.href="Login.jsp";
	} else {
		document.form.submit();
	}
}