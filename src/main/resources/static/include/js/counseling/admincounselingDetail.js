$(function(){
    // 수정하기 버튼 클릭 시 이벤트 핸들러
    $("#sanctionBtn").click(function() {
        // 수정된 정보를 가져오기
        //var counselingId = ${CounselingDetail.counselingId};
        /*var counselingJudgment = $("#counselingJudgment").val();
        var counselingDetail = $("#counselingDetail").val();
        var counselingAdopt = $("#counselingAdopt").val();

        // 서버로 전달할 데이터 생성
        var data = {
            counselingId: counselingId,
            counselingJudgment: counselingJudgment,
            counselingDetail: counselingDetail,
            counselingAdopt: counselingAdopt
        };*/
        // form 요소에서 적격판정과 상담내용을 가져옵니다.
		var counselingJudgment = $('#counselingForm select[name="counselingJudgment"]').val();
		var counselingDetail = $('#counselingForm textarea#counselingDetail').val();
		var userId = $('#counselingForm input[name="userId"]').val();
		console.log(userId);
		// 데이터를 객체로 구성합니다.
		var data = {
		    counselingJudgment: counselingJudgment,
		    counselingDetail: counselingDetail,
		    userId : userId
		};

		switch(counselingJudgment){
			case '적격':
				ajaxRequest("/counseling/userCounselingUpdate", data)
					.then(() => {
						$("#counselingForm").attr({
							"method" : "post",
							"action" : "/counseling/adminCounselingUpdate"
						});
						$("#counselingForm").submit();
					})
			case '비적격':
				$("#counselingForm").attr({
					"method" : "post",
					"action" : "/counseling/adminCounselingUpdate"
				});
				$("#counselingForm").submit();
		}


/*
		ajaxRequest("/counseling/userCounselingUpdate", data)
		.then(() => {
			$("#counselingForm").attr({
				"method" : "post",
				"action" : "/counseling/adminCounselingUpdate"
			});
			$("#counselingForm").submit();
		})
*/
        // AJAX를 통해 서버로 데이터 전송
        /*$.ajax({
            type: "POST",
            url: "/counseling/admincounselingUpdate", // 수정 처리를 담당하는 서버의 URL
            data: data,
            success: function(response) {
                // 수정이 성공했을 때의 처리
                alert("수정이 완료되었습니다.");
                // 페이지 새로고침
                location.reload();
            },
            error: function(error) {
                // 수정이 실패했을 때의 처리
                alert("수정에 실패했습니다. 다시 시도해주세요.");
            }
        });*/
    });
});

function ajaxRequest(url, data) {
    return new Promise(function(resolve, reject) {
        $.ajax({
            type: "post",
            url: url,
            data: data,
            success: function(response) {
                resolve(response);
            },
            error: function(error) {
                reject(error);
            }
        });
    });
}