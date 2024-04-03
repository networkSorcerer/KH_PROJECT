$(function() {
	/* 제출 버튼 클릭 시 처리 이벤트 */
	$("#insertBtn").on("click", function() {
		if(!chkData("#volunteerTitle", "제목을")) return;
		else if(!chkData("#volunteerTime", "활동 기간을")) return;
		else if(!chkData("#volunteerDue", "마감 기한을")) return;
		else if(!chkData("#volunteerLimit", "제한 인원을")) return;
		else if(!chkData("#volunteerLocation", "활동 장소를")) return;
		else if(!chkData("#volunteerDetail", "세부사항을")) return;
		else {
			if($("#file").val() != "") {
				if(!chkFile($("#file"))) return;
			}
			$("#insertForm").attr({
				method : "post",
				enctype : "multipart/form-data",
				action : "/volunteer/volunteerInsert"
			});
			$("#insertForm").submit();
		}
	})
	
	$("#volunteerDue").on("change", function(){
		// 사용자가 날짜를 선택했을 때 호출되는 함수
	    var selectedDate = new Date(this.value); // 사용자가 선택한 날짜
	
	    // 시간대 고려
	    var offset = selectedDate.getTimezoneOffset(); // 사용자의 지역에서 UTC와의 시차 (분 단위)
	    selectedDate.setMinutes(selectedDate.getMinutes() + offset); // UTC 시간으로 변환
	
	    // 오후 6시로 설정
	    selectedDate.setUTCHours(18);
	    selectedDate.setUTCMinutes(0);
	
	    // 변경된 시간을 datetime-local input에 설정
	    var year = selectedDate.getUTCFullYear();
	    var month = ("0" + (selectedDate.getUTCMonth() + 1)).slice(-2);
	    var day = ("0" + selectedDate.getUTCDate()).slice(-2);
	    var hour = ("0" + selectedDate.getUTCHours()).slice(-2);
	    var minute = ("0" + selectedDate.getUTCMinutes()).slice(-2);
	    var formattedDate = year + "-" + month + "-" + day + "T" + hour + ":" + minute;
	    this.value = formattedDate;
	})
})


