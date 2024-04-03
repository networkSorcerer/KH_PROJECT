$(function(){
	const fboard = '자유게시판';
	const vfboard = '봉사후기게시판';
	const afboard = '입양후이야기';
	const fcomment = '자유게시판 댓글';
	const vfcomment = '봉사후기게시판 댓글';
	const afcomment = '입양후이야기 댓글';
	const boardSort = document.getElementById("boardSort").innerText;
	const repcnt = document.getElementById("repcnt").value;
 
    // AJAX 요청을 수행하고 프로미스를 반환하는 함수 정의
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

	//신고 제재 버튼
	$("#sanctionBtn").on("click", () => {
	    // 첫 번째 AJAX 요청
	    //sanction table insert
	    ajaxRequest("/sanction/sanctionInsert", $("#f_data").serialize())
        .then(() => {
            // boardSort에 따라 다른 AJAX 요청을 선택적으로 실행
            //report_status modify
            let reportUpdateUrl;
            switch (boardSort) {
                case fboard:
                    reportUpdateUrl = "/report/reportUpdateFB";
                    break;
                case vfboard:
                    reportUpdateUrl = "/report/reportUpdateVB";
                    break;
                case afboard:
                    reportUpdateUrl = "/report/reportUpdateAB";
                    break;
                case fcomment:
                    reportUpdateUrl = "/report/reportUpdateFC";
                    break;
                case vfcomment:
                    reportUpdateUrl = "/report/reportUpdateVC";
                    break;
                case afcomment:
                    reportUpdateUrl = "/report/reportUpdateAC";
                    break;
                default:
                    // 기타 경우에는 추가적인 AJAX 요청이 필요 없음
                    return Promise.resolve();
            }
            // 선택된 AJAX 요청 실행
            return ajaxRequest(reportUpdateUrl, $("#f_data").serialize());
        })
        .then(() => {
			//게시글 삭제
			let sanctionUrl;
            switch (boardSort) {
                case fboard:
                    sanctionUrl = "/report/contentDeleteFB";
                    break;
                case vfboard:
                    sanctionUrl = "/report/contentDeleteVB";
                    break;
                case afboard:
                    sanctionUrl = "/report/contentDeleteAB";
                    break;
                case fcomment:
                    sanctionUrl = "/report/contentDeleteFC";
                    break;
                case vfcomment:
                    sanctionUrl = "/report/contentDeleteVC";
                    break;
                case afcomment:
                    sanctionUrl = "/report/contentDeleteAC";
                    break;
                default:
                    // 기타 경우에는 추가적인 AJAX 요청이 필요 없음
                    return Promise.resolve();
                }
                return ajaxRequest(sanctionUrl, $("#f_data").serialize());
		})
        .then(() => {
			//제재하기
			let sanctionUrl;
			switch(repcnt){
				case '1':	//repcnt = 1일때, 게시글 삭제 + 계정 정지
                    sanctionUrl = "/report/userStop";
					break;
				case '2':	//repcnt = 2일 때, 게시글 삭제 + 계정 정지
                    sanctionUrl = "/report/userDelete";
					break;
				default:
	                // 기타 경우에는 추가적인 AJAX 요청이 필요 없음
	                return Promise.resolve();
			}
            return ajaxRequest(sanctionUrl, $("#f_data").serialize());
		})
		//repcnt + 1
        .then(() => {
	            $("#f_data").attr({
	                "method": "post",
	                "action": "/report/repcntUpdate"
	            });
	            // 폼 제출
	            $("#f_data").submit();
        })

	});
	
	
	//신고 무시 버튼
	$("#reportDeleteBtn").on("click",() =>{
		//console.log("무시버튼 확인");
		if(boardSort == fboard){
			console.log("test");
			$("#f_data").attr({
				"method":"post",
				"action":"/report/reportUpdateFB",
			});
		}else if(boardSort == vfboard){
			$("#f_data").attr({
				"method":"post",
				"action":"/report/reportUpdateVB",
			});
		}else if(boardSort == afboard){
			$("#f_data").attr({
				"method":"post",
				"action":"/report/reportUpdateAB",
			});
		}else if(boardSort == fcomment){
			$("#f_data").attr({
				"method":"post",
				"action":"/report/reportUpdateFC",
			});
		}else if(boardSort == vfcomment){
			$("#f_data").attr({
				"method":"post",
				"action":"/report/reportUpdateVC",
			});
		}else if(boardSort == afcomment){
			$("#f_data").attr({
				"method":"post",
				"action":"/report/reportUpdateAC",
			});
		}
		$("#f_data").submit();

	});
	
	
})