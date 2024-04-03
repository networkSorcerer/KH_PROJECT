 /**함수명 : chkData(유효성 체크 대상, 메시지 내용)
  * 출력영역 : alter로.
  * 예시 : if (!chkData("#keyword", "검색어를")) return;
  */
 function chkData(item, msg) {
	 // 알림으로 출력하게 해줌
	 if($(item).val().replace(/\s/g,"") == "") {
		 alert(msg+" 입력해 주세요.");
		 $(item).val("");
		 $(item).focus();
		 return false;
	 } else {
		 return true;
	 }
 }
 
 /* 
 함수명 : checkForm(유효성 체크 대상, 메시지 내용)
 출력 영역 : placeholder 속성을 이용.
 예시 : if(!checkForm("#keyword", "검색어를")) reutnr;
  */
 
 function checkForm(item,msg) {
	 let message = "";
	 if($(item).val().replace(/\s/g, "") == "") {
		 message = msg + "입력해 주세요.";
		 $(item).attr("placeholder", message);
		 return false;
	 } else {
		 return true;
	 }
 }
 
 /* dataCheck(유효성 체크 대상, 출력 영역, 메시지 내용) */
 function dataCheck(item, out, msg) {
	 // 영역을 받아와 출력하도록 해줌
	 if($(item).val().replace(/\s/g, "") == "") {
		 $(out).html(msg + " 입력해 주세요");
		 $(item).val("");
		 return false;
	 } else {
		 return true;
	 }
 }