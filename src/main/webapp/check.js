function fn_submit() {
	if(document.frm.v_jumin.value.trim() == "") {
		alert("주민번호가 입력되지 않았습니다!")
		frm.v_jumin.focus();
		return false;
	}
	if(document.frm.v_name.value.trim() == "") {
		alert("성명이 입력되지 않았습니다.")
		frm.v_name.focus();
		return false;
	}
	if(document.frm.m_no.value.trim() == "") {
		alert("후보번호가 선택되지 않았습니다!")
		frm.m_no.focus();
		return false;
	}
	if(document.frm.v_time.value.trim() == "") {
		alert("투표시간이 입력되지 않았습니다!")
		frm.v_time.focus();
		return false;
	}
	if(document.frm.v_area.value.trim() == "") {
		alert("투표장소가 입력되지 않았습니다!")
		frm.v_area.focus();
		return false;
	}
	if(document.frm.v_confirm.value.trim() == "") {
		alert("유권자확인이 선택되지 않았습니다!")
		frm.v_confirm.focus();
		return false;
	}
	
	alert("투표하기 정보가 정상적으로 등록 되었습니다.!")
	return true;
	
}

function fn_reset() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	
	document.frm.v_jumin.value = "";
	document.frm.v_name.value = "";
	document.frm.m_no.value = "none";
	document.frm.v_time.value = "";
	document.frm.v_area.value = "";
	document.getElementsByName("v_confirm")[0].checked=false;
	document.getElementsByName("v_confirm")[1].checked=false;
	
	frm.v_jumin.focus();
}
