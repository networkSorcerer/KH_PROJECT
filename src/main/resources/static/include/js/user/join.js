/* 전역 변수 설정 */
let idCheck = 0; 
let phoneCheck = 0;
let emailCheck = 0;

// 전체동의 체크박스
function selectAll(selectAll) {
    $('input[type="checkbox"]').prop('checked', selectAll.checked);
}

$(function(){
	
	/* 이름은 한글만 입력받게 하기 
	$("#userName").on("input", function(){
		this.value = this.value.replace(/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g, '');	
	});*/
	
	/* 핸드폰번호는 숫자만 입력받게 하기 */
	$("#userPhone").on("input", function(){
		this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
	});

	
	/* 아이디 유효성 체크, 중복 체크 */
	$("#idCheckBtn").on("click", function(){
		/* 아이디 유효성 검사 (첫글자 영문자로, 두번째부터 영문자와 숫자로 6글자 이상 15글자 이하.) */
		let userId = $("#userId").val();
        const idPattern = /(^[a-zA-Z][a-zA-Z0-9]{5,14}$)/g;  // 정규표현식 주기
		if (!chkData("#userId", "아이디를")) {
			return;
		} else if (!idPattern.test(userId)) {  // 패턴에 맞지 않았을 때 - 부정연산자 사용
            alert("아이디는 첫글자 영문자로, 두번째부터 영문자와 숫자로 \n6 ~ 15 글자수를 입력해주세요.");
            $("#userId").val("");
            $("#userId").focus();       
            return;
        }
        /* ajax 중복 체크 */
		$.ajax({ 
			url : "/user/idCheck",  
			type : "post",
			data : {
				"userId":userId
			},
			success: function(result) {
				if (result === 1) {                    
                    alert("존재하는 아이디입니다. 다른 아이디를 입력해주세요.");
                    $("#userId").val(""); 
                    $("#userId").focus();              
                } else {
                    alert("사용가능한 아이디입니다.");
                    $("#userPasswd").focus();
                    //아이디가 중복하지 않으면 idCheck = 1 
                    idCheck = 1;                 
                }
			},
			error: (xhr, textStatus, errorThrown) => {
				alert("AJAX 요청 실패:\n"+ textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
			}
		});				
	});	
	
	/* 아이디 중복 체크 후 다른 아이디로 다시 변경할 경우 이벤트 */
	$("#userId").on("change", function(){
		//console.log("아이디 입력값 변경 이벤트");
		idCheck = 0; // 중복체크 진행하도록 유도
	});

	
	/* 핸드폰 번호 유효성 체크, 중복 체크 */	
	$("#phoneCheckBtn").on("click", function(){
        let userPhone = $("#userPhone").val();
        const phonePattern = /(^01(?:0|1|[6-9])\d{7,8}$)/g; // 하이픈을 포함하지 않는 핸드폰번호
        //const phonePattern = /(^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$)/g;
        if (!chkData("#userPhone", "핸드폰번호를")) {
			return;
        } else if(!phonePattern.test(userPhone)) {
            alert("핸드폰번호 11자리를 입력하세요.");
            $("#userPhone").val("");
            $("#userPhone").focus();
            return;
        }
        /* ajax 중복 체크 */
        $.ajax({ 
			url : "/user/phoneCheck",  
			type : "post",
			data : {
				"userPhone":userPhone
			},
			success: function(result) {
				if (result === 1) {                    
                    alert("존재하는 번호입니다.");
                    $("#userPhone").val(""); 
                    $("#userPhone").focus();              
                } else {
                    alert("사용가능한 번호입니다.");
                    $("#userEmail").focus();
                    phoneCheck = 1;                 
                }
			},
			error: (xhr, textStatus, errorThrown) => {
				alert("AJAX 요청 실패:\n"+ textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
			}
		});	            
	});
	
	/* 중복 체크 후 다른 번호로 다시 변경할 경우 이벤트 */
	$("#userPhone").on("change", function(){	
		phoneCheck = 0; 
	});
	
	/* 이메일 유효성 체크, 중복 체크 */	
	$("#emailCheckBtn").on("click", function(){
        let userEmail = $("#userEmail").val();
        const emailPattern = /^[\w.%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
        if (!chkData("#userEmail", "이메일을")) { return;	
        }else if(!emailPattern.test(userEmail)) {
            alert("유효하지 않은 이메일 주소입니다. 다시 입력하세요.");
            $("#userEmail").val("");
            $("#userEmail").focus();
            return;
        }
        /* ajax 중복 체크 */
        $.ajax({ 
			url : "/user/emailCheck",  
			type : "post",
			data : {
				"userEmail":userEmail
			},
			success: function(result) {
				if (result === 1) {                    
                    alert("존재하는 이메일입니다.");
                    $("#userEmail").val(""); 
                    $("#userEmail").focus();              
                } else {
                    alert("사용가능한 이메일입니다.");
                    emailCheck = 1;                 
                }
			},
			error: (xhr, textStatus, errorThrown) => {
				alert("AJAX 요청 실패:\n"+ textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
			}
		});		       
	});	
	
	/* 중복 체크 후 다른 이메일로 다시 변경할 경우 이벤트 */
	$("#userEmail").on("change", function(){		
		emailCheck = 0; 
	});
	
	/* 개인정보 동의 및 회원약관 동의 체크 시 전체 동의 체크 */
	$('#agreePrivInfo, #agreeTerms').click(function() {
	    if ($('#agreePrivInfo').is(':checked') && $('#agreeTerms').is(':checked')) {
	        $('#check-all').prop('checked', true);
	    } else {
	        $('#check-all').prop('checked', false);
	    }
	});
	
	/* 회원약관 팝업창 출력 */
	$('.openPopup').click(function(e) {
	    e.preventDefault();
	    var url = $(this).attr('href');
	    var width = 810;
	    var height = 700;
	    var top = 100;
	    var left = 100;
	    var options = 'width=' + width + 'px, height=' + height + 'px, top=' + top + 'px, left=' + left + 'px, toolbars=no, scrollbars=no, resizable=no';
	    window.open(url, '_blank', options);
	  });
	
	
	/* 회원 가입 버튼 클릭 시 처리 이벤트 */
	$("#joinBtn").on("click", function() {					
		// 회원가입 폼 입력값 체크, 유효성 검사
		
		/* 아이디 중복 검사 확인 */
		if (idCheck == 0) {
			alert("아이디 중복검사를 진행해주세요");
			$("#userId").focus();
			return;
		}		
		/* 핸드폰번호 중복 검사 확인 */
		if (phoneCheck == 0) {
			alert("핸드폰번호 중복검사를 진행해주세요");
			$("#userPhone").focus();
			return;
		}
		/* 이메일 중복 검사 확인 */
        if (emailCheck == 0) {
			alert("이메일 중복검사를 진행해주세요");
			$("#userEmail").focus();
			return;
		}
		
        /* 비밀번호 유효성 검사 */
        let userPasswd = $("#userPasswd").val();
        const pwdPattern = /(^[a-zA-Z0-9]{8,20}$)/g;
		if (!chkData("#userPasswd", "비밀번호를")) {
			return;		
        // 비밀번호 8자~20자 유효성 검사
        }else if (!pwdPattern.test(userPasswd)) {
            alert("비밀번호는 영문/숫자 8 ~ 20자리로 입력해주세요.");
            $("#userPasswd").val("");
            $("#userPasswd").focus();
            return;
        }
             
        let userPasswdCheck = $("#userPasswdCheck").val();
        if (!chkData("#userPasswdCheck", "비밀번호 확인을")) {
			return;	
        // 비밀번호 일치여부 확인
        } else if (userPasswd != userPasswdCheck) {
            $("span[name='error']").attr("placeholder", "비밀번호와 비밀번호 확인은 일치해야 합니다.");
            alert("비밀번호와 비밀번호 확인은 일치해야 합니다.\n다시 입력해 주세요.");
            $("#userPasswdCheck").val("");
            $("#userPasswdCheck").focus();
            return;
        }

        /* 이름 입력 검사 (한글 2~6자) */
        let userName = $("#userName").val();
		const namePattern = /^[가-힣]{2,6}$/g; 
		if (!chkData("#userName", "이름을")) {
			return;
		// 한글 2~6자 유효성 검사
        } else if(!namePattern.test(userName)) {
            alert("이름은 한글 2~6자로 입력해주세요");
            $("#userName").val("");
            $("#userName").focus();
            return;
        }      		
        /* 동의 체크박스 선택여부 검사 */
        if(!$("#check-all").is(":checked")) {
            alert("동의 항목 모두 체크 하셔야 가입 가능합니다.");
            return;
        }
		
		/* 회원가입 최종 확인 */		
		if (confirm("회원가입을 진행하시겠습니까?")){			
			$("#joinForm").attr({
				"method":"post",
				"action":"/user/join"				
			});
			$("#joinForm").submit();
			alert("회원가입 성공");
		} else {
			alert("회원가입 취소");
		}
		
	});
		
});

function phoneFormat(phoneNumber) {
	console.log("phoneFormat()호출");
  // 특수문자 제거
  const value = phoneNumber.replace(/[^0-9]/g, '');
  console.log(value);
  // 00 OR 000 지정
  const firstLength = value.length > 9 ? 3 : 2;

  // ({2,3}) - ({3,4}) - ({4})
  return [
    // 첫번째 구간 (00 or 000)
    value.slice(0, firstLength),
    // 두번째 구간 (000 or 0000)
    value.slice(firstLength, value.length - 4),
    // 남은 마지막 모든 숫자
    value.slice(value.length - 4),
  ].join('-');
}



