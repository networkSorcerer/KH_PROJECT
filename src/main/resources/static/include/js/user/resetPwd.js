$(function(){
	/* 입력 영역, 출력 영역 구분 */
    //$(".inputArea").show();
	//$(".outputArea").hide();
	
	/* 비밀번호 재설정 */
	$("#resetPwdBtn").on("click", function(){      
	    let userId = $("#userId").val();
	    let userEmail = $("#userEmail").val();
	    //console.log(userId + " " + userEmail);
	    
        if (!chkData("#userId", "아이디를") || !chkData("#userEmail", "이메일을")) return;	

		// 비밀번호 리셋 후 비밀번호 리턴하는 함수 로직			
		// alert("임시 비밀번호 리턴 로직 실행");
		// 10자리 랜덤 비밀번호 생성 -> 보안성을 위해 자바단에서 메서드 구현
		//let tempPassword = generateRandomPassword(10);
		//console.log(tempPassword);
		//resetPwd(userId, userEmail);  // 임시 비밀번호로 비밀번호 재설정하는 함수 호출								
		findUserByIdAndEmail(userId, userEmail); // 회원 확인 후 성공하면 재설정 함수 호출

	});
	
	$("#copyTextBtn").on("click", function(){
        let textToCopy = $("#output").text();
        //console.log(textToCopy);
        
        // 텍스트를 클립보드에 복사하기 위해 임시로 textarea 요소 생성
        var tempTextarea = $("<textarea>");
        $("body").append(tempTextarea);
        tempTextarea.val(textToCopy).select();               
        document.execCommand("copy");     // 클립보드에 복사          
        tempTextarea.remove();// 임시로 만든 textarea 요소를 삭제합니다.

        //alert("Text copied to clipboard: " + textToCopy);
        alert("클립보드 복사 성공");
	});
	
	$("#loginBtn").on("click", function(){
		location.href="/user/login";			
	});
	
	$("#logoutBtn").on("click", function(){
		alert("로그아웃하여 메인페이지로 이동합니다.");
		location.href = "/user/logout";
	});

});



// 아이디 이메일로 회원 찾는 함수 : 리턴값이 1이면 true 반환
function findUserByIdAndEmail(userId, userEmail) {
	$.ajax({ 
		url : "/user/findUserByIdAndEmail",  
		type : "post",
		contentType:"application/json",
		data : JSON.stringify({
			"userId":userId,
			"userEmail":userEmail
		}),
		success: function(result) {
			if (result === 1) {    
				alert("회원 확인"); 
				console.log("폼 전송");
	            $("#resetPwd").attr({
	                method:"post",
	                action:"/user/resetPwd"
	            });
	            $("#resetPwd").submit();
            } else {
				alert("가입 정보가 없습니다. 아이디와 이메일을 확인해 주세요");          
            }
		},
		error: (xhr, textStatus, errorThrown) => {
			alert("회원찾기 AJAX 요청 실패:\n"+ textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");

		}
	});	
}

/* 임시 비밀번호 랜덤 생성 함수 - 보안성을 위해 자바단에서 메서드 구현하였음.
function generateRandomPassword(length) {
    var charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    var password = "";
    for (var i = 0; i < length; i++) {
        var randomIndex = Math.floor(Math.random() * charset.length);
        password += charset[randomIndex];
    }
    return password;
}*/

/* 임시 비밀번호 업데이트 
function resetPwd(userId, userEmail, tempPassword) {
	console.log(userId + " " + userEmail + " " + tempPassword);
	$.ajax({
		url: "/user/resetPwd",
		type: "post",
		contentType:"application/json",
		data: JSON.stringify({
			"userId":userId,
			"userEmail":userEmail,
			"userPasswd":tempPassword
		}),
		success: function(result) {
			if (result === 1) {    
				console.log("값 전달 성공 : true 리턴");                
                return true;             
            } else {
				console.log("값 전달 성공 : false 리턴");     
                return false;
            }
		},
		error: (xhr, textStatus, errorThrown) => {
			alert("임시비밀번호 업데이트 AJAX 요청 실패:\n"+ textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
			return false;
		}
	});
}*/