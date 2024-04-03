$(function(){
	/* 아이디 찾기 */
	$("#findIdBtn").on("click", function(){
        let userEmail = $("#userEmail").val();
        const emailPattern = /^[\w.%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
        if (!chkData("#userEmail", "이메일을")) { return;	
        }else if(!emailPattern.test(userEmail)) {
            alert("유효하지 않은 이메일 주소입니다. 다시 입력하세요.");
            $("#userEmail").val("");
            $("#userEmail").focus();
            return;
        } else {
        	$("#findId").attr({
        		method:"post",
        		action:"/user/findId"
        	});
        	$("#findId").submit();
        }			
	});
	
	$("#resetPwdBtn").on("click", function(){
		location.href="/user/resetPwd";
	});
	
	$("#loginBtn").on("click", function(){
		location.href="/user/login";			
	});
	
	$("#logoutBtn").on("click", function(){
		alert("로그아웃하여 메인페이지로 이동합니다.");
		location.href = "/user/logout";
	});
});