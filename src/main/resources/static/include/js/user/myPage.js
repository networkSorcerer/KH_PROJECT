$(function(){
	// 회원 정보 수정 이동 
	$("#goUpdateBtn").on("click", function(){				
		location.href="/user/updateProfile";
	});	
		
	// 로그아웃 버튼
	$("#logoutBtn").on("click", function(){
		alert("로그아웃하여 메인페이지로 이동합니다.");
		location.href = "/user/logout";
	});
	
	// 회원탈퇴 버튼
	$("#withdrawalBtn").on("click", function(){
		let userId = $("#userId").val();
		console.log(userId);
		alert("회원탈퇴시 활동 내역이 모두 삭제됩니다.");
		if (confirm("정말 탈퇴하시겠습니까?")) {
			$.ajax({
                url: "/user/userWithdrawal", 
                type: "post", 
                data: {
					"userId":userId
				},
                success: function(result){
                    // 회원 탈퇴 성공 시 실행되는 코드
                    alert("회원 탈퇴가 성공적으로 처리되었습니다.");
                    location.href = "/user/logout"; // 로그아웃처리
                },
                error: function(xhr, status, error){
                    // 회원 탈퇴 실패 시 실행되는 코드
                    alert("회원 탈퇴 중 오류가 발생했습니다. 다시 시도해주세요.");
                    alert("AJAX 요청 실패:\n"+ textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
                    console.error(error); // 콘솔에 에러 로그를 출력합니다.
                }
            });				
		}
	});
			
});