$(function() {
    // 각 항목의 변경 여부를 추적하는 변수
    let stateChanged = false;
	// 중복체크해야하는 개별 항목의 변경 여부를 추적하는 변수
	let isPasswordChanged = false; // 비밀번호 수정 버튼 토글시 변경됨
	let isNameChanged = false;
    let isPhoneChanged = false;
    let isEmailChanged = false;
    // 중복 체크 여부를 추적하는 변수    
    let isPhoneChecked = false;
    let isEmailChecked = false;
    // 기존비밀번호 일치 여부를 추적하는 변수
    let isPasswordChecked = false;
	
	// 입력란 클릭 시 값 선택
    $('#updateForm input:not(#userId)').on('click', function() {
        $(this).select();
    });  
      
    // 각 항목 값이 변경될 때마다 실행되는 함수
    $('.changable').on('input', function() {
        stateChanged = true; 
    }); 
    
    $('#username').on('input', function() {
    	isNameChanged = true; 
	});
    
    $('#userPhone').on('input', function() {
    	isPhoneChecked = false;
    	isPhoneChanged = true; 
	});
	
	// 이메일 입력란의 값이 변경될 때마다 호출되는 함수
	$('#userEmail').on('input', function() {
	    isEmailChecked = false;
	    isEmailChanged = true; 
	});
	
	/* 이름은 한글만 입력받게 하기 
	$("#userName").on("input", function(){
		this.value = this.value.replace(/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g, '');	
	});*/
	
	/* 핸드폰번호는 숫자만 입력받게 하기 */
	$("#userPhone").on("input", function(){
		this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
	});
	
            
 	// 비밀번호 수정 토글
    $('#passwordToggle').change(function() {
        if ($(this).is(':checked')) {
            $('#pwdConfirm').prop('disabled', false); // 기존 비밀번호 입력란 활성화
            $('#pwdConfirmBtn').prop('disabled', false); // 비밀번호 확인 버튼 활성화
            $('#pwdConfirm').attr('placeholder', '기존 비밀번호 입력'); // placeholder 변경
			isPasswordChanged = true;
        } else {
			$('#pwdConfirm').val("");
			$('#userPasswd').val("");  // 기존에 입력했더라도 체크 해제되면 값 초기화 
			$('#userPasswdCheck').val("");
            $('#pwdConfirm').prop('disabled', true); // 기존 비밀번호 입력란 비활성화
            $('#pwdConfirm').prop('readonly', true); // 기존 비밀번호 입력란 비활성화
            $('#pwdConfirmBtn').prop('disabled', true); // 기존 비밀번호 버튼 비활성화
            $('.new-password-area').hide(); // 새 비밀번호 입력란 숨기기
			isPasswordChanged = false;
            if (!isPhoneChanged && !isEmailChanged) {
				stateChanged = false;
			}
        }
    });   

	// 비밀번호 확인 버튼 클릭 시
    $('#pwdConfirmBtn').on('click', function() {		
		let pwdCf = $('#pwdConfirm').val();
		let userId = $('#userId').val();       
		
		/* ajax 비밀번호 일치 체크 */
		pwdConfirm(userId, pwdCf);
		if (pwdConfirm) {
			stateChanged = true;
			isPasswordChecked = true;
		}		
    });    
    
    // 핸드폰 번호 입력란의 값이 변경될 때마다 호출되는 함수
	$('#userPhone').on('input', function() {
		stateChanged = true;
	    // 입력된 값이 있는지 확인
	    let phoneNumber = $(this).val();
	    if (phoneNumber.trim() !== '') {
	        // 입력된 값이 있으면 중복 확인 버튼을 활성화
	        $('#phoneCheckBtn').prop('disabled', false);
	        isPhoneChecked = false;
	    } 
	});

	/* 핸드폰 번호 유효성 체크, 중복 체크 */	
	$("#phoneCheckBtn").on("click", function(){
        let userPhone = $("#userPhone").val();
        const phonePattern = /(^01(?:0|1|[6-9])\d{7,8}$)/g; // 하이픈을 포함하지 않는 핸드폰번호
        if (!chkData("#userPhone", "핸드폰번호를")) {
			return;
        } else if(!phonePattern.test(userPhone)) {
            alert("핸드폰번호 11자리를 입력하세요.");
            $("#userPhone").val("");
            $("#userPhone").focus();
            return;
        }
        /* ajax 중복 체크 */
        phoneCheck(userPhone);
        if (phoneCheck) {
			isPhoneChecked = true;
			$('#phoneCheckBtn').prop('disabled', true);
		}                  
	});
	
    // 이메일 입력란의 값이 변경될 때마다 호출되는 함수
	$('#userEmail').on('input', function() {
		stateChanged = true;
	    // 입력된 값이 있는지 확인
	    let userEmail = $(this).val();
	    if (userEmail.trim() !== '') {
	        // 입력된 값이 있으면 중복 확인 버튼을 활성화
	        $('#emailCheckBtn').prop('disabled', false);
	        isEmailChecked = false;
	    } 
	});

	/* 이메일 유효성 체크, 중복 체크 */	
	$("#emailCheckBtn").on("click", function(){
        let userEmail = $("#userEmail").val();
        const emailPattern = /^[\w.%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
        if (!chkData("#userEmail", "이메일을")) {
			return;
        } else if(!emailPattern.test(userEmail)) {
            alert("유효하지 않은 이메일 주소입니다. 다시 입력하세요.");
            $("#userEmail").val("");
            $("#userEmail").focus();
            return;
        }
        /* ajax 중복 체크 */
        emailCheck(userEmail);
        if (emailCheck) {
			isEmailChecked = true;
			$('#emailCheckBtn').prop('disabled', true);
		}                          
	});



	// 회원정보 수정 버튼 클릭 시
    $('#updateProfileBtn').on('click', function() {	        
	    let userId = $("#userId").val();   
	    let pwdConfirm = $("#pwdConfirm").val();
        let userPasswd = $("#userPasswd").val();
        let userPasswdCheck = $("#userPasswdCheck").val();
        let userName = $("#userName").val();
        let userphone = $("#userphone").val();
        let userEmail = $("#userEmail").val();
        //console.log(userId);
        
        if (!stateChanged) {
			alert("변경된 항목이 없습니다.");
			return;
		} 
		
		if (!chkData("#userName", "이름을")) return;
		if (!chkData("#userPhone", "핸드폰번호를")) return;
		if (!chkData("#userEmail", "이메일을")) return;		
		
        /* 새로운 비밀번호 유효성 검사 */
        if (isPasswordChanged && isPasswordChecked) { // 비밀번호 수정버튼 체크, 기존 비밀 번호를 확인했다면
	        const pwdPattern = /(^[a-zA-Z0-9]{8,20}$)/g;        
			if (!chkData("#userPasswd", "비밀번호를")) {
				return;		
	        } else if (!pwdPattern.test(userPasswd)) {
	            alert("비밀번호는 영문/숫자 8 ~ 20자리로 입력해주세요.");
	            $("#userPasswd").val("");
	            $("#userPasswd").focus();
	            return;
	        } else if (pwdConfirm == userPasswd) {
				alert("기존 비밀번호와 다른 새로운 비밀번호를 입력하세요.");
				return;
			}
	                     
	        if (!chkData("#userPasswdCheck", "비밀번호 확인을")) {
				return;		        
	        } else if (userPasswd != userPasswdCheck) {// 비밀번호 일치여부 확인
	            alert("비밀번호와 비밀번호 확인은 일치해야 합니다.\n다시 입력해 주세요.");
	            $("#userPasswdCheck").val("");
	            $("#userPasswdCheck").focus();
	            return;
	        }
		}
					
        /* 이름 입력 검사 (한글 2~6자) */
        if (isNameChanged) {
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
	        isNameChanged = false;
		}

		if (isPhoneChanged && !isPhoneChecked) {
			alert("핸드폰번호 중복검사를 진행해야 합니다.");
			$('#phoneCheckBtn').prop('disabled', false);
			return;				
		}
		
		if (isEmailChanged && !isEmailChecked) {
			alert("이메일 중복검사를 진행해야 합니다.");
			$('#emailCheckBtn').prop('disabled', false);
			return;				
		}


		if (confirm("입력한 값으로 수정하시겠습니까?")){
			$("#updateForm").attr({
				method:"post",
				action:"/user/updateProfile"
			});
			$("#updateForm").submit();
			alert("회원정보 수정 성공");
		} else {
			alert("회원정보 수정 취소");
		}
					
			
    });


	//취소버튼
	$("#updateCancelBtn").on("click", function() {
		// 초기값으로 폼 리셋
		$("#updateForm").each(function(){
			//console.log("취소버튼");			
			this.reset();
		});
		$('.new-password-area').hide(); // 새 비밀번호 입력란 숨기기
		// 상태 값 초기화
        stateChanged = false;
        isPhoneChecked = false;
        isEmailChecked = false;
    	isPasswordChecked = false;
	});
  
});


// 비밀번호 일치 확인 함수 : 일치하면 true
function pwdConfirm(userId, pwdCf) {
	$.ajax({ 
		url : "/user/pwdConfirm",  
		type : "post",
		contentType:"application/json",
		data : JSON.stringify({
			"userId":userId,
			"userPasswd":pwdCf
		}),
		success: function(result) {
			if (result == 0) {                    
                alert("비밀번호가 일치하지 않습니다.");
                $("#pwdConfirm").val(""); 
                $("#pwdConfirm").focus();   
                return false;           
            } else { // 일치하면
				$('#pwdConfirm').prop('disabled', true); // 기존 비밀번호 입력란 비활성화
				$('#pwdConfirmBtn').prop('disabled', true); // 비밀번호 확인 버튼 비활성화
				//$('#pwdConfirm').attr('placeholder', '아래에 새 비밀번호를 입력하세요.'); // placeholder 변경
				$('.new-password-area').show(); // 새 비밀번호 입력란 보이기
				$('#userPasswd').focus(); // 새 비밀번호 입력란으로 포커스 이동. 	
            	return true;								         
            }
		},
		error: (xhr, textStatus, errorThrown) => {
			alert("AJAX 요청 실패:\n"+ textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
			return false;
		}
	});
}

// 핸드폰번호 중복 체크 함수 : 중복하지 않으면 true
function phoneCheck(userPhone) {
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
                return false;            
            } else {
                alert("사용가능한 번호입니다.");
                $('#phoneCheckBtn').prop('disabled', true);               
             	return true;					
            }
		},
		error: (xhr, textStatus, errorThrown) => {
			alert("AJAX 요청 실패:\n"+ textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
			return false; 
		}
	});	
}


// 이메일 중복체크 함수 : 중복하지 않으면 true
function emailCheck(userEmail) {
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
                return false;             
            } else {
                alert("사용가능한 이메일입니다.");
                $('#emailCheckBtn').prop('disabled', true); 
                return true;
            }
		},
		error: (xhr, textStatus, errorThrown) => {
			alert("AJAX 요청 실패:\n"+ textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
			return false;
		}
	});	
}
